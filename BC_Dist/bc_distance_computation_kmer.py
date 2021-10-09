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

fil11 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[1] + "/" + sys.argv[1] + "_1_counts.fa"
fil12 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[1] + "/" + sys.argv[1] + "_2_counts.fa"
fil13 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[1] + "/" + sys.argv[1] + "_3_counts.fa"
fil14 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[1] + "/" + sys.argv[1] + "_4_counts.fa"
fil15 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[1] + "/" + sys.argv[1] + "_5_counts.fa"
fil16 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[1] + "/" + sys.argv[1] + "_6_counts.fa"
fil17 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[1] + "/" + sys.argv[1] + "_7_counts.fa"
fil18 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[1] + "/" + sys.argv[1] + "_8_counts.fa"
fil19 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[1] + "/" + sys.argv[1] + "_9_counts.fa"
fil10 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[1] + "/" + sys.argv[1] + "_10_counts.fa"

fil21 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[2] + "/" + sys.argv[2] + "_1_counts.fa"
fil22 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[2] + "/" + sys.argv[2] + "_2_counts.fa"
fil23 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[2] + "/" + sys.argv[2] + "_3_counts.fa"
fil24 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[2] + "/" + sys.argv[2] + "_4_counts.fa"
fil25 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[2] + "/" + sys.argv[2] + "_5_counts.fa"
fil26 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[2] + "/" + sys.argv[2] + "_6_counts.fa"
fil27 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[2] + "/" + sys.argv[2] + "_7_counts.fa"
fil28 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[2] + "/" + sys.argv[2] + "_8_counts.fa"
fil29 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[2] + "/" + sys.argv[2] + "_9_counts.fa"
fil20 = "/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/" + sys.argv[2] + "/" + sys.argv[2] + "_10_counts.fa"

print(fil11)
print(fil25)

print("PARSING STARTS")

print("11")
dict11 = fasta_parser(fil11)
print("12")
dict12 = fasta_parser(fil12)
print("13")
dict13 = fasta_parser(fil13)
print("14")
dict14 = fasta_parser(fil14)
print("15")
dict15 = fasta_parser(fil15)
print("16")
dict16 = fasta_parser(fil16)
print("17")
dict17 = fasta_parser(fil17)
print("18")
dict18 = fasta_parser(fil18)
print("19")
dict19 = fasta_parser(fil19)
print("10")
dict10 = fasta_parser(fil10)

print("21")
dict21 = fasta_parser(fil21)
print("22")
dict22 = fasta_parser(fil22)
print("23")
dict23 = fasta_parser(fil23)
print("24")
dict24 = fasta_parser(fil24)
print("25")
dict25 = fasta_parser(fil25)
print("26")
dict26 = fasta_parser(fil26)
print("27")
dict27 = fasta_parser(fil27)
print("28")
dict28 = fasta_parser(fil28)
print("29")
dict29 = fasta_parser(fil29)
print("20")
dict20 = fasta_parser(fil20)

print("PARSING ENDS")

denominator1 = 0
denominator2 = 0
numerator = 0

print("NUMERATOR CALCULATION STARTS")

for i in range(0,10):
    for j in range(0,10):
        print(i,j)
        dict_1 = "dict1" + str(i)
        dict_2 = "dict2" + str(j)
        for key in locals()[dict_1]:
            if(key in locals()[dict_2]):
                numerator += min_val(locals()[dict_1][key], locals()[dict_2][key])

print("DENOMINATOR1 CALCULATION STARTS")

for i in range(0,10):
    print(i)
    dict_1 = "dict1" + str(i)
    for key in locals()[dict_1]:
        denominator1 += locals()[dict_1][key]

print("DENOMINATOR2 CALCULATION STARTS")

for i in range(0,10):
    print(i)
    dict_2 = "dict2" + str(i)
    for key in locals()[dict_2]:
        denominator2 += locals()[dict_2][key]

bc_distance = 1 - 2*numerator/(denominator1+denominator2)

print()
print("Numerator:", numerator)
print("Denominator:", denominator1, denominator2)
print("BC DISTANCE BETWEENT THE TWO IS:", bc_distance)
print()