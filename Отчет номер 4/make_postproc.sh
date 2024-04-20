#!/usr/bin/bash

rm -rf ./graph/
mkdir -p ./graph

python3 plot_1.py &
python3 plot_2.py &
python3 plot_3.py &
python3 plot_4.py &
