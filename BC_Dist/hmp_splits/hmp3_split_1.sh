#!/bin/bash
#SBATCH --qos=debug
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --constraint=haswell
#SBATCH --output=BC_SPLIT1_HMP3_OUTPUTS
#SBATCH --error=BC_SPLIT1_HMP3_OUTPUTS

echo "MAKING DIRECTORIES"
mkdir /global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239

lenhmp3=1156095830

hmp3=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer/SRS011239_counts.fa

hmp3_1=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_1_counts.fa
hmp3_2=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_2_counts.fa
hmp3_3=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_3_counts.fa
hmp3_4=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_4_counts.fa
hmp3_5=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_5_counts.fa

echo "SPLITTING FOR HMP3"
head -n 115609582 $hmp3 > $hmp3_1
head -n 231219164 $hmp3 | tail -n 115609582 > $hmp3_2
head -n 346828746 $hmp3 | tail -n 115609582 > $hmp3_3
head -n 462438328 $hmp3 | tail -n 115609582 > $hmp3_4
head -n 578047910 $hmp3 | tail -n 115609582 > $hmp3_5

echo "ALL DONE"
