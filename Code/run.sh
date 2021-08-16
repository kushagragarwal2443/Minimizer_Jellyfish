jellyfish count -m 21 -s 1M -t 1 -C ../sanity_checker/simulated_fasta.fasta
echo "Finished counting"
jellyfish dump mer_counts.jf > simulated_dumps.fa
echo "Finished Dump"
