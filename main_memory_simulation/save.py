import csv
from collections import defaultdict

def process_log_file(filename):
    # Initialize a nested dictionary with default values
    data = {}
    
    with open(filename, 'r') as file:
        for row in file:
            row = row.split('\t')
            if len(row) == 3:
                # Extract relevant data
                set_name = row[0].split('_')[0] + '_' + row[0].split('_')[1]
                key = row[1]
                value = row[2].replace(',', '.')  # Replace comma with dot for float conversion
                
                # Append the value to the nested dictionary
                if set_name not in data: data[set_name] = {}
                if key not in data[set_name]: data[set_name][key] = []
                data[set_name][key].append(float(value))
    return data

def print_data(data):
    for set_name, values in data.items():
        print(f'{set_name}:')
        for key, value_list in values.items():
            print(f'  {key}: {value_list}')

# Example usage
filename = 'log.txt'  # Replace with your log file name
data = process_log_file(filename)
print_data(data)
