import random

write_file = open("simulated_fasta.fasta", "w+")

num_sequences = 100000
length_sequence = 1000

for i in range(num_sequences):
    sequence = ""
    for j in range(length_sequence):
        c = random.randint(0,3)
        # c = 0
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

# >0
# TGTTTACAACCGACCTCGGGCTGGCCAATATCACGATTCAGACCAATAGCGACACTTATTCGAGAACCTGCAGAGCAGATTCAACCCGTTATATCACTTT
# >0
# ACCACCAATACTCTGGGCGAGGATCATTACT

# >0
# AGTTCTTGTCCATATAGTTGGGAACTTAGC
# >1
# CCCATCTTGCTTCATTGGGCGCATGCGGAT
# >2
# TCCACGGCGTGACATTTTATAAGGGCACTC
# >3
# TACACAACACCAGCACTTAGAAACTCAAAT
# >4
# TCCGCTATCAGGGGTTTTGCTAGCCTCGAC

# AGTTCTTGTCCATATAGTTGGGA | line 59
# TAGTTGGGAACTTAGCN | line 70
# AACTTAGCNCCCATCTTGCTTCA | line 70
# CTTGCTTCATTGGGCGCATGCGG | line 70
# CGCATGCGGATNTCCACGGCGTG | line 70
# CACGGCGTGACATTTTATAAGGG | line 70

# TTATAAGGGCACTCNGCATGCGG | line 70
# GGGCACTCNTACACAACACCAGC | line 70
# AACACCAGCACTTAGAAACTCAA | line 70
# GAAACTCAAATNTCCGCTATCAG | line 70
# CGCTATCAGGGGTTTTGCTAGCC | line 70
# TTGCTAGCCTCGAC | line 70


# 10 -- 1 -- 12 -- 24
# AGTTCTTGTCCATATAGTTGGGA | Mer iterator line 59; Job number is: 0
# TAGTTGGGAACTTAGCN | Mer iterator line 59; Job number is: both rid and job id changed 
# AACTTAGCNCCCATCTTGCTTCA | Mer iterator line 59; Job number is: 0
# CTTGCTTCATTGGGCGCATGCGG | Mer iterator line 59; Job number is: 0
# both rid and job id changed 
# CTTGC -- 0 -- 0 <-- line 370
# TTCAT -- 0 -- 0 <-- line 370
# TTGGG -- 0 -- 0 <-- line 370
# TGGGC -- 0 -- 0 <-- line 370
# CGCATGCGGATNTCCACGGCGTG | Mer iterator line 70; Job number is: 0
# job id changed 
# GCATG -- 0 -- 1 <-- line 370
# rid changed; Value of l: 11
# 0line 318 |CGGAT -- 0 -- 1 <-- line 370
# CACGGCGTGACATTTTATAAGGG | Mer iterator line 70; Job number is: 1

# job id changed 
# CACGG -- 1 -- 2 <-- line 370
# CGGCG -- 1 -- 2 <-- line 370
# GCGTG -- 1 -- 2 <-- line 370
# ACATT -- 1 -- 2 <-- line 370
# TTTAT -- 1 -- 2 <-- line 370
# both rid and job id changed TCTTG -- 0 -- 0 <-- line 370TTATAAGGGCACTCN

# rid changed; Value of l: 8
# TCTTG -- 1 -- 0 <-- line 370
# GGGCACTCNTACACAACACCAGC | Mer iterator line 70; Job number is: 0
#  | Mer iterator line 70; Job number is: 2
# TGTCC -- 0 -- 0 <-- line 370
# CATAT -- 0 -- 0 <-- line 370
# TATAG -- 0 -- 0 <-- line 370
# AACACCAGCACTTAGAAACTCAA | Mer iterator line 70; Job number is: 0
# job id changed 
# AACAC -- 0 -- 1 <-- line 370
# ACACC -- 0 -- 1 <-- line 370
# AGCAC -- 0 -- 1 <-- line 370
# job id changed 
# rid changed; Value of l: 8
# ACACA -- 2 -- 1 <-- line 370
# GAAACTCAAATNTCCGCTATCAG | Mer iterator line 70; Job number is: 1
# job id changed 
# ACTCA -- 2 -- 2 <-- line 370
# rid changed; Value of l: 11
# line 318 |TCAAA -- 2 -- 2 <-- line 370
# both rid and job id changed 
# CGCTATCAGGGGTTTTGCTAGCCTTGGG -- 0 -- 0 <-- line 370
# job id changed GGAAC -- 0 -- 0 <-- line 370
# TTGCTAGCCTCGAC | Mer iterator line 70; Job number is: 0
# both rid and job id changed 
# line 305 | GAACT -- 0 -- 0 <-- line 370
# TGCTA -- 1 -- 1 <-- line 370
# GCTAG -- 1 -- 1 <-- line 370
#  | Mer iterator line 70; Job number is: 2
# job id changed 
# GCTAT -- 3 -- 3 <-- line 370
# CAGGG -- 3 -- 3 <-- line 370
# GGGTT -- 3 -- 3 <-- line 370
# GGTTT -- 3 -- 3 <-- line 370

# TTATA -- 1 -- 3 <-- line 370GCACT
# AGGGC -- 1 -- 3 <-- line 370
#  -- 0 -- 1 <-- line 370
# CTTAG -- 0 -- 1 <-- line 370
# AAACT -- 0 -- 1 <-- line 370
# 10 -- 1 -- 12 -- 24
# AGTTCTTGTCCATATAGTTGGGA | Mer iterator line 59; Job number is: 0
# TAGTTGGGAACTTAGC | Mer iterator line 59; Job number is: 0
# both rid and job id changed 
# both rid and job id changed 
# TCTTG -- 0 -- 0 <-- line 370
# TGTCC -- 0 -- 0 <-- line 370
# TTGGGCATAT -- 0 -- 0 <-- line 370
# TATAG -- 0 -- 0 <-- line 370
#  -- 0 -- 0 <-- line 370
# GGAAC -- 0 -- 0 <-- line 370
# 10 -- 1 -- 12 -- 24
# CCCATCTTGCTTCATTGGGCGCA | Mer iterator line 59; Job number is: 0
# TTGGGCGCATGCGGAT | Mer iterator line 59; Job number is: 0
# both rid and job id changed 
# TCTTG -- 0 -- both rid and job id changed 0
# TTGGG -- 0 -- 0 <-- line 370
# TGGGC <-- line 370 -- 
# CTTGC -- 0 -- 0 <-- line 370
# TTCAT -- 0 -- 0 <-- line 370
# 0 -- 0 <-- line 370
# GCATG -- 0 -- 0 <-- line 370
# 10 -- 1 -- 12 -- 24
# TCCACGGCGTGACATTTTATAAG | Mer iterator line 59; Job number is: 0
# TTTTATAAGGGCACTC | Mer iterator line 59; Job number is: 0
# both rid and job id changed 
# CACGG -- 0 -- 0 <-- line 370
# CGGCG -- 0 -- 0 <-- line 370
# both rid and job id changed GCGTG -- 0 -- 0 <-- line 370

# ACATTTTATA -- 0 --  -- 0 <-- line 370
# AGGGC -- 0 -- 0 <-- line 370
# 0 -- 0 <-- line 370
# TTTAT -- 0 -- 0 <-- line 370
# 10 -- 1 -- 12 -- 24
# TACACAACACCAGCACTTAGAAA | Mer iterator line 59; Job number is: 0
# both rid and job id changed 
# ACACA -- 0 -- 0 <-- line 370
# AACAC -- 0 -- 0 <-- line 370
# ACACC -- 0 -- 0 <-- line 370
# AGCAC -- 0 -- ACTTAGAAACTCAAAT | Mer iterator line 59; Job number is: 0
# both rid and job id changed 
# CTTAG -- 0 -- 0 <-- line 370
# AAACT -- 0 -- 0 <-- line 370
# ACTCA -- 0 -- 0 <-- line 370
# 0 <-- line 370
# GCACT -- 0 -- 0 <-- line 370
# 10 -- 1 -- 12 -- 24
# TCCGCTATCAGGGGTTTTGCTAG | Mer iterator line 59; Job number is: 0
# TTTTGCTAGCCTCGAC | Mer iterator line 59; Job number is: 0
# both rid and job id changed 
# GCTAT -- 0 -- 0 <-- line 370
# CAGGG -- 0 -- 0 <-- line 370
# GGGTT -- 0 -- 0 <-- line 370
# GGTTT -- 0 -- 0 <-- line 370
# both rid and job id changed 
# TGCTA -- 0 -- 0 <-- line 370
# GCTAG -- 0 -- 0 <-- line 370

