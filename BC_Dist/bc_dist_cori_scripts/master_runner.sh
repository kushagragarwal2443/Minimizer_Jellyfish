#!/bin/bash
#SBATCH --qos=regular
#SBATCH --nodes=1
#SBATCH --time=24:00:00
#SBATCH --constraint=haswell
#SBATCH --output=OUTPUTS
#SBATCH --error=OUTPUTS

hmp1_1=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_1_counts.fa
hmp1_2=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_2_counts.fa
hmp1_3=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_3_counts.fa
hmp1_4=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_4_counts.fa
hmp1_5=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_5_counts.fa
hmp1_6=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_6_counts.fa
hmp1_7=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_7_counts.fa
hmp1_8=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_8_counts.fa
hmp1_9=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_9_counts.fa
hmp1_10=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS011239/SRS011239_10_counts.fa

hmp2_1=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_1_counts.fa
hmp2_2=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_2_counts.fa
hmp2_3=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_3_counts.fa
hmp2_4=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_4_counts.fa
hmp2_5=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_5_counts.fa
hmp2_6=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_6_counts.fa
hmp2_7=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_7_counts.fa
hmp2_8=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_8_counts.fa
hmp2_9=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_9_counts.fa
hmp2_10=/global/cfs/cdirs/m3788/projects/min_Jellyfish/SIMULATIONS/bc_distance/Kush_run/bc_Kmers/SRS075404/SRS075404_10_counts.fa


echo "hmp1_1 vs hmp2_1"
python3 script.py $hmp1_1 $hmp2_1
echo "Done with hmp1_1 vs hmp2_1"
echo
echo "hmp1_1 vs hmp2_2"
python3 script.py $hmp1_1 $hmp2_2
echo "Done with hmp1_1 vs hmp2_2"
echo
echo "hmp1_1 vs hmp2_3"
python3 script.py $hmp1_1 $hmp2_3
echo "Done with hmp1_1 vs hmp2_3"
echo
echo "hmp1_1 vs hmp2_4"
python3 script.py $hmp1_1 $hmp2_4
echo "Done with hmp1_1 vs hmp2_4"
echo
echo "hmp1_1 vs hmp2_5"
python3 script.py $hmp1_1 $hmp2_5
echo "Done with hmp1_1 vs hmp2_5"
echo
echo "hmp1_1 vs hmp2_6"
python3 script.py $hmp1_1 $hmp2_6
echo "Done with hmp1_1 vs hmp2_6"
echo
echo "hmp1_1 vs hmp2_7"
python3 script.py $hmp1_1 $hmp2_7
echo "Done with hmp1_1 vs hmp2_7"
echo
echo "hmp1_1 vs hmp2_8"
python3 script.py $hmp1_1 $hmp2_8
echo "Done with hmp1_1 vs hmp2_8"
echo
echo "hmp1_1 vs hmp2_9"
python3 script.py $hmp1_1 $hmp2_9
echo "Done with hmp1_1 vs hmp2_9"
echo
echo "hmp1_1 vs hmp2_10"
python3 script.py $hmp1_1 $hmp2_10
echo "Done with hmp1_1 vs hmp2_10"
echo
echo "-------------------------ALL DONE WITH HMP1---------------------------------"

echo "hmp1_2 vs hmp2_1"
python3 script.py $hmp1_2 $hmp2_1
echo "Done with hmp1_2 vs hmp2_1"
echo
echo "hmp1_2 vs hmp2_2"
python3 script.py $hmp1_2 $hmp2_2
echo "Done with hmp1_2 vs hmp2_2"
echo
echo "hmp1_2 vs hmp2_3"
python3 script.py $hmp1_2 $hmp2_3
echo "Done with hmp1_2 vs hmp2_3"
echo
echo "hmp1_2 vs hmp2_4"
python3 script.py $hmp1_2 $hmp2_4
echo "Done with hmp1_2 vs hmp2_4"
echo
echo "hmp1_2 vs hmp2_5"
python3 script.py $hmp1_2 $hmp2_5
echo "Done with hmp1_2 vs hmp2_5"
echo
echo "hmp1_2 vs hmp2_6"
python3 script.py $hmp1_2 $hmp2_6
echo "Done with hmp1_2 vs hmp2_6"
echo
echo "hmp1_2 vs hmp2_7"
python3 script.py $hmp1_2 $hmp2_7
echo "Done with hmp1_2 vs hmp2_7"
echo
echo "hmp1_2 vs hmp2_8"
python3 script.py $hmp1_2 $hmp2_8
echo "Done with hmp1_2 vs hmp2_8"
echo
echo "hmp1_2 vs hmp2_9"
python3 script.py $hmp1_2 $hmp2_9
echo "Done with hmp1_2 vs hmp2_9"
echo
echo "hmp1_2 vs hmp2_10"
python3 script.py $hmp1_2 $hmp2_10
echo "Done with hmp1_2 vs hmp2_10"
echo
echo "-------------------------ALL DONE WITH HMP2---------------------------------"

echo "hmp1_3 vs hmp2_1"
python3 script.py $hmp1_3 $hmp2_1
echo "Done with hmp1_3 vs hmp2_1"
echo
echo "hmp1_3 vs hmp2_2"
python3 script.py $hmp1_3 $hmp2_2
echo "Done with hmp1_3 vs hmp2_2"
echo
echo "hmp1_3 vs hmp2_3"
python3 script.py $hmp1_3 $hmp2_3
echo "Done with hmp1_3 vs hmp2_3"
echo
echo "hmp1_3 vs hmp2_4"
python3 script.py $hmp1_3 $hmp2_4
echo "Done with hmp1_3 vs hmp2_4"
echo
echo "hmp1_3 vs hmp2_5"
python3 script.py $hmp1_3 $hmp2_5
echo "Done with hmp1_3 vs hmp2_5"
echo
echo "hmp1_3 vs hmp2_6"
python3 script.py $hmp1_3 $hmp2_6
echo "Done with hmp1_3 vs hmp2_6"
echo
echo "hmp1_3 vs hmp2_7"
python3 script.py $hmp1_3 $hmp2_7
echo "Done with hmp1_3 vs hmp2_7"
echo
echo "hmp1_3 vs hmp2_8"
python3 script.py $hmp1_3 $hmp2_8
echo "Done with hmp1_3 vs hmp2_8"
echo
echo "hmp1_3 vs hmp2_9"
python3 script.py $hmp1_3 $hmp2_9
echo "Done with hmp1_3 vs hmp2_9"
echo
echo "hmp1_3 vs hmp2_10"
python3 script.py $hmp1_3 $hmp2_10
echo "Done with hmp1_3 vs hmp2_10"
echo
echo "-------------------------ALL DONE WITH HMP3---------------------------------"

echo "hmp1_4 vs hmp2_1"
python3 script.py $hmp1_4 $hmp2_1
echo "Done with hmp1_4 vs hmp2_1"
echo
echo "hmp1_4 vs hmp2_2"
python3 script.py $hmp1_4 $hmp2_2
echo "Done with hmp1_4 vs hmp2_2"
echo
echo "hmp1_4 vs hmp2_3"
python3 script.py $hmp1_4 $hmp2_3
echo "Done with hmp1_4 vs hmp2_3"
echo
echo "hmp1_4 vs hmp2_4"
python3 script.py $hmp1_4 $hmp2_4
echo "Done with hmp1_4 vs hmp2_4"
echo
echo "hmp1_4 vs hmp2_5"
python3 script.py $hmp1_4 $hmp2_5
echo "Done with hmp1_4 vs hmp2_5"
echo
echo "hmp1_4 vs hmp2_6"
python3 script.py $hmp1_4 $hmp2_6
echo "Done with hmp1_4 vs hmp2_6"
echo
echo "hmp1_4 vs hmp2_7"
python3 script.py $hmp1_4 $hmp2_7
echo "Done with hmp1_4 vs hmp2_7"
echo
echo "hmp1_4 vs hmp2_8"
python3 script.py $hmp1_4 $hmp2_8
echo "Done with hmp1_4 vs hmp2_8"
echo
echo "hmp1_4 vs hmp2_9"
python3 script.py $hmp1_4 $hmp2_9
echo "Done with hmp1_4 vs hmp2_9"
echo
echo "hmp1_4 vs hmp2_10"
python3 script.py $hmp1_4 $hmp2_10
echo "Done with hmp1_4 vs hmp2_10"
echo
echo "-------------------------ALL DONE WITH HMP4---------------------------------"

echo "hmp1_5 vs hmp2_1"
python3 script.py $hmp1_5 $hmp2_1
echo "Done with hmp1_5 vs hmp2_1"
echo
echo "hmp1_5 vs hmp2_2"
python3 script.py $hmp1_5 $hmp2_2
echo "Done with hmp1_5 vs hmp2_2"
echo
echo "hmp1_5 vs hmp2_3"
python3 script.py $hmp1_5 $hmp2_3
echo "Done with hmp1_5 vs hmp2_3"
echo
echo "hmp1_5 vs hmp2_4"
python3 script.py $hmp1_5 $hmp2_4
echo "Done with hmp1_5 vs hmp2_4"
echo
echo "hmp1_5 vs hmp2_5"
python3 script.py $hmp1_5 $hmp2_5
echo "Done with hmp1_5 vs hmp2_5"
echo
echo "hmp1_5 vs hmp2_6"
python3 script.py $hmp1_5 $hmp2_6
echo "Done with hmp1_5 vs hmp2_6"
echo
echo "hmp1_5 vs hmp2_7"
python3 script.py $hmp1_5 $hmp2_7
echo "Done with hmp1_5 vs hmp2_7"
echo
echo "hmp1_5 vs hmp2_8"
python3 script.py $hmp1_5 $hmp2_8
echo "Done with hmp1_5 vs hmp2_8"
echo
echo "hmp1_5 vs hmp2_9"
python3 script.py $hmp1_5 $hmp2_9
echo "Done with hmp1_5 vs hmp2_9"
echo
echo "hmp1_5 vs hmp2_10"
python3 script.py $hmp1_5 $hmp2_10
echo "Done with hmp1_5 vs hmp2_10"
echo
echo "-------------------------ALL DONE WITH HMP5---------------------------------"

echo "hmp1_6 vs hmp2_1"
python3 script.py $hmp1_6 $hmp2_1
echo "Done with hmp1_6 vs hmp2_1"
echo
echo "hmp1_6 vs hmp2_2"
python3 script.py $hmp1_6 $hmp2_2
echo "Done with hmp1_6 vs hmp2_2"
echo
echo "hmp1_6 vs hmp2_3"
python3 script.py $hmp1_6 $hmp2_3
echo "Done with hmp1_6 vs hmp2_3"
echo
echo "hmp1_6 vs hmp2_4"
python3 script.py $hmp1_6 $hmp2_4
echo "Done with hmp1_6 vs hmp2_4"
echo
echo "hmp1_6 vs hmp2_5"
python3 script.py $hmp1_6 $hmp2_5
echo "Done with hmp1_6 vs hmp2_5"
echo
echo "hmp1_6 vs hmp2_6"
python3 script.py $hmp1_6 $hmp2_6
echo "Done with hmp1_6 vs hmp2_6"
echo
echo "hmp1_6 vs hmp2_7"
python3 script.py $hmp1_6 $hmp2_7
echo "Done with hmp1_6 vs hmp2_7"
echo
echo "hmp1_6 vs hmp2_8"
python3 script.py $hmp1_6 $hmp2_8
echo "Done with hmp1_6 vs hmp2_8"
echo
echo "hmp1_6 vs hmp2_9"
python3 script.py $hmp1_6 $hmp2_9
echo "Done with hmp1_6 vs hmp2_9"
echo
echo "hmp1_6 vs hmp2_10"
python3 script.py $hmp1_6 $hmp2_10
echo "Done with hmp1_6 vs hmp2_10"
echo
echo "-------------------------ALL DONE WITH HMP6---------------------------------"

echo "hmp1_7 vs hmp2_1"
python3 script.py $hmp1_7 $hmp2_1
echo "Done with hmp1_7 vs hmp2_1"
echo
echo "hmp1_7 vs hmp2_2"
python3 script.py $hmp1_7 $hmp2_2
echo "Done with hmp1_7 vs hmp2_2"
echo
echo "hmp1_7 vs hmp2_3"
python3 script.py $hmp1_7 $hmp2_3
echo "Done with hmp1_7 vs hmp2_3"
echo
echo "hmp1_7 vs hmp2_4"
python3 script.py $hmp1_7 $hmp2_4
echo "Done with hmp1_7 vs hmp2_4"
echo
echo "hmp1_7 vs hmp2_5"
python3 script.py $hmp1_7 $hmp2_5
echo "Done with hmp1_7 vs hmp2_5"
echo
echo "hmp1_7 vs hmp2_6"
python3 script.py $hmp1_7 $hmp2_6
echo "Done with hmp1_7 vs hmp2_6"
echo
echo "hmp1_7 vs hmp2_7"
python3 script.py $hmp1_7 $hmp2_7
echo "Done with hmp1_7 vs hmp2_7"
echo
echo "hmp1_7 vs hmp2_8"
python3 script.py $hmp1_7 $hmp2_8
echo "Done with hmp1_7 vs hmp2_8"
echo
echo "hmp1_7 vs hmp2_9"
python3 script.py $hmp1_7 $hmp2_9
echo "Done with hmp1_7 vs hmp2_9"
echo
echo "hmp1_7 vs hmp2_10"
python3 script.py $hmp1_7 $hmp2_10
echo "Done with hmp1_7 vs hmp2_10"
echo
echo "-------------------------ALL DONE WITH HMP7---------------------------------"

echo "hmp1_8 vs hmp2_1"
python3 script.py $hmp1_8 $hmp2_1
echo "Done with hmp1_8 vs hmp2_1"
echo
echo "hmp1_8 vs hmp2_2"
python3 script.py $hmp1_8 $hmp2_2
echo "Done with hmp1_8 vs hmp2_2"
echo
echo "hmp1_8 vs hmp2_3"
python3 script.py $hmp1_8 $hmp2_3
echo "Done with hmp1_8 vs hmp2_3"
echo
echo "hmp1_8 vs hmp2_4"
python3 script.py $hmp1_8 $hmp2_4
echo "Done with hmp1_8 vs hmp2_4"
echo
echo "hmp1_8 vs hmp2_5"
python3 script.py $hmp1_8 $hmp2_5
echo "Done with hmp1_8 vs hmp2_5"
echo
echo "hmp1_8 vs hmp2_6"
python3 script.py $hmp1_8 $hmp2_6
echo "Done with hmp1_8 vs hmp2_6"
echo
echo "hmp1_8 vs hmp2_7"
python3 script.py $hmp1_8 $hmp2_7
echo "Done with hmp1_8 vs hmp2_7"
echo
echo "hmp1_8 vs hmp2_8"
python3 script.py $hmp1_8 $hmp2_8
echo "Done with hmp1_8 vs hmp2_8"
echo
echo "hmp1_8 vs hmp2_9"
python3 script.py $hmp1_8 $hmp2_9
echo "Done with hmp1_8 vs hmp2_9"
echo
echo "hmp1_8 vs hmp2_10"
python3 script.py $hmp1_8 $hmp2_10
echo "Done with hmp1_8 vs hmp2_10"
echo
echo "-------------------------ALL DONE WITH HMP8---------------------------------"

echo "hmp1_9 vs hmp2_1"
python3 script.py $hmp1_9 $hmp2_1
echo "Done with hmp1_9 vs hmp2_1"
echo
echo "hmp1_9 vs hmp2_2"
python3 script.py $hmp1_9 $hmp2_2
echo "Done with hmp1_9 vs hmp2_2"
echo
echo "hmp1_9 vs hmp2_3"
python3 script.py $hmp1_9 $hmp2_3
echo "Done with hmp1_9 vs hmp2_3"
echo
echo "hmp1_9 vs hmp2_4"
python3 script.py $hmp1_9 $hmp2_4
echo "Done with hmp1_9 vs hmp2_4"
echo
echo "hmp1_9 vs hmp2_5"
python3 script.py $hmp1_9 $hmp2_5
echo "Done with hmp1_9 vs hmp2_5"
echo
echo "hmp1_9 vs hmp2_6"
python3 script.py $hmp1_9 $hmp2_6
echo "Done with hmp1_9 vs hmp2_6"
echo
echo "hmp1_9 vs hmp2_7"
python3 script.py $hmp1_9 $hmp2_7
echo "Done with hmp1_9 vs hmp2_7"
echo
echo "hmp1_9 vs hmp2_8"
python3 script.py $hmp1_9 $hmp2_8
echo "Done with hmp1_9 vs hmp2_8"
echo
echo "hmp1_9 vs hmp2_9"
python3 script.py $hmp1_9 $hmp2_9
echo "Done with hmp1_9 vs hmp2_9"
echo
echo "hmp1_9 vs hmp2_10"
python3 script.py $hmp1_9 $hmp2_10
echo "Done with hmp1_9 vs hmp2_10"
echo
echo "-------------------------ALL DONE WITH HMP9---------------------------------"

echo "hmp1_10 vs hmp2_1"
python3 script.py $hmp1_10 $hmp2_1
echo "Done with hmp1_10 vs hmp2_1"
echo
echo "hmp1_10 vs hmp2_2"
python3 script.py $hmp1_10 $hmp2_2
echo "Done with hmp1_10 vs hmp2_2"
echo
echo "hmp1_10 vs hmp2_3"
python3 script.py $hmp1_10 $hmp2_3
echo "Done with hmp1_10 vs hmp2_3"
echo
echo "hmp1_10 vs hmp2_4"
python3 script.py $hmp1_10 $hmp2_4
echo "Done with hmp1_10 vs hmp2_4"
echo
echo "hmp1_10 vs hmp2_5"
python3 script.py $hmp1_10 $hmp2_5
echo "Done with hmp1_10 vs hmp2_5"
echo
echo "hmp1_10 vs hmp2_6"
python3 script.py $hmp1_10 $hmp2_6
echo "Done with hmp1_10 vs hmp2_6"
echo
echo "hmp1_10 vs hmp2_7"
python3 script.py $hmp1_10 $hmp2_7
echo "Done with hmp1_10 vs hmp2_7"
echo
echo "hmp1_10 vs hmp2_8"
python3 script.py $hmp1_10 $hmp2_8
echo "Done with hmp1_10 vs hmp2_8"
echo
echo "hmp1_10 vs hmp2_9"
python3 script.py $hmp1_10 $hmp2_9
echo "Done with hmp1_10 vs hmp2_9"
echo
echo "hmp1_10 vs hmp2_10"
python3 script.py $hmp1_10 $hmp2_10
echo "Done with hmp1_10 vs hmp2_10"
echo
echo "-------------------------ALL DONE WITH HMP10---------------------------------"