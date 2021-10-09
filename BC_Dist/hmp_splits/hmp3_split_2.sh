#!/bin/bash
#SBATCH --qos=debug
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --constraint=haswell
#SBATCH --output=BC_SPLIT2_HMP3_OUTPUTS
#SBATCH --error=BC_SPLIT2_HMP3_OUTPUTS

lenhmp3=1156095830

hmp3=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer/hmp1_1=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_1_counts.fa
hmp1_2=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_2_counts.fa
hmp1_3=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_3_counts.fa
hmp1_4=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_4_counts.fa
hmp1_5=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_5_counts.fa
hmp1_6=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_6_counts.fa
hmp1_7=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_7_counts.fa
hmp1_8=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_8_counts.fa
hmp1_9=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_9_counts.fa
hmp1_10=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_10_counts.fa
_counts.fa

hmp3_6=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_6_counts.fa
hmp3_7=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_7_counts.fa
hmp3_8=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_8_counts.fa
hmp3_9=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_9_counts.fa
hmp3_10=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_10_counts.fa

echo "SPLITTING FOR HMP3"
tail -n 578047920 $hmp3 | head -n 115609582 > $hmp3_6
tail -n 462438338 $hmp3 | head -n 115609582 > $hmp3_7
tail -n 346828756 $hmp3 | head -n 115609582 > $hmp3_8
tail -n 231219174 $hmp3 | head -n 115609582 > $hmp3_9
tail -n 115609592 $hmp3 > $hmp3_10

echo "ALL DONE"