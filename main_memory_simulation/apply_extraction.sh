#!/bin/bash

for input_file in results_draw_*.txt; do
    base_name=$(basename "$input_file" .txt)
    output_file="out_${base_name#file_}.txt"    
    python extract_raw_data.py "$input_file" "$output_file"
done

# To join all output files, execute on the terminal: cat out_*.txt > combined_my_output.txt