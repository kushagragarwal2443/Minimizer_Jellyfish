jellyfish count -m 21 -s 1M -t 4 -C seq/sequences.fasta
echo "Finished counting"
jellyfish dump mer_counts.jf > mer_counts_dumps.fa
echo "Finished Dump"
