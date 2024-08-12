import sys
import statistics

# Function to parse execution time from a line
def parse_execution_time(line):
    if line.startswith('TOTAL EXECUTION TIME:'):
        return float(line.split(':')[-1].strip())
    return None

if len(sys.argv) != 3:
    print("Usage: python process_log.py <input_file> <output_file>")
    sys.exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]

command_times = {}
current_command = None
with open(input_file, 'r') as file:
    for line in file.readlines():
        line = line.strip()
        if line.startswith('python'):
            current_command = line
            if current_command not in command_times:
                command_times[current_command] = []
        elif current_command and line.startswith('TOTAL EXECUTION TIME:'):
            time = parse_execution_time(line)
            if time is not None:
                command_times[current_command].append(time)
            current_command = None
            

# Calculate median times and prepare output
output_lines = []
for command, times in command_times.items():
    script_name = command.split(' ')[1].strip()
    words = command.split(' ')
    index_s = words.index('-s')
    storage = words[index_s + 1].strip()
    
    if times:
        median_time = statistics.median(times)
        line = f"{script_name}\t{storage}\t{str(median_time).replace('.', ',')}\n"

        # line = f"{script_name}\t{storage}\t{times}\n"
        
        # line = f"{script_name}\t{storage}"
        # for t in times:
        #     line += f"\t{str(t).replace('.', ',')}"
        # line += "\n"
        output_lines.append(line)

# Write to the output file
with open(output_file, 'w') as out:
    out.writelines(output_lines)
