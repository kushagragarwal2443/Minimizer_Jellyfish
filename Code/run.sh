/usr/bin/time --verbose jellyfish count -m 21 -s 1M -t 1 seq/red_sequences.fasta
echo "Finished counting"
jellyfish dump mer_counts.jf > Aug17_updated_norev_dumps.fa
echo "Finished Dump"
/usr/bin/time --verbose jellyfish count -m 21 -s 1M -t 1 -C seq/red_sequences.fasta
echo "Finished counting"
jellyfish dump mer_counts.jf > Aug17_updated_dumps.fa
echo "Finished Dump"
