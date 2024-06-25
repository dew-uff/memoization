import sys
sys.path.append('..')

import time, statistics, os, copy
from storage_scripts.util import generate_data, append_to_log_file
from storage_scripts.DBStorage import DBStorage
from DBStorageWithADictionary import DBStorageWithADictionary

MAX_DATA_SIZE = 10000
NUM_REPETITIONS = 10
LOG_FILE = 'restore_different_values_with_or_without_dict_script_log.txt'
DB_STORAGE_LOCATION_WITH_DICT = 'db_storage_with_dict_restore_different_values_with_or_without_dict_script'
DB_STORAGE_LOCATION_WITHOUT_DICT = 'db_storage_without_dict_restore_different_values_with_or_without_dict_script'

def measure_performance(func):
    def wrapper(data, *args):
        times = []
        for _ in range(NUM_REPETITIONS):
            exec_time = func(data, *args)
            times.append(exec_time)
        median_time = statistics.median(times)
        append_to_log_file(LOG_FILE, func.__qualname__, len(data), median_time)
    return wrapper

def main():
    db_with_dict = DBStorageWithADictionary(DB_STORAGE_LOCATION_WITH_DICT)
    db_without_dict = DBStorage(DB_STORAGE_LOCATION_WITHOUT_DICT)
    
    data = generate_data(MAX_DATA_SIZE)
    db_with_dict.persist_data(data)
    db_without_dict.persist_data(data)

    sizes = [1] + [x for x in range(10, MAX_DATA_SIZE+1, 10)]
    for s in sizes:
        print(f">>>>>> Size {s}\n")
        restore_data(list(data.keys())[:s], db_with_dict, db_without_dict)
    
    db_with_dict.close_connection()
    db_without_dict.close_connection()
    
    os.system(f"rm -rf {DB_STORAGE_LOCATION_WITH_DICT} {DB_STORAGE_LOCATION_WITHOUT_DICT}")

def restore_data(keys, db_with_dict, db_without_dict):
    restore_data_db_with_dict(keys, db_with_dict)
    restore_data_db_without_dict(keys, db_without_dict)

@measure_performance
def restore_data_db_with_dict(keys, db):
    db.dictionary = {}
    start_time = time.perf_counter()
    for k in keys:
        db.restore_part_of_data([k])
    end_time = time.perf_counter()
    return end_time - start_time

@measure_performance
def restore_data_db_without_dict(keys, db):
    start_time = time.perf_counter()
    for k in keys:
        db.restore_part_of_data([k])
    end_time = time.perf_counter()
    return end_time - start_time

main()
