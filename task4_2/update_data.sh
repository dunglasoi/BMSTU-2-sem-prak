#!/bin/bash

#declare -a sizes=("1000" "5000" "10000")
declare -a sizes=("10" "20" "30" "40" "50" "60" "70" "80" "90" "100")

declare -a opts=("Os" "O0" "O3" "O2")

declare -a dot_product=("0" "1")

declare -a dot_product_desc=("no_transpose" "with_transpose")

mkdir -p ./data


for opt in "${opts[@]}"; do
    for dp in "${dot_product[@]}"; do
        for size in "${sizes[@]}"; do
            printf "%s-%s-%s-%s \r" "$opt" "${dot_product_desc[$dp]}" "$size"
            ./apps/app_"$opt"_"${dot_product_desc[$dp]}"_"$size".exe >> ./data/data_"$opt"_"${dot_product_desc[$dp]}"_"$size".txt
            
            if [ $? -eq 0 ]; then
                echo "Execution successful for $opt, ${dot_product_desc[$dp]}, $size"
                
                output=$(cat ./data/data_"$opt"_"${dot_product_desc[$dp]}"_"$size".txt)
                
                if [ "$output" -eq 0 ]; then
                    echo "Output is correct for $opt, ${dot_product_desc[$dp]}, $size"
                else
                    echo "Output is incorrect for $opt, ${dot_product_desc[$dp]}, $size"
                fi
            else
                echo "Execution failed for $opt, ${dot_product_desc[$dp]}, $size"
            fi
        done
    done
done

