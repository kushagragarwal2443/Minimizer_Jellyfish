#!/bin/bash
cd Jellyfish_hacking_Single
autoreconf -i
./configure
make -j 4
sudo make install
cd ..

echo "DONE"
