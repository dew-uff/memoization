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

line = "Script Name\tData Loading Strategy\tMedian Result\n"
output_lines.append(line)
for command, times in command_times.items():
    script_name = command.split(' ')[1].strip()
    perhaps_input = command.split(' ')[2].strip()
    words = command.split(' ')
    retrieval_strat = words.index('--retrieval-strategy')
    retrieval_exec = words.index('--retrieval-exec-mode')
    retrieval_exec_mode = ' '.join([words[retrieval_strat + 1], words[retrieval_exec + 1]]).strip()
    
    if times:
        median_time = statistics.median(times)
        line = f"{script_name}\t{retrieval_exec_mode}\t{str(median_time)}\n"

        # stat, p_value = check_shapiro_wilk(times, f"{script_name}-{retrieval_exec_mode}")
        # line = f"{script_name}\t{retrieval_exec_mode}\t{p_value > 0.05}\t{str(stat).replace('.', ',')}\t{str(p_value).replace('.', ',')}\n"
        
        # line = f"{script_name}\t{perhaps_input}\t{retrieval_exec_mode}"
        # for t in times:
        #     line += f"\t{str(t).replace('.', ',')}"
        # line += "\n"
        output_lines.append(line)

# Write to the output file
with open(output_file, 'w') as out:
    out.writelines(output_lines)
