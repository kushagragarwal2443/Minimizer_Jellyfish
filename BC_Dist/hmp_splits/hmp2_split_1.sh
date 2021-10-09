#!/bin/bash
#SBATCH --qos=debug
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --constraint=haswell
#SBATCH --output=BC_SPLIT1_HMP2_OUTPUTS
#SBATCH --error=BC_SPLIT1_HMP2_OUTPUTS

echo "MAKING DIRECTORIES"
mkdir /global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388

lenhmp2=1202693748

hmp2=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer/SRS024388_counts.fa

hmp2_1=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_1_counts.fa
hmp2_2=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_2_counts.fa
hmp2_3=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_3_counts.fa
hmp2_4=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_4_counts.fa
hmp2_5=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_5_counts.fa

echo "SPLITTING FOR HMP2"
head -n 120269374 $hmp2 > $hmp2_1
head -n 240538748 $hmp2 | tail -n 120269374 > $hmp2_2
head -n 360808122 $hmp2 | tail -n 120269374 > $hmp2_3
head -n 481077496 $hmp2 | tail -n 120269374 > $hmp2_4
head -n 601346870 $hmp2 | tail -n 120269374 > $hmp2_5

echo "ALL DONE"