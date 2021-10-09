#!/bin/bash
#SBATCH --qos=debug
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --constraint=haswell
#SBATCH --output=BC_SPLIT1_HMP1_OUTPUTS
#SBATCH --error=BC_SPLIT1_HMP1_OUTPUTS

echo "MAKING DIRECTORIES"
mkdir /global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075

lenhmp1=1729236790

hmp1=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer/SRS024075_counts.fa

hmp1_1=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_1_counts.fa
hmp1_2=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_2_counts.fa
hmp1_3=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_3_counts.fa
hmp1_4=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_4_counts.fa
hmp1_5=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_5_counts.fa

echo "SPLITTING FOR HMP1"
head -n 172923678 $hmp1 > $hmp1_1
head -n 345847356 $hmp1 | tail -n 172923678 > $hmp1_2
head -n 518771034 $hmp1 | tail -n 172923678 > $hmp1_3
head -n 691694712 $hmp1 | tail -n 172923678 > $hmp1_4
head -n 864618390 $hmp1 | tail -n 172923678 > $hmp1_5

echo "ALL DONE"