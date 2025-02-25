import sys
sys.path.append('..')

import time, os
from storage_scripts.util import generate_data, measure_performance
from DBStorageWithADictionary import DBStorageWithADictionary
from DBStorageWithoutDictionary import DBStorageWithoutDictionary

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
        persist_data(data)

def persist_data(data):
    persist_data_with_dict(data)
    persist_data_without_dict(data)

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def persist_data_with_dict(data):
    db = DBStorageWithADictionary(DB_STORAGE_LOCATION_WITH_DICT)

    start_time = time.perf_counter()
    db.persist_data(data)
    db.commit()
    end_time = time.perf_counter()
    
    db.close_connection()
    os.system(f"rm -rf {DB_STORAGE_LOCATION_WITH_DICT}")
    
    return end_time - start_time

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def persist_data_without_dict(data):
    db = DBStorageWithoutDictionary(DB_STORAGE_LOCATION_WITHOUT_DICT)

    start_time = time.perf_counter()
    db.persist_data(data)
    db.commit()
    end_time = time.perf_counter()
    
    db.close_connection()
    os.system(f"rm -rf {DB_STORAGE_LOCATION_WITHOUT_DICT}")
    
    return end_time - start_time

main()
