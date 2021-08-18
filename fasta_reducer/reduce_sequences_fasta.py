from Bio import SeqIO

input_file = "../Code/seq/sequences.fasta"
output_file = open("./red_sequences.fasta", "w+")
coverage = 50

fasta_sequences = SeqIO.parse(open(input_file),'fasta')
counter = 0

for fasta in fasta_sequences:

    if(counter == coverage):
        break

    output_file.write(">"+fasta.id+"\n"+str(fasta.seq)+"\n")

    counter +=1

print("DONE")