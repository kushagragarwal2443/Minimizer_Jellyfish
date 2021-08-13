Hello!!

Created 13th August

Last Update 13th August

Major components:

1) 3 Time comparisons: Refer to their reports for further details. Most of the time comparison on the local machine has been performed using 5098 sequences.fasta file. Other time comparisons are present in the $CFS/m3788/projects/min_Jellyfish/Kush directory in the NERSC cori system

2) Modified Files: Major modifications were done on count_main.cc file in the subcommnads folder. Other files modified include mer_dna.hpp and mer_iterator.hpp in the include/jellyfish subfolder. Used the sketch.c file from Minimap2 to write the code for minimizers in count_main.cc.

3) Code: 2 Major codes as of now: Jellyfish_hacking and Jellyfish_modulo_random.
i) Jellyfish_hacking: Was built by integrating sketch.c in the count_main.cc file. Also added a bit of code in mer_dna and mer_iterator to allow *rid* to work well allowing correct reading of multiline fastas.
ii) Jellyfish_modulo_random: No functional changes in any other file except for count_main.cc. There are 3 if/endif blocks in the code. One for modulo, one for random_number_generator and the third for the actual original Jellyfish implementation. Make sure to make the other 2 blocks as 0 and the required one as 1 before compiling.
