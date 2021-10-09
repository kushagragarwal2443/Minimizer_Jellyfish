
# kush2443@cori09:/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer> cat SRS024075_counts.fa | wc -l  
# 1729236790
# kush2443@cori09:/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer> cat SRS024388_counts.fa | wc -l 
# 1202693748
# kush2443@cori09:/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer> cat SRS011239_counts.fa | wc -l 
# 1156095830
# kush2443@cori09:/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer> cat SRS075404_counts.fa | wc -l 
# 1279203172
# kush2443@cori09:/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer> cat SRS043663_counts.fa | wc -l 
# 2844038148
# kush2443@cori09:/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer> cat SRS062761_counts.fa | wc -l 
# 3083907540


wc=1279203172
splits = 10

by_10 = int(wc/splits)

if(by_10 % 2 ==0):
    flag = 0
else:
    flag = 1

head_arr = []
tail_arr = []

if(flag == 1):

    by_10 = by_10 - 1

    done = 0

    for i in range(int(splits/2)):
        done = by_10*(i+1)
        print(done)
        head_arr.append(done)

    remaining = wc - head_arr[int(splits/2) - 1]

    for i in range(int(splits/2) - 1):
        tail_arr.append(remaining)
        remaining -= by_10
        print(remaining)
        
    tail_arr.append(remaining)

else:
    
    done = 0

    for i in range(int(splits/2)):
        done = by_10*(i+1)
        print(done)
        head_arr.append(done)

    remaining = wc - head_arr[int(splits/2) - 1]

    for i in range(int(splits/2) - 1):
        tail_arr.append(remaining)
        remaining -= by_10
        print(remaining)
        
    tail_arr.append(remaining)


print(head_arr)
print(tail_arr)

    
