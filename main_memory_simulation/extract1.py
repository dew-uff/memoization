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
            time = parts[1].strip()
            current_set_data[current_num_dicts][f'Trial {current_trial}'] = time

        i += 1

    return sets

def output_results(sets):
    for set_name, trials in sets.items():
        print(f"{set_name}")
                
        print("num_dicts\t" + "\t".join(trials['0'].keys()))
        
        for num_dicts in ['0', '1', '2', '2-fast']:
          print(f"{num_dicts}\t" + "\t".join(trials[num_dicts].values()))
        
        print()

# Path to your log file
file_path = 'log.txt'

# Parse the log file
sets = parse_log_file(file_path)

# Output the results in the desired format
output_results(sets)
