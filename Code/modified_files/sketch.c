#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <string.h>
#define __STDC_LIMIT_MACROS
#include "kvec.h"
#include "mmpriv.h"

// Added by me to print u_int64t
#include <inttypes.h>

// A = 0,  C = 1, G = 2, T/U = 3
unsigned char seq_nt4_table[256] = {
	0, 1, 2, 3,  4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 0, 4, 1,  4, 4, 4, 2,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 4, 4, 4,  3, 3, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 0, 4, 1,  4, 4, 4, 2,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 4, 4, 4,  3, 3, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,
	4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4,  4, 4, 4, 4
};

static inline uint64_t hash64(uint64_t key, uint64_t mask)
{
	// printf("Starting a new run within hash64\n");
	// printf("Original key was %" PRIu64 "\n", key);
	// printf("Original mask was %" PRIu64 "\n", mask);
	key = (~key + (key << 21)) & mask; // key = (key << 21) - key - 1;
	// printf("Modified key after step 1 = %" PRIu64 "\n", key);
	key = key ^ key >> 24;
	// printf("Modified key after step 2 = %" PRIu64 "\n", key);
	key = ((key + (key << 3)) + (key << 8)) & mask; // key * 265
	// printf("Modified key after step 3 = %" PRIu64 "\n", key);
	key = key ^ key >> 14;
	// printf("Modified key after step 4 = %" PRIu64 "\n", key);
	key = ((key + (key << 2)) + (key << 4)) & mask; // key * 21
	// printf("Modified key after step 5 = %" PRIu64 "\n", key);
	key = key ^ key >> 28;
	// printf("Modified key after step 6 = %" PRIu64 "\n", key);
	key = (key + (key << 31)) & mask;
	// printf("Modified key after step 7 = %" PRIu64 "\n", key);
	return key;
}

typedef struct { // a simplified version of kdq
	int front, count;
	int a[32];
} tiny_queue_t;

static inline void tq_push(tiny_queue_t *q, int x) 
// Pushes the element x to the top of the index = (current_front + count) % 32 (as they have done a bitwise and with 31)
// Increments count by 1
{
	q->a[((q->count++) + q->front) & 0x1f] = x;
}

static inline int tq_shift(tiny_queue_t *q)
// This is similar to a pop operation. Extract the element at front of the queue and return it. Also increment the front followed by a % 32.
// If count == 0, no element in the queue, cannot pop hence return -1. If not, decrement count after the operation.
{
	int x;
	if (q->count == 0) return -1;
	x = q->a[q->front++];
	q->front &= 0x1f;
	--q->count;
	return x;
}

/**
 * Find symmetric (w,k)-minimizers on a DNA sequence
 *
 * @param km     thread-local memory pool; using NULL falls back to malloc()
 * @param str    DNA sequence
 * @param len    length of $str
 * @param w      find a minimizer for every $w consecutive k-mers
 * @param k      k-mer size
 * @param rid    reference ID; will be copied to the output $p array
 * @param is_hpc homopolymer-compressed or not
 * @param p      minimizers
 *               p->a[i].x = kMer<<8 | kmerSpan
 *               p->a[i].y = rid<<32 | lastPos<<1 | strand
 *               where lastPos is the position of the last base of the i-th minimizer,
 *               and strand indicates whether the minimizer comes from the top or the bottom strand.
 *               Callers may want to set "p->n = 0"; otherwise results are appended to p
 */
void mm_sketch(void *km, const char *str, int len, int w, int k, uint32_t rid, int is_hpc, mm128_v *p)
{
	// printf("Printing RID = %" PRIu32 "\n", rid);
	// printf("Printing DNA sequence %s\n", str);
	// printf("Printing length of DNA sequence %d\n", len);
	// printf("Printing w %d\n", w);
	// printf("Printing k %d\n", k);

	uint64_t shift1 = 2 * (k - 1), mask = (1ULL<<2*k) - 1, kmer[2] = {0,0};

	// printf("shift1 = %" PRIu64 "\n", shift1);
	// printf("mask = %" PRIu64 "\n", mask);

	int i, j, l, buf_pos, min_pos, kmer_span = 0;
	mm128_t buf[256], min = { UINT64_MAX, UINT64_MAX };
	tiny_queue_t tq;

	assert(len > 0 && (w > 0 && w < 256) && (k > 0 && k <= 28)); // 56 bits for k-mer; could use long k-mers, but 28 enough in practice
	memset(buf, 0xff, w * 16);
	memset(&tq, 0, sizeof(tiny_queue_t));
	kv_resize(mm128_t, km, *p, p->n + len/w);

	for (i = l = buf_pos = min_pos = 0; i < len; ++i) 
	{
		// Converting the character read to an integer according to the matrix above.
		int c = seq_nt4_table[(uint8_t)str[i]];

		mm128_t info = { UINT64_MAX, UINT64_MAX };

		if (c < 4) // not an ambiguous base
		{ 
			
			int z;

			if (is_hpc) // Ignore this part of the code for now
			{
				int skip_len = 1;
				if (i + 1 < len && seq_nt4_table[(uint8_t)str[i + 1]] == c) {
					for (skip_len = 2; i + skip_len < len; ++skip_len)
						if (seq_nt4_table[(uint8_t)str[i + skip_len]] != c)
							break;
					i += skip_len - 1; // put $i at the end of the current homopolymer run
				}
				tq_push(&tq, skip_len);
				kmer_span += skip_len;
				if (tq.count > k) kmer_span -= tq_shift(&tq);
			} 

			else kmer_span = l + 1 < k? l + 1 : k; 
			// Analogous to the *filled* variable in jellyfish code, checks if k characters have been read for the kmer to be formed

			kmer[0] = (kmer[0] << 2 | c) & mask;           // forward k-mer
			kmer[1] = (kmer[1] >> 2) | (3ULL^c) << shift1; // reverse k-mer

			if (kmer[0] == kmer[1]) continue; // skip "symmetric k-mers" as we don't know their strand

			z = kmer[0] < kmer[1]? 0 : 1; // strand
			++l; // Increment filled

			if (l >= k && kmer_span < 256) //kmer of size atleast k successfully formed
			{
				// printf("kmer_span = %d\n", kmer_span); // Remains at 15 (=k) once l>=k
				// printf("rid = %" PRIu32 "\n", rid);
				info.x = hash64(kmer[z], mask) << 8 | kmer_span;
				info.y = (uint64_t)rid<<32 | (uint32_t)i<<1 | z;
				// printf("info.x = %" PRIu64 "\n", info.x);
				// printf("info.y = %" PRIu64 "\n", info.y);

			}
		} 
		else l = 0, tq.count = tq.front = 0, kmer_span = 0;

		buf[buf_pos] = info; // need to do this here as appropriate buf_pos and buf[buf_pos] are needed below

		if (l == w + k - 1 && min.x != UINT64_MAX) { // special case for the first window - because identical k-mers are not stored yet
			for (j = buf_pos + 1; j < w; ++j)
				if (min.x == buf[j].x && buf[j].y != min.y) kv_push(mm128_t, km, *p, buf[j]);
			for (j = 0; j < buf_pos; ++j)
				if (min.x == buf[j].x && buf[j].y != min.y) kv_push(mm128_t, km, *p, buf[j]);
		}

		if (info.x <= min.x) // a new minimum; then write the old min
		{ 
			if (l >= w + k && min.x != UINT64_MAX) kv_push(mm128_t, km, *p, min);
			min = info, min_pos = buf_pos;
		} 
		else if (buf_pos == min_pos) // old min has moved outside the window
		{ 
			if (l >= w + k - 1 && min.x != UINT64_MAX) kv_push(mm128_t, km, *p, min);
			
			for (j = buf_pos + 1, min.x = UINT64_MAX; j < w; ++j) // the two loops are necessary when there are identical k-mers
				if (min.x >= buf[j].x) min = buf[j], min_pos = j; // >= is important s.t. min is always the closest k-mer
			for (j = 0; j <= buf_pos; ++j)
				if (min.x >= buf[j].x) min = buf[j], min_pos = j;
			if (l >= w + k - 1 && min.x != UINT64_MAX) { // write identical k-mers
				for (j = buf_pos + 1; j < w; ++j) // these two loops make sure the output is sorted
					if (min.x == buf[j].x && min.y != buf[j].y) kv_push(mm128_t, km, *p, buf[j]);
				for (j = 0; j <= buf_pos; ++j)
					if (min.x == buf[j].x && min.y != buf[j].y) kv_push(mm128_t, km, *p, buf[j]);
			}
		}
		if (++buf_pos == w) buf_pos = 0;
	}
	if (min.x != UINT64_MAX)
		kv_push(mm128_t, km, *p, min);
}
