import random

write_file = open("simulated_fasta.fasta", "w+")

num_sequences = 2000
length_sequence = 5000

for i in range(num_sequences):
    sequence = ""
    for j in range(length_sequence):
        c = random.randint(0,3)
        if(c == 0):
            sequence = sequence + "A"
        if(c == 1):
            sequence = sequence + "T"
        if(c == 2):
            sequence = sequence + "G"
        if(c == 3):
            sequence = sequence + "C"
    write_file.write(">"+str(i)+"\n"+sequence+"\n")

write_file.close()
