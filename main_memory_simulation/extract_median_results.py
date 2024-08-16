import sys
import statistics, time

def parse_log_file(file_path):
    with open(file_path, 'r') as file:
        log_data = file.read()

    sets = {}
    current_set = None
    current_trial = None
    lines = log_data.splitlines()

    i = 0
    while i < len(lines):
        line = lines[i].strip()
        
        # Check if the line indicates the start of a new SET
        if line.startswith('Running for SET_'):
            current_set = line.split(' ')[2][:-1]  # Extract SET number
            current_set_data = {'0': {}, '1': {}, '2': {}, '2-fast': {}}
            sets[current_set] = current_set_data

        elif line.startswith('>>>>>>>>>>> Trial'):
            current_trial = line.split(' ')[2]

        elif line.startswith('>>>> Running for ') and line.endswith(' dictionaries!'):
            current_num_dicts = line.split(' ')[3]
        
        elif line.startswith('TOTAL EXECUTION TIME: '):
            parts = lines[i].split(':')
            exec_time = parts[1].strip()
            current_set_data[current_num_dicts][f'Trial {current_trial}'] = float(exec_time)

        i += 1

    return sets

def output_results(sets, output_file):
    with open(output_file, 'w') as f:
        for set_name, trials in sets.items():
            set_name += f"_{time.time()}"

            # f.write("set\tnum_dicts\tmedian\n")
            
            for num_dicts in ['0', '1', '2', '2-fast']:
              median_time = statistics.median(trials[num_dicts].values())
              row = f"{set_name}\t{num_dicts}\t{median_time}\n"

              row = row.replace('.', ',')
              f.write(row)
                
            f.write("\n")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python3 script.py <input_log_file> <output_file>")
        sys.exit(1)

    input_file = sys.argv[1]
    output_file = sys.argv[2]

    # Parse the log file
    sets = parse_log_file(input_file)

    # Output the results in the desired format
    output_results(sets, output_file)
