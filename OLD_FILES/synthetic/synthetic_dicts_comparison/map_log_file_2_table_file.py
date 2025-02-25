import sys

# Check if correct number of arguments are provided
if len(sys.argv) != 3:
    print("Usage: python script.py input_file output_file")
    sys.exit(1)

input_file = sys.argv[1]
output_file = sys.argv[2]

# Dictionary to store data for each storage type
data = {}

# Read input file
with open(input_file, 'r') as f:
    lines = f.readlines()

# Process each line
for line in lines:
    if line.startswith("Storage:"):
        storage_type = line.strip()
    elif line.startswith("Data Size:"):
        data_size = line.split(": ")[1].strip()
    elif line.startswith("Execution time:"):
        execution_time = line.split(": ")[1].strip().replace(" seconds", "").replace(".", ",")
        # If storage_type already exists in data, append the data size and execution time
        if storage_type in data:
            data[storage_type].append((data_size, execution_time))
        else:
            data[storage_type] = [(data_size, execution_time)]

# Write output to file
with open(output_file, 'w') as f:
    for storage_type, values in data.items():
        f.write(f"{storage_type}\n")
        f.write("Data\tExecution time\n")
        for data_size, execution_time in values:
            f.write(f"{data_size}\t{execution_time}\n")
        f.write("\n")
