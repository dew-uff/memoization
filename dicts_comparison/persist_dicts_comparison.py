import sys
sys.path.append('..')

import time, os
from storage_scripts.util import generate_data, measure_performance

MAX_DATA_SIZE = 5000
NUM_REPETITIONS = 10
LOG_FILE = 'persist_with_or_without_dict_script_log.txt'
DB_STORAGE_LOCATION_WITH_DICT = 'db_storage_with_dict_persist_with_or_without_dict_script'
DB_STORAGE_LOCATION_WITHOUT_DICT = 'db_storage_without_dict_persist_with_or_without_dict_script'

def main():
    sizes = [1] + [x for x in range(10, MAX_DATA_SIZE+1, 10)]
    for s in sizes:
        print(f">>>>>> Size {s}\n")
        data = generate_data(s)
        keys = list(data.keys())
        values = list(data.values())
        insert_in_one_dict(keys, values)
        insert_in_two_dicts(keys, values)

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def insert_in_one_dict(keys, values):
    start_time = time.perf_counter()
    a_dict = {keys[i] : values[i] for i in range(len(keys))}
    end_time = time.perf_counter()
    return end_time - start_time

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def insert_in_two_dicts(keys, values):
    start_time = time.perf_counter()
    first_dict = {keys[i] : values[i] for i in range(len(keys))}
    second_dict = {keys[i] : values[i] for i in range(len(keys))}
    end_time = time.perf_counter()
    return end_time - start_time

main()
