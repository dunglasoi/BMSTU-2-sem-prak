#!/usr/bin/bash

rm -rf ./graph/
mkdir -p ./graph

if [ -d ./graph ]; then
    python3 plot_liner1.py &
    echo "success."
fi