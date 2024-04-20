#!/usr/bin/bash

sizes="500 1000 1500 2000 2500 3000 3500 4000 4500 5000 \
    5500 6000 6500 7000 7500 8000 8500 9000 9500 10000"
#sizes="1000 5000 10000"
opts="O0 O2"
init_array="0 1"
init_array_desc=("sorted" "random")
access_array="0 1 2"
access_array_desc=("a" "b" "c")

mkdir -p ./apps

for init in $init_array; do
    for opt in $opts; do
        for access in $access_array; do
            for i in $sizes; do
                echo -n -e "${init_array_desc[$init]}-$opt-${access_array_desc[$access]}-$i \r"
                gcc -std=c99 -Wall -Werror -Wextra -Wpedantic \
                    -"$opt" \
                    -DNMAX="$i" \
                    -DINIT="$init" \
                    -DACCESS="$access" \
                    task_2.c -o ./apps/app_"${init_array_desc[$init]}"_"$opt"_"${access_array_desc[$access]}"_"$i".exe
            done
        done
    done
done
