import sys

# Check if the correct number of arguments are provided
if len(sys.argv) != 3:
    print("Usage: python extract_logs.py <input_file> <output_file>")
    sys.exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]

second_exec_time = False

with open(input_file, 'r') as f_input, \
     open(output_file, 'w') as f_output:
    for line in f_input:
        line = line.strip()
        if line.startswith('python '):
            f_output.write(line + '\n')
            second_exec_time = False
        elif line.startswith('TOTAL EXECUTION TIME: '):
            if second_exec_time:
                f_output.write(line + '\n\n>>>>>>>>>>>>>>>>\n')
            else:
                second_exec_time = True