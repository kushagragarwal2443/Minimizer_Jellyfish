from Bio import SeqIO

def reverse(seq):
    length = len(seq)
    rev_seq = ""
    for i in range(length):
        character = seq[i]
        if(character == "A"):
            rev_seq = rev_seq + "T"
        elif(character == "T"):
            rev_seq = rev_seq + "A"
        elif(character == "C"):
            rev_seq = rev_seq + "G"
        elif(character == "G"):
            rev_seq = rev_seq + "C"
        else:
            return -1
        
    return rev_seq[::-1]

def create_dict(fasta_sequences, k, dicti):

    counter = 0
    for fasta in fasta_sequences:
        if(counter % 100 == 0):
            print(counter)
        counter +=1
        sequence = str(fasta.seq)
        length = len(sequence)
        for i in range(length-k+1):
            kmer = sequence[i:i+k]
            
            # rev_kmer = reverse(kmer)
            # if(rev_kmer != -1):
            #     if(kmer in dicti):
            #         dicti[kmer] +=1
            #     elif(rev_kmer in dicti):
            #         dicti[rev_kmer] +=1
            #     else:
            #         dicti[kmer] = 1
            
            if(kmer in dicti):
                dicti[kmer] +=1
            else:
                dicti[kmer] = 1

    return dicti

def write_dicti(dicti, write_file):

    for key in dicti:
        write_file.write(">" + str(dicti[key])+"\n"+str(key)+"\n")
    write_file.close()

def main():

    # k = int(input("Enter the value of k to be used: "))
    k = 21
    fasta_sequences = SeqIO.parse(open("simulated_fasta.fasta"),'fasta')
    write_file = open("iterative_result.fasta", "w+")
    dicti = dict()

    dicti = create_dict(fasta_sequences, k, dicti)
    write_dicti(dicti, write_file)
    return

main()