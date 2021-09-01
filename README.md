Hello this is my local copy of the work done to modify Jellyfish code

### Created: 13th August
---
1) 3 Time comparisons: Refer to their reports for further details. Most of the time comparison on the local machine has been performed using 5098 sequences.fasta file. Other time comparisons are present in the $CFS/m3788/projects/min_Jellyfish/Kush directory in the NERSC cori system

2) Modified Files: Major modifications were done on count_main.cc file in the subcommands folder. Other files modified include mer_dna.hpp and mer_iterator.hpp in the include/jellyfish subfolder. Used the sketch.c file from Minimap2 to write the code for minimizers in count_main.cc.

3) Code: 2 Major codes as of now: Jellyfish_hacking and Jellyfish_modulo_random.
i) Jellyfish_hacking_Aug13: Was built by integrating sketch.c in the count_main.cc file. Also added a bit of code in mer_dna and mer_iterator to allow *rid* to work well allowing correct reading of multiline fastas.
ii) Jellyfish_modulo_random: No functional changes in any other file except for count_main.cc. There are 3 if/endif blocks in the code. One for modulo, one for random_number_generator and the third for the actual original Jellyfish implementation. Make sure to make the other 2 blocks as 0 and the required one as 1 before compiling.

### Update 1: 16th and 17th August
---

Added a folder differences_threaded with a python script to find out differences between the results for 2 different runs on the sequences.fasta file using different number of threads from the input folder. 2 test sequences were also used to verify the correctness of the code. All the differences (Mismatch in count, Not present in File1, Not present in File2) as well as Correct matches are written to the results folder.

Observations: There is a huge disparity between the results for single-threaded vs multi-threaded code. Disparity exists between two_threaded vs 4_threaded runs as well. Multiple runs of the multi-threaded code do not give the same results. Multiple runs of the single threaded code give the same results.

##### After running some more tests....

Turns out the problem wasnt the multithreaded functionality but rather the *canonical* flag *-C*. As soon as we remove this flag, both single and multithreaded runs give the exact same results.

I also tested with simulated fasta files generated using the **fasta simulator**, which creates pure fasta files (with no ambiguous bases *N*). On running multithreaded runs on this fasta file with the Canonical flag, the mismatch count always came out to be 0, even though Not present in File x wasn't 0. On removing the Canonical flag, all the matches were correct.

Final set of tests were done using the minimap2 test set MT_human.fa (results present in the difference_threaded folder). Even there, all pairwise comparisons for -C flag enabled runs resulted in discrepancies, whereas all the runs with -C flag excluded gave the same results.

##### MY CURRENT KNOWLEDGE! 

As of now, my hypothesis is that the discrepancy is because of different hash functions used by Minimap2 and Jellyfish to decide which of the two canonical kmers is smaller, but if only this was the problem, then why do multiple runs of the same sequence with the same number of non-singular threads result in different dump files? Need to know more about this.

I ran some more tests (see the sequences_fasta in difference_threaded) in the modified and modified_norev folders to check how the -C flag and multithreaded change dumps for the same file with the same number of threads in multiple runs. So, on removing the -C flag (modified_norev), the results of multiple runs are the same, irrespective of the number of threads (1 or 4). But on keeping the -C flag (modified), the results of multiple runs of single threads remains the same, but not so for multiple_threads.

<!-- #### PICTORIAL REPRESENTATION OF MY UNDERSTANDING...

![-C and multithreaded understanding](difference_threaded/pic.jpeg?raw=true "-C and multithreaded understanding") -->

We should compare our code without the -C flag and the original Jellyfish code with the -C flag for correct comparison basically.

---

### Update 2: August 18th

Aug17_updated was added in Code which runs significantly faster than the other 2 versions.

Added more comparisons for difference_threaded.

Also added **distribution_plotter** to compare the plots for the kmer distributions as returned by the original jellyfish code and our Aug17_updated version. The plot shows that along the x-axis the distribution remains similar just the y-axis values get scaled (by a factor of 11 (or simply w+1/2)).

<!-- The plot for 50x genome for SARS-CoV-2 is shown below:

![50seq plots](distribution_plotter/50seq_plots.png?raw=true "50seq plots") -->

---

### Update 3: August 20th

Incomplete push. The sanity checker was implemented, which runs properly for nearly all cases. There is some minor difference though. Hoping to resolve it soon....

---

### Initial results (k-mers vs Minimizers: k = w = 21) : September 1st
All are the Illumina paired-end Human data in the cori cluster. I have not performed any pre-processing mentioned in findGSE paper before running it through Jellyfish. Will do that next time. 
| Data  | K-mer      |     |      | Minimizer  |     |      |
| ---   | ---        | --- | ---  | ---        | --- | ---  |
|       | G          | N   | C    | G          | N   | C    |
| 30x   | 3036 Mb    | ?   | 29.7 | 279.29 Mb  | ?   | 27.01|
| 50x_1 | 3097.73 Mb | ?   | 43.25| 284.037 Mb | ?   | 39.42|
| 50x_2 | 3142.92 Mb | ?   | 42.31|            |     |      |
---
