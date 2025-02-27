#!/bin/bash

# Output file where all results will be concatenated
output_file="median_results.txt"

# Clear the output file if it already exists
: > "$output_file"

# Loop through numbers 1 to 100
for i in $(seq 1 100); do
    # Run the Python script and generate output files a1, a2, ..., a100
    python extract_median_results.py "results_draw_${i}.txt" "temp_${i}"
    
    # Append the contents of each generated file to the final output
    cat "temp_${i}" >> "$output_file"

    rm "temp_${i}"
done

echo "All results concatenated into $output_file"