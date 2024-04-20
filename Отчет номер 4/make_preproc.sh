#!/usr/bin/bash

sizes="500 1000 1500 2000 2500 3000 3500 4000 4500 5000 \
    5500 6000 6500 7000 7500 8000 8500 9000 9500 10000"
#sizes="1000 5000 10000"
opts="O0 O2"
opts_desc=("O0" "O2")
init_array="0 1"
init_array_desc=("sorted" "random")
access_array="0 1 2"
access_array_desc=("a" "b" "c")

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
    for access in $access_array; do
        for opt in $opts; do
            echo "$size $(cat ./preproc_data/data_"${init_array_desc[0]}"_"$opt"_"${access_array_desc[$access]}"_"$size".txt)" >> \
                ./postproc_data/data_"${init_array_desc[0]}"_"$opt"_"${access_array_desc[$access]}".txt
        done
    done
done

# График 2
for size in $sizes; do
    for access in $access_array; do
        for opt in $opts; do
            echo "$size $(cat ./preproc_data/data_"${init_array_desc[0]}"_"$opt"_"${access_array_desc[$access]}"_"$size".txt)" >> \
                ./postproc_data/data_"${init_array_desc[1]}"_"$opt"_"${access_array_desc[$access]}".txt
        done
    done
done

# График 3
for size in $sizes; do
    for access in $access_array; do
        for init in $init_array; do
            echo "$size $(cat ./preproc_data/data_"${init_array_desc[0]}"_"$opt"_"${access_array_desc[$access]}"_"$size".txt)" >> \
                ./postproc_data/data_"${opts_desc[1]}"_"${init_array_desc[$init]}"_"${access_array_desc[$access]}".txt
        done
    done
done

# График 4
for size in $sizes; do
    for init in $init_array; do
        echo "$size $(cat ./preproc_data/data_"${init_array_desc[0]}"_"$opt"_"${access_array_desc[0]}"_"$size".txt)" >> \
            ./postproc_data/data_"${access_array_desc[0]}"_"${opts_desc[1]}"_"${init_array_desc[$init]}".txt
    done
done
