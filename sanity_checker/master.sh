#!/bin/bash

# for i in {1..10000}
# do
#     cd ../fasta_simulator
#     python3 fasta_simulator.py
#     cd ../sanity_checker
#     jellyfish count -m 4 -s 1M -t 1 ../fasta_simulator/simulated_fasta.fasta
#     jellyfish dump mer_counts.jf > jelly.fa
#     rm mer_counts.jf
#     python3 iterative_counter_robust.py
#     cd ../difference_threaded
#     python3 multithreaded_sanity_loop.py
#     cd ../sanity_checker
# done

cd ../fasta_simulator
python3 fasta_simulator.py
cd ../sanity_checker
jellyfish count -m 21 -C -s 1M -t 1 ../fasta_simulator/simulated_fasta.fasta
jellyfish dump mer_counts.jf > jelly.fa
rm mer_counts.jf
python3 iterative_counter_withC.py
cd ../difference_threaded
python3 multithreaded_sanity.py
cd ../sanity_checker
