#!/bin/bash
k=27
w=27
threads=16

cd ../fasta_simulator
python3 fasta_simulator.py
cd ../sanity_checker
jellyfish count -C -m $k -s 1M -t $threads ../fasta_simulator/simulated_fasta.fasta
jellyfish dump mer_counts.jf > jelly1.fa
rm mer_counts.jf

echo "SIMULATION ONE DONE"

cd ../fasta_simulator
python3 fasta_simulator.py
cd ../sanity_checker
jellyfish count -C -m $k -s 1M -t $threads ../fasta_simulator/simulated_fasta.fasta
jellyfish dump mer_counts.jf > jelly2.fa
rm mer_counts.jf

echo "SIMULATION TWO DONE"

python3 bc_distance_computation.py jelly1.fa jelly1.fa