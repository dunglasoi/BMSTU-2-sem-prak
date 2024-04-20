#!/usr/bin/bash

sizes="10 20 30 40 50 60 70 80 90 100"
# sizes="10 50 100"
opts="Os O0 O3 O2"
dot_product="0 1"
dot_product_desc=("no_transpose" "with_transpose")

mkdir -p ./data

for opt in $opts; do
    for dp in $dot_product; do
        for size in $sizes; do
            echo -n -e "$opt-${dot_product_desc[$dp]} $size \r"
            ./apps/app_"$opt"_"${dot_product_desc[$dp]}"_"$size".exe >> \
                ./data/data_"$opt"_"${dot_product_desc[$dp]}"_"$size".txt
        done
    done
done
