from Bio import SeqIO
import numpy as np

def hasher(key, mask):

    key = (~key + (key << 21)) & mask # key = (key << 21) - key - 1
    key = key ^ key >> 24
    key = ((key + (key << 3)) + (key << 8)) & mask # key * 265
    key = key ^ key >> 14
    key = ((key + (key << 2)) + (key << 4)) & mask # key * 21
    key = key ^ key >> 28
    key = (key + (key << 31)) & mask

    return key

def infoxer(hash, k):
    infox = (hash << 8) | k
    return infox

def reverse_strand(seq):

    rev_seq = ""
    for i in seq:
        if(i == "A"):
            rev_seq = rev_seq + "T"
        elif(i == "T"):
            rev_seq = rev_seq + "A"
        elif(i == "G"):
            rev_seq = rev_seq + "C"
        elif(i == "C"):
            rev_seq = rev_seq + "G"

    return rev_seq[::-1]

def code_char(c):

    if(c == "A"):
        return 0
    elif(c == "C"):
        return 1
    elif(c== "G"):
        return 2
    elif(c=="T"):
        return 3
    else:
        return -1

def create_dict(fasta_sequences, k, w):

    dicti = dict()

    # print("\n")

    kmer_int = 0
    kmer_int_rev = 0
    mask = 2**(2*k) - 1
    shift = 2*(k-1)
    MAX_INT = 18446744073709551615

    for fasta in fasta_sequences:

        sequence = str(fasta.seq)
        length = len(sequence)

        kmer_int_array = []
        kmer_int_rev_array = []
        hash_array = []
        hash_rev_array = []
        infox_array = []
        is_reverse_array = []
        pushed_kmer_array = list(np.zeros(length-k+1, dtype=int))

        for i in range(length):
            char_int = code_char(sequence[i])

            if(char_int >= 0):
                kmer_int = (kmer_int << 2 | char_int) & mask
                kmer_int_rev = (kmer_int_rev >> 2) | (3^char_int) << shift
            
            if(i >= (k-1)):
                hash = hasher(kmer_int, mask)
                hash_rev = hasher(kmer_int_rev, mask)
                infox = infoxer(hash, k)
                infox_rev = infoxer(hash_rev, k)
                kmer_int_array.append(kmer_int)
                kmer_int_rev_array.append(kmer_int_rev)
                hash_array.append(hash)
                hash_rev_array.append(hash_rev)
                if(kmer_int < kmer_int_rev):
                    infox_array.append(infox)
                    is_reverse_array.append(0)
                else:
                    infox_array.append(infox_rev)
                    is_reverse_array.append(1)

        array_length = len(infox_array)

        # print(infox_array)

        min_infox = MAX_INT
        min_infox_pos = -1

        for w_iterator in range(array_length-w+1):

            window_min_infox = MAX_INT
            window_min_infox_pos = -1

            for kmer_iterator in range(w_iterator, w_iterator+w):

                if(infox_array[kmer_iterator] <= window_min_infox): 
                    window_min_infox = infox_array[kmer_iterator]
                    window_min_infox_pos = kmer_iterator

            if(window_min_infox <= min_infox and window_min_infox_pos!=min_infox_pos and window_min_infox!=MAX_INT):

                min_infox = window_min_infox
                min_infox_pos = window_min_infox_pos
                min_string = sequence[min_infox_pos:min_infox_pos+k]

                if(is_reverse_array[window_min_infox_pos] == 1):
                    min_string = reverse_strand(min_string)

                # print("NEW MINIMIZER:", min_infox, min_infox_pos, min_string)

                if(pushed_kmer_array[min_infox_pos]==0):
                    if(min_string in dicti):
                        dicti[min_string] +=1
                    else:
                        dicti[min_string] = 1
                pushed_kmer_array[min_infox_pos] = 1

                for kmer_iterator in range(w_iterator, w_iterator+w):
                    if(infox_array[kmer_iterator] == window_min_infox): 
                        # print("I AM IN THE LOOP WITHIN IF1", kmer_iterator, infox_array[kmer_iterator], window_min_infox, window_min_infox_pos)
                        if(pushed_kmer_array[kmer_iterator]==0):
                            pushed_kmer_array[kmer_iterator] = 1
                            rand_string = sequence[kmer_iterator:kmer_iterator+k]

                            if(is_reverse_array[kmer_iterator] == 1):
                                rand_string = reverse_strand(rand_string)

                            if(rand_string in dicti):
                                dicti[rand_string]+=1
                            else:
                                dicti[rand_string]=1

            
            elif(min_infox_pos < w_iterator and window_min_infox!=MAX_INT):

                min_infox = window_min_infox
                min_infox_pos = window_min_infox_pos
                min_string = sequence[min_infox_pos:min_infox_pos+k]

                if(is_reverse_array[window_min_infox_pos] == 1):
                    min_string = reverse_strand(min_string)

                # print("OUT OF WINDOW MINIMIZER:", min_infox, min_infox_pos, min_string)

                if(pushed_kmer_array[min_infox_pos]==0):
                    if(min_string in dicti):
                        dicti[min_string] +=1
                    else:
                        dicti[min_string] = 1
                pushed_kmer_array[min_infox_pos] = 1

                for kmer_iterator in range(w_iterator, w_iterator+w):
                    if(infox_array[kmer_iterator] == window_min_infox): 
                        # print("I AM IN THE LOOP WITHIN IF2", kmer_iterator, infox_array[kmer_iterator], window_min_infox, window_min_infox_pos)
                        if(pushed_kmer_array[kmer_iterator]==0):
                            pushed_kmer_array[kmer_iterator] = 1
                            rand_string = sequence[kmer_iterator:kmer_iterator+k]

                            if(is_reverse_array[kmer_iterator] == 1):
                                rand_string = reverse_strand(rand_string)

                            if(rand_string in dicti):
                                dicti[rand_string]+=1
                            else:
                                dicti[rand_string]=1

    return dicti

def write_dicti(dicti, write_file):

    for key in dicti:
        write_file.write(">" + str(dicti[key])+"\n"+str(key)+"\n")
    write_file.close()

def main():

    k = 21
    w = 21
    fasta_sequences = SeqIO.parse(open("../fasta_simulator/simulated_fasta.fasta"),'fasta')
    write_file = open("expected.fasta", "w+")
    dicti = create_dict(fasta_sequences, k, w)
    write_dicti(dicti, write_file)

    return

main()