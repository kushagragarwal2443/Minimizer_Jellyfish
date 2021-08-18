from Bio import SeqIO
import numpy as np
import math
import matplotlib.pyplot as plt

input_file = "../difference_threaded/input/sequences_fasta/norev/single_norev_dumps.fa"

distri_dict = dict()
limit = 500

for i in range(limit+1):
    distri_dict[i] = 0

fasta_sequences = SeqIO.parse(open(input_file),'fasta')

for fasta in fasta_sequences:
    count = int(fasta.id)
    if(count < limit):
        distri_dict[count] +=1
    else:
        distri_dict[limit] +=1

names = list(distri_dict.keys())
values = list(distri_dict.values())

sum = 0
unique = 0
for i in range(limit+1):
    sum += values[i]*i
    unique += values[i]

print("TOTAL NUM OF UNIQUE MINIMIZERS:", unique)
print("TOTAL COUNT OF MINIMIZERS:", sum)

plt.bar(range(len(distri_dict)), values, tick_label=names)
plt.show()