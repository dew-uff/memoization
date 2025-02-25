import sys
sys.path.append('..')

import time
from storage_scripts.util import generate_data, measure_performance

MAX_DATA_SIZE = 5000
NUM_REPETITIONS = 10
LOG_FILE = 'find_values_to_store_dicts_comparison_script_log.txt'

def main():
    sizes = [1] + [x for x in range(10, MAX_DATA_SIZE+1, 10)]
    for s in sizes:
        print(f">>>>>> Size {s}\n")
        old_data = generate_data(s)
        new_data = generate_data(MAX_DATA_SIZE-s)
        data = {k:{'new':False, 'value':v} for k, v in old_data.items()}
        data.update({k:{'new':True, 'value':v} for k, v in new_data.items()})
        find_old_values_to_store(old_data, data)

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def find_old_values_to_store(old_data, data):
    data_2_store = {}
    start_time = time.perf_counter()
    for k in data:
        if data[k]['new']:
            data_2_store[k] = data[k]['value']
    end_time = time.perf_counter()
    return end_time - start_time

main()
