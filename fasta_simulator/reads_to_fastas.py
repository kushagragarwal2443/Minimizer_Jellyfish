from Bio import SeqIO
import numpy as np
import os
 
dir = 'reads/'
for f in os.listdir(dir):
    os.remove(os.path.join(dir, f))

fasta_sequences = SeqIO.parse(open("simulated_fasta.fasta"),'fasta')
counter = 0
for fasta in fasta_sequences:

    sequence = str(fasta.seq)
    write_file = open("reads/"+str(counter)+".fasta", "w+")
    write_file.write(">kush\n"+str(sequence)+"\n")
    write_file.close()
    counter+=1