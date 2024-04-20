#!/usr/bin/bash


declare -a sizes=("10" "20" "30" "40" "50" "60" "70" "80" "90" "100")

declare -a opts=("Os" "O0" "O3" "O2")

declare -a dot_product=("0" "1")

declare -a dot_product_desc=("no_transpose" "with_transpose")

mkdir -p ./apps


for opt in "${opts[@]}"; do
    for dp in "${!dot_product[@]}"; do
        for i in "${sizes[@]}"; do
            printf "%s-%s-%s-%s\r" "$opt" "${dot_product_desc[$dp]}" "$i"
            gcc -std=c99 -Wall -Werror -Wextra -Wpedantic \
                "-$opt" \
                "-DNMAX=$i" \
                -DDP="$dp" \
                main.c -o "./apps/app_${opt}_${dot_product_desc[$dp]}_$i.exe" -lm
            
            if [ $? -eq 0 ]; then
                echo "Compilation successful for $opt, ${dot_product_desc[$dp]}, $i"
                if [ -f "./apps/app_${opt}_${dot_product_desc[$dp]}_$i.exe" ]; then
                    echo "Executable file exists. Running the program..."
                    ./apps/app_${opt}_${dot_product_desc[$dp]}_$i.exe
                else
                    echo "Executable file does not exist."
                fi
            else
                echo "Compilation failed for $opt, ${dot_product_desc[$dp]}, $i"
            fi
        done
    done
done
