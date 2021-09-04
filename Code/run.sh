jellyfish count -m 4 -s 1M -t 1 ../fasta_simulator/simulated_fasta.fasta
echo "Finished counting"
jellyfish dump mer_counts.jf > jelly.fa
echo "Finished Dump"
