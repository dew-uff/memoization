import csv
from collections import defaultdict

def process_log_file(filename):
    # Initialize a nested dictionary with default values
    data = {'0': [], '1': [], '2': [], '2-fast': []}
    
    with open(filename, 'r') as file:
        for row in file:
            row = row.split('\t')
            if len(row) == 3:
                key = row[1]
                value = row[2].replace(',', '.')  # Replace comma with dot for float conversion
                
                # Append the value to the nested dictionary
                data[key].append(float(value))
    return data

def print_data(data):
    for key, value_list in data.items():
        print(f'{key}: {value_list}')

# Example usage
filename = 'log.txt'  # Replace with your log file name
data = process_log_file(filename)
print_data(data)
