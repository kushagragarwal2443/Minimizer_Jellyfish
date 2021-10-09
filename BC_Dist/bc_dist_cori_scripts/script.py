import sys

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

def min_val(value1, value2):
    if(value1 < value2):
        return value1
    else:
        return value2

print(sys.argv[1])
dict1 = fasta_parser(sys.argv[1])
dict2 = fasta_parser(sys.argv[2])

denominator1 = 0
denominator2 = 0
numerator = 0

for key in dict1:
    if(key in dict2):
        numerator += min_val(dict1[key], dict2[key])

for key in dict1:
    denominator1 += dict1[key]

for key in dict2:
    denominator2 += dict2[key]

bc_distance = 1 - 2*numerator/(denominator1+denominator2)

print()
print("Common:", numerator)
print("Total in", sys.argv[1][:-22], " is:", denominator1)
print("Total in", sys.argv[2][:-22], " is:", denominator2)
# print("BC DISTANCE BETWEENT THE TWO IS:", bc_distance)
print()