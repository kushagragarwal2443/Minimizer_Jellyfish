from Bio import SeqIO

fasta_sequences1 = SeqIO.parse(open("../sanity_checker/jelly.fa"),'fasta')
fasta_sequences2 = SeqIO.parse(open("../sanity_checker/expected.fasta"),'fasta')
write_file = open("../sanity_checker/comparison_robust.txt","a")

total1 = 0
total2 = 0
correct = 0
mismatch = 0
not_present_file1 = 0
not_present_file2 = 0

finished = 0

dict1 = dict()
dict2 = dict()

for fasta1 in fasta_sequences1:
    total1 +=1
    dict1[str(fasta1.seq)] = fasta1.id
for fasta2 in fasta_sequences2:
    total2 +=1
    dict2[str(fasta2.seq)] = fasta2.id

for key1 in dict1:

    # if(finished % 100 == 0):
    #     print("FINISHED WITH: ", finished)
    # finished+=1

    if(key1 not in dict2):
        not_present_file2 +=1
        write_file.write("Not present in File2: " + str(key1) + " " + str(dict1[key1]) + "\n")

    else:
        if(dict1[key1] != dict2[key1]):
            mismatch +=1
            write_file.write("Mismatch in count: " + str(key1) + " " + str(dict1[key1]) + " " + str(dict2[key1]) + "\n")
        else:
            correct+=1

for key2 in dict2:
    if(key2 not in dict1):
        not_present_file1 +=1
        write_file.write("Not present in File1: " + str(key2) + " " + str(dict2[key2]) + "\n")

# print("Total sequences:", total1, total2)
# print("Correct for both:", correct)
# print("Mismatch in count:", mismatch)
# print("Not present in File 1:", not_present_file1)
# print("Not present in File 2:", not_present_file2)

if(mismatch > 0 or not_present_file1 > 0 or not_present_file2 > 0):
    write_file.write("\nDONE\n\n")
    write_file.write("Total sequences: " + str(total1) + " " + str(total2) + "\n")
    write_file.write("Correct for both: " + str(correct)+ "\n")
    write_file.write("Mismatch in count: " + str(mismatch)+ "\n")
    write_file.write("Not present in File 1: " + str(not_present_file1)+ "\n")
    write_file.write("Not present in File 2: " + str(not_present_file2)+ "\n")
    
    write_file.write("\nThe given input was:\n\n")
    read_file = open("../fasta_simulator/simulated_fasta.fasta", "r")
    for line in read_file:
        write_file.write(line + "\n")

    write_file.write("\nThe Jelly output was:\n\n")
    read_file = open("../sanity_checker/jelly.fa", "r")
    for line in read_file:
        write_file.write(line)

    write_file.write("\nThe Python output was:\n\n")
    read_file = open("../sanity_checker/expected.fasta", "r")
    for line in read_file:
        write_file.write(line)    

    write_file.write("\n-----------------------------------------------------------------------------------------------------------\n\n\n")

write_file.close()
