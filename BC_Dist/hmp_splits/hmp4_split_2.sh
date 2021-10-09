#!/bin/bash
#SBATCH --qos=debug
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --constraint=haswell
#SBATCH --output=BC_SPLIT2_HMP4_OUTPUTS
#SBATCH --error=BC_SPLIT2_HMP4_OUTPUTS

lenhmp4=1279203172

hmp4=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer/SRS075404_counts.fa

hmp4_6=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_6_counts.fa
hmp4_7=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_7_counts.fa
hmp4_8=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_8_counts.fa
hmp4_9=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_9_counts.fa
hmp4_10=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_10_counts.fa

echo "SPLITTING FOR HMP4"
tail -n 639601592 $hmp4 | head -n 127920316 > $hmp4_6
tail -n 511681276 $hmp4 | head -n 127920316 > $hmp4_7
tail -n 383760960 $hmp4 | head -n 127920316 > $hmp4_8
tail -n 255840644 $hmp4 | head -n 127920316 > $hmp4_9
tail -n 127920328 $hmp4 > $hmp4_10

echo "ALL DONE"