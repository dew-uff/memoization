import sys

if len(sys.argv) != 3:
    print("Usage: python summarize_output.py <input_file> <summary_file>")
    sys.exit(1)

input_file = sys.argv[1]
summary_file = sys.argv[2]

scripts = {}

with open(input_file, 'r') as file:
    lines = file.readlines()

# Process each line to extract and organize data
for l in lines:
    if l.startswith('python'):
        script_name = l.split(' ')[1].strip()
        
        words = l.split(' ')
        index_s = words.index('--num-dict')
        num_dict = words[index_s + 1].strip()
    
        if script_name not in scripts:
            scripts[script_name] = {}
            scripts[script_name][num_dict] = None

    elif l.startswith('TOTAL EXECUTION TIME (MEAN):'):
        mean_execution_time = l.split(':')[-1].strip().replace('.', ',')
        scripts[script_name][num_dict] = mean_execution_time

# Write the summary to the summary_file
with open(summary_file, 'w') as outfile:
    outfile.write(f"Script\t0 dict\t1 dict\n")
    for command_name, storage_times in scripts.items():
        outfile.write(f"{command_name}\t{storage_times['0']}\t{storage_times['1']}\n")
print(f"Summary written to {summary_file}")
