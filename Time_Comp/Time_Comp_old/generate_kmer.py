from Bio import SeqIO

input_file = "./5098_seq/sequences.fasta"
output_file = "./5098_seq/kmer.fasta"
k = 21

fasta_sequences = SeqIO.parse(open(input_file),'fasta')
out_file = open(output_file, "w")
counter = 0
for fasta in fasta_sequences:
    counter +=1

    if(counter % 50 == 0):
        print(counter)

    name, sequence = fasta.id, str(fasta.seq)
    length = len(sequence)

    for i in range(length-k+1):
        kmer = sequence[i:i+k]
        header = ">" + str(counter) + "_" + str(i) + "\n"
        out_file.write(header)
        out_file.write(kmer + "\n")

out_file.close()  