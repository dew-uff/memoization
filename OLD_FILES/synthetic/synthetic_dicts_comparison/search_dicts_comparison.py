import sys
sys.path.append('..')

import time, random
from storage_scripts.util import generate_data, measure_performance

MAX_DATA_SIZE = 5000
NUM_REPETITIONS = 10
LOG_FILE = 'search_dicts_comparison_script_log.txt'

def main():
    sizes = [1] + [x for x in range(10, MAX_DATA_SIZE+1, 10)]
    for s in sizes:
        print(f">>>>>> Size {s}\n")
        data = generate_data(s)
        keys = []
        for k in data.keys():
            keys.append(k) if random.random() >= 0.5 else keys.append(str(random.random()))
        search_in_one_dict(keys, data)
        search_in_two_dicts_0_100(keys, data)
        search_in_two_dicts_25_75(keys, data)
        search_in_two_dicts_50_50(keys, data)

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def search_in_one_dict(keys, a_dict):
    data = {}
    start_time = time.perf_counter()
    for k in keys:
        if k in a_dict:
            data[k] = a_dict[k]
    end_time = time.perf_counter()
    return end_time - start_time

def search_in_two_dicts(keys, first_dict, second_dict):
    data = {}
    start_time = time.perf_counter()
    for k in keys:
        if k in first_dict:
            data[k] = first_dict[k]
        elif k in second_dict:
            data[k] = second_dict[k]
    end_time = time.perf_counter()
    return end_time - start_time

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def search_in_two_dicts_0_100(search_keys, data):
    return search_in_two_dicts(search_keys, data, {})

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def search_in_two_dicts_25_75(search_keys, data):
    keys = list(data.keys())
    split_point = int(len(keys) * 0.25)
    
    keys_1 = keys[:split_point]
    keys_2 = keys[split_point:]
    
    first_dict = {k: data[k] for k in keys_1}
    second_dict = {k: data[k] for k in keys_2}

    return search_in_two_dicts(search_keys, first_dict, second_dict)

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def search_in_two_dicts_50_50(search_keys, data):
    keys = list(data.keys())
    split_point = int(len(keys) * 0.5)
    
    keys_1 = keys[:split_point]
    keys_2 = keys[split_point:]
    
    first_dict = {k: data[k] for k in keys_1}
    second_dict = {k: data[k] for k in keys_2}

    return search_in_two_dicts(search_keys, first_dict, second_dict)

main()
