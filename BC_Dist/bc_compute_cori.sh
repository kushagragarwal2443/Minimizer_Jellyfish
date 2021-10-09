#!/bin/bash
#SBATCH --qos=debug
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --constraint=haswell
#SBATCH --output=BC_KMER_HMP12_OUTPUTS
#SBATCH --error=BC_KMER_HMP12_OUTPUTS

echo "MAKING DIRECTORIES"
mkdir /global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075
mkdir /global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388

lenhmp1=1729236790
lenhmp2=1202693748

hmp1=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer/SRS024075_counts.fa
hmp2=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer/SRS024388_counts.fa

hmp1_1=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_1_counts.fa
hmp1_2=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_2_counts.fa
hmp1_3=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_3_counts.fa
hmp1_4=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_4_counts.fa
hmp1_5=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_5_counts.fa
hmp1_6=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_6_counts.fa
hmp1_7=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_7_counts.fa
hmp1_8=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_8_counts.fa
hmp1_9=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_9_counts.fa
hmp1_10=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_10_counts.fa

hmp2_1=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_1_counts.fa
hmp2_2=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_2_counts.fa
hmp2_3=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_3_counts.fa
hmp2_4=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_4_counts.fa
hmp2_5=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_5_counts.fa
hmp2_6=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_6_counts.fa
hmp2_7=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_7_counts.fa
hmp2_8=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_8_counts.fa
hmp2_9=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_9_counts.fa
hmp2_10=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_10_counts.fa

echo "SPLITTING FOR HMP1"
head -n 172923678 $hmp1 > $hmp1_1
head -n 345847356 $hmp1 | tail -n 172923678 > $hmp1_2
head -n 518771034 $hmp1 | tail -n 172923678 > $hmp1_3
head -n 691694712 $hmp1 | tail -n 172923678 > $hmp1_4
head -n 864618390 $hmp1 | tail -n 172923678 > $hmp1_5
head -n 1037542068 $hmp1 | tail -n 172923678 > $hmp1_6
head -n 1210465746 $hmp1 | tail -n 172923678 > $hmp1_7
head -n 1383389424 $hmp1 | tail -n 172923678 > $hmp1_8
head -n 1556313102 $hmp1 | tail -n 172923678 > $hmp1_9
tail -n 172923688 $hmp1 > $hmp1_10

echo "SPLITTING FOR HMP2"
head -n 120269374 $hmp2 > $hmp2_1
head -n 240538748 $hmp2 | tail -n 120269374 > $hmp2_2
head -n 360808122 $hmp2 | tail -n 120269374 > $hmp2_3
head -n 481077496 $hmp2 | tail -n 120269374 > $hmp2_4
head -n 601346870 $hmp2 | tail -n 120269374 > $hmp2_5
head -n 721616244 $hmp2 | tail -n 120269374 > $hmp2_6
head -n 841885618 $hmp2 | tail -n 120269374 > $hmp2_7
head -n 962154992 $hmp2 | tail -n 120269374 > $hmp2_8
head -n 1082424366 $hmp2 | tail -n 120269374 > $hmp2_9
tail -n 120269382 $hmp2 > $hmp2_10

echo "ALL DONE"