#!/bin/bash
k=16
w=12
r=150
threads=8
cd ../fasta_simulator
python3 fasta_simulator.py
# python3 reads_to_fastas.py
cd ../sanity_checker
jellyfish count -C -m $k -w $w -r $r -s 1M -t $threads ../fasta_simulator/simulated_fasta.fasta
jellyfish dump mer_counts.jf > jelly.fa
rm mer_counts.jf
# rm -rf reads
# mkdir reads
# cd reads
# READS="/home/kushagra/Documents/IISc_Internship/Jellyfish/fasta_simulator/reads/*"
# counter=0
# for filename in $READS; do
#     jellyfish count -C -m $k -s 1M -t $threads $filename
#     name="$counter.fa"
#     jellyfish dump mer_counts.jf > $name
#     rm mer_counts.jf
#     counter=$((counter+1))
# done
# cd ..
python3 iterative_counter_robust_withC.py
cd ../difference_threaded
echo "SANITY RESULTS"
echo
python3 multithreaded_sanity.py
# echo
# echo "READS WITH JELLY"
# python3 reads_with_jelly.py
# echo
# echo "READS WITH EXPECTED"
# python3 reads_with_expected.py
# cd ../sanity_checker