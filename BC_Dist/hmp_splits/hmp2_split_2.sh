#!/bin/bash
#SBATCH --qos=debug
#SBATCH --nodes=1
#SBATCH --time=00:30:00
#SBATCH --constraint=haswell
#SBATCH --output=BC_SPLIT2_HMP2_OUTPUTS
#SBATCH --error=BC_SPLIT2_HMP2_OUTPUTS

lenhmp2=1202693748

hmp2=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/Kmer/SRS024388_counts.fa

hmp2_6=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_6_counts.fa
hmp2_7=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_7_counts.fa
hmp2_8=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_8_counts.fa
hmp2_9=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_9_counts.fa
hmp2_10=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS024388/SRS024388_10_counts.fa

echo "SPLITTING FOR HMP2"
tail -n 601346878 $hmp2 | head -n 120269374 > $hmp2_6
tail -n 481077504 $hmp2 | head -n 120269374 > $hmp2_7
tail -n 360808130 $hmp2 | head -n 120269374 > $hmp2_8
tail -n 240538756 $hmp2 | head -n 120269374 > $hmp2_9
tail -n 120269382 $hmp2 > $hmp2_10

echo "ALL DONE"