#!/bin/bash
#SBATCH --qos=debug
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --constraint=haswell
#SBATCH --output=BC_SPLIT1_HMP4_OUTPUTS
#SBATCH --error=BC_SPLIT1_HMP4_OUTPUTS

echo "MAKING DIRECTORIES"
mkdir /global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404

lenhmp4=1279203172

hmp4=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer/SRS075404_counts.fa

hmp4_1=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_1_counts.fa
hmp4_2=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_2_counts.fa
hmp4_3=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_3_counts.fa
hmp4_4=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_4_counts.fa
hmp4_5=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_5_counts.fa

echo "SPLITTING FOR HMP4"
head -n 127920316 $hmp4 > $hmp4_1
head -n 255840632 $hmp4 | tail -n 127920316 > $hmp4_2
head -n 383760948 $hmp4 | tail -n 127920316 > $hmp4_3
head -n 511681264 $hmp4 | tail -n 127920316 > $hmp4_4
head -n 639601580 $hmp4 | tail -n 127920316 > $hmp4_5

echo "ALL DONE"