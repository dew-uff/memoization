import sys
sys.path.append('..')

import time, statistics, os
from storage_scripts.util import generate_data, append_to_log_file
from storage_scripts.DBStorage import DBStorage

MAX_DATA_SIZE = 500
NUM_REPETITIONS = 10
LOG_FILE = 'persist_with_or_without_dict_script_log.txt'
DB_STORAGE_LOCATION_WITH_DICT = 'db_storage_with_dict'
DB_STORAGE_LOCATION_WITHOUT_DICT = 'db_storage_without_dict'

def measure_performance(func):
    def wrapper(data):
        times = []
        for _ in range(NUM_REPETITIONS):
            exec_time = func(data)
            times.append(exec_time)
        median_time = statistics.median(times)
        append_to_log_file(LOG_FILE, func.__qualname__, len(data), median_time)
    return wrapper

def main():
    sizes = [1] + [x for x in range(10, MAX_DATA_SIZE+1, 10)]
    for s in sizes:
        print(f">>>>>> Size {s}\n")
        data = generate_data(s)
        persist_data(data)

def persist_data(data):
    persist_data_with_dict(data)
    persist_data_without_dict(data)

@measure_performance
def persist_data_with_dict(data):
    db = DBStorage(DB_STORAGE_LOCATION_WITH_DICT)

    start_time = time.perf_counter()
    db.persist_data(data)
    end_time = time.perf_counter()
    
    db.close_connection()
    os.system(f"rm -rf {DB_STORAGE_LOCATION_WITH_DICT}")
    
    return end_time - start_time

@measure_performance
def persist_data_without_dict(data):
    db = DBStorage(DB_STORAGE_LOCATION_WITHOUT_DICT)

    start_time = time.perf_counter()
    for key, value in data.items(): db.persist_data({key: value})
    end_time = time.perf_counter()
    
    db.close_connection()
    os.system(f"rm -rf {DB_STORAGE_LOCATION_WITHOUT_DICT}")
    
    return end_time - start_time

main()
