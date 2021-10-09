#!/bin/bash
#SBATCH --qos=debug
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --constraint=haswell
#SBATCH --output=BC_SPLIT2_HMP1_OUTPUTS
#SBATCH --error=BC_SPLIT2_HMP1_OUTPUTS

lenhmp1=1729236790

hmp1=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer/SRS024075_counts.fa

hmp1_6=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_6_counts.fa
hmp1_7=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_7_counts.fa
hmp1_8=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_8_counts.fa
hmp1_9=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_9_counts.fa
hmp1_10=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024075/SRS024075_10_counts.fa

echo "SPLITTING FOR HMP1"
tail -n 864618400 $hmp1 | head -n 172923678 > $hmp1_6
tail -n 691694722 $hmp1 | head -n 172923678 > $hmp1_7
tail -n 518771044 $hmp1 | head -n 172923678 > $hmp1_8
tail -n 345847366 $hmp1 | head -n 172923678 > $hmp1_9
tail -n 172923688 $hmp1 > $hmp1_10

echo "ALL DONE"