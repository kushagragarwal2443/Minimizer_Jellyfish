def fasta_parser(filename):

    fasta = {}

    with open(filename) as file_one:
        for line in file_one:
            line = line.strip()
            if not line:
                continue
            if line.startswith(">"):
                active_sequence_name = int(line[1:])
                continue
            else:
                sequence = line
            fasta[sequence]=active_sequence_name

    return fasta

dict1 = fasta_parser("input/sequences_fasta/four_dumps.fa")
dict2 = fasta_parser("input/sequences_fasta/modified/four_modified_run2_dumps.fa")

write_file = open("results/sequences_fasta/modified/4vs_4_modified_run2.txt_noBio","w+")

total1 = 0
total2 = 0
correct = 0
mismatch = 0
not_present_file1 = 0
not_present_file2 = 0

finished = 0


for fasta1 in dict1:
    total1 +=1
for fasta2 in dict2:
    total2 +=1

for key1 in dict1:

    if(finished % 100 == 0):
        print("FINISHED WITH: ", finished)
    finished+=1

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

print("\nDONE\n")
print("Total sequences:", total1, total2)
print("Correct for both:", correct)
print("Mismatch in count:", mismatch)
print("Not present in File 1:", not_present_file1)
print("Not present in File 2:", not_present_file2)

write_file.write("\nDONE\n\n")
write_file.write("Total sequences: " + str(total1) + " " + str(total2) + "\n")
write_file.write("Correct for both: " + str(correct)+ "\n")
write_file.write("Mismatch in count: " + str(mismatch)+ "\n")
write_file.write("Not present in File 1: " + str(not_present_file1)+ "\n")
write_file.write("Not present in File 2: " + str(not_present_file2)+ "\n")

write_file.close()
