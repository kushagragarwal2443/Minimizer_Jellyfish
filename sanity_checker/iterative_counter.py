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
    mask = 2**(2*k) - 1
    MAX_INT = 18446744073709551615

    for fasta in fasta_sequences:

        sequence = str(fasta.seq)
        length = len(sequence)

        kmer_int_array = []
        hash_array = []
        infox_array = []
        # valid_kmer_array = list(np.zeros(length-k+1, dtype=int))
        pushed_kmer_array = list(np.zeros(length-k+1, dtype=int))

        for i in range(length):
            char_int = code_char(sequence[i])

            if(char_int >= 0):
                kmer_int = (kmer_int << 2 | char_int) & mask
            # else:
            #     for x in range(i-k+1, i+1):
            #         if(x>=0):
            #             valid_kmer_array[x] = -1

            if(i >= (k-1)):
                    hash = hasher(kmer_int, mask)
                    infox = infoxer(hash, k)
                    kmer_int_array.append(kmer_int)
                    hash_array.append(hash)
                    infox_array.append(infox)

        array_length = len(infox_array)

        # print(infox_array)

        min_infox = MAX_INT
        min_infox_pos = -1

        for w_iterator in range(array_length-w+1):

            window_min_infox = MAX_INT
            window_min_infox_pos = -1

            for kmer_iterator in range(w_iterator, w_iterator+w):

                # if(valid_kmer_array[kmer_iterator] == -1):
                #     continue

                if(infox_array[kmer_iterator] <= window_min_infox): 
                    window_min_infox = infox_array[kmer_iterator]
                    window_min_infox_pos = kmer_iterator

            if(window_min_infox <= min_infox and window_min_infox_pos!=min_infox_pos and window_min_infox!=MAX_INT):

                min_infox = window_min_infox
                min_infox_pos = window_min_infox_pos
                min_string = sequence[min_infox_pos:min_infox_pos+k]

                # print("NEW MINIMIZER:", min_infox, min_infox_pos, min_string)

                if(pushed_kmer_array[min_infox_pos]==0):
                    # print("PASSED THIS CHECK\n")
                    if(min_string in dicti):
                        dicti[min_string] +=1
                    else:
                        dicti[min_string] = 1
                pushed_kmer_array[min_infox_pos] = 1

                for kmer_iterator in range(w_iterator, w_iterator+w):
                    # if(valid_kmer_array[kmer_iterator] == -1):
                    #     continue
                    if(infox_array[kmer_iterator] == window_min_infox): 
                        # print("I AM IN THE LOOP WITHIN IF1", kmer_iterator, infox_array[kmer_iterator], window_min_infox, window_min_infox_pos)
                        if(pushed_kmer_array[kmer_iterator]==0):
                            # print("PASSED THIS CHECK\n")
                            pushed_kmer_array[kmer_iterator] = 1
                            rand_string = sequence[kmer_iterator:kmer_iterator+k]
                            if(rand_string in dicti):
                                dicti[rand_string]+=1
                            else:
                                dicti[rand_string]=1

            
            elif(min_infox_pos < w_iterator and window_min_infox!=MAX_INT):

                min_infox = window_min_infox
                min_infox_pos = window_min_infox_pos
                min_string = sequence[min_infox_pos:min_infox_pos+k]

                # print("OUT OF WINDOW MINIMIZER:", min_infox, min_infox_pos, min_string)

                if(pushed_kmer_array[min_infox_pos]==0):
                    # print("PASSED THIS CHECK\n")
                    if(min_string in dicti):
                        dicti[min_string] +=1
                    else:
                        dicti[min_string] = 1
                pushed_kmer_array[min_infox_pos] = 1

                for kmer_iterator in range(w_iterator, w_iterator+w):
                    # if(valid_kmer_array[kmer_iterator] == -1):
                    #     continue
                    if(infox_array[kmer_iterator] == window_min_infox): 
                        # print("I AM IN THE LOOP WITHIN IF2", kmer_iterator, infox_array[kmer_iterator], window_min_infox, window_min_infox_pos)
                        if(pushed_kmer_array[kmer_iterator]==0):
                            # print("PASSED THIS CHECK\n")
                            pushed_kmer_array[kmer_iterator] = 1
                            rand_string = sequence[kmer_iterator:kmer_iterator+k]
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