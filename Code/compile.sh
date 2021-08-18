#!/bin/bash
cd Jellyfish_hacking_Aug17_updated
autoreconf -i
./configure
make -j 4
sudo make install
cd ..

echo "DONE"
