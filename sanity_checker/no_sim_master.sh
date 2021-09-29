# jellyfish count -m 4 -s 1M -t 1 ../fasta_simulator/simulated_fasta.fasta
jellyfish count -m 21 -s 1M -t 4 ../fasta_simulator/simulated_fasta.fasta
jellyfish dump mer_counts.jf > jelly.fa
rm mer_counts.jf
python3 iterative_counter_robust.py
cd ../difference_threaded
python3 multithreaded_sanity.py
cd ../sanity_checker