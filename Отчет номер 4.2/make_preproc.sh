#!/usr/bin/bash

sizes="10 20 30 40 50 60 70 80 90 100"
# sizes="10 50 100"
opts="Os O0 O3 O2"
opts_desc=("Os" "O0" "O3" "O2")
dot_product="0 1"
dot_product_desc=("no_transpose" "with_transpose")

rm -rf ./preproc_data/
mkdir -p ./preproc_data

files=$(ls ./data/)
for file in $files; do
    python3 preproc.py ./data/"$file" ./preproc_data/"$file"
done

rm -rf ./postproc_data/
mkdir -p ./postproc_data

# График 1
for size in $sizes; do
    for dp in $dot_product; do
        for opt in $opts; do
            echo "$size $(cat ./preproc_data/data_"$opt"_"${dot_product_desc[$dp]}"_"$size".txt)" >> \
                ./postproc_data/data_"$opt"_"${dot_product_desc[$dp]}".txt
        done
    done
done

# График 2
for size in $sizes; do
    for dp in $dot_product; do
        echo "$size $(cat ./preproc_data/data_"${opts_desc[3]}"_"${dot_product_desc[$dp]}"_"$size".txt)" >> \
            ./postproc_data/data_2_"${opts_desc[3]}"_"${dot_product_desc[$dp]}".txt
    done
done
