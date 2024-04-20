#!/usr/bin/bash

#declare -a sizes=("1000" "5000" "10000")
declare -a sizes=("10" "20" "30" "40" "50" "60" "70" "80" "90" "100")

declare -a opts=("Os" "O0" "O3" "O2")

declare -a opts_desc=("Os" "O0" "O3" "O2")

declare -a dot_product=("0" "1")

declare -a dot_product_desc=("no_transpose" "with_transpose")

rm -rf ./preproc_data/
mkdir -p ./preproc_data

for file in ./data/*; do
    python3 preprocessing.py "$file" "./preproc_data/$(basename "$file")"
done

rm -rf ./postproc_data/
mkdir -p ./postproc_data

# PLOT_LINEAR 1
for size in "${sizes[@]}"; do
    for dp in "${dot_product[@]}"; do
        for opt in "${opts[@]}"; do
            if [[ $dp == "0" ]]; then
                filename="./postproc_data/data_${opt}_${dot_product_desc[$dp]}.txt"
                echo "$size $(cat ./preproc_data/data_${opt}_${dot_product_desc[$dp]}_${size}.txt)" >> "$filename"
            elif [[ $dp == "1" ]]; then
                filename="./postproc_data/data_${opt}_${dot_product_desc[$dp]}_special.txt"
                echo "$size $(cat ./preproc_data/data_${opt}_${dot_product_desc[$dp]}_${size}.txt)" >> "$filename"
            fi
        done
    done
done




if [ -d ./postproc_data ]; then
    echo "Postprocessing completed successfully."
else
    echo "Postprocessing failed."
fi