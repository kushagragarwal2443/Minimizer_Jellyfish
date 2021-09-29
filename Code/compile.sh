#!/bin/bash
cd Jellyfish_hacking_Illumina_Sep29
autoreconf -i
./configure
make -j 4
sudo make install
cd ..

echo "DONE"
