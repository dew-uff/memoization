# Input and output file paths
input_file = "combined_reports.txt"
output_file = "final.txt"

# Function to extract experiment name from file path
def extract_experiment_name(line):
    # Example input: === Experimentos/speedupy_experiments/01pilots/01pilots_exp01_fibonacci/report-1718747527.txt ===
    # Expected output: 01pilots/01pilots_exp01_fibonacci
    first_cut = '=== Experimentos/speedupy_experiments/' if 'speedupy_experiments' in line else '=== Experimentos/'
    return line.split(first_cut)[1].split('/report-')[0]

# Open input and output files
with open(input_file, 'r') as infile, open(output_file, 'w') as outfile:
    # Write headers to output file
    outfile.write("Experimento\tg_num_deterministic_calls\tg_num_cache_misses\tg_num_cache_misses (%)\tcache_size\n")
    
    experiment_name = None
    for line in infile:
        line = line.strip()
        if line.startswith('=== ') and line.endswith(' ==='):
            experiment_name = extract_experiment_name(line)
            outfile.write(f"{experiment_name}\t")
        elif line:
            parts = line.split(' = ')
            key = parts[0].strip()
            value = parts[1].strip()
            
            if key == 'g_num_deterministic_calls':
                g_num_deterministic_calls = value
            elif key == 'g_num_cache_misses':
                g_num_cache_misses = value
            elif key == 'g_num_cache_misses (%)':
                g_num_cache_misses_percent = value.replace('.', ',') + '%'
            elif key == 'cache_size':
                cache_size = value
                outfile.write(f"{g_num_deterministic_calls}\t{g_num_cache_misses}\t{g_num_cache_misses_percent}\t{cache_size}\n")
