import sys
sys.path.append('..')

import time, os, random
from storage_scripts.util import generate_data, measure_performance
from DBStorageWithADictionary import DBStorageWithADictionary
from DBStorageWithoutDictionary import DBStorageWithoutDictionary

MAX_DATA_SIZE = 5000
NUM_REPETITIONS = 10
LOG_FILE = 'restore_with_or_without_dict_script_log.txt'
DB_STORAGE_LOCATION_WITH_DICT = 'db_storage_with_dict_restore_with_or_without_dict_script'
DB_STORAGE_LOCATION_WITHOUT_DICT = 'db_storage_without_dict_restore_with_or_without_dict_script'

def main():
    diff_or_same = sys.argv[1]

    db_with_dict = DBStorageWithADictionary(DB_STORAGE_LOCATION_WITH_DICT)
    db_without_dict = DBStorageWithoutDictionary(DB_STORAGE_LOCATION_WITHOUT_DICT)
    
    data = generate_data(MAX_DATA_SIZE)
    db_with_dict.persist_data(data)
    db_with_dict.commit()
    db_without_dict.persist_data(data)
    db_without_dict.commit()

    sizes = [1] + [x for x in range(10, MAX_DATA_SIZE+1, 10)]
    for s in sizes:
        print(f">>>>>> Size {s}\n")
        keys = list(data.keys())
        keys_2_use = get_list_of_keys(keys, s, diff_or_same)
        restore_data(keys_2_use, db_with_dict, db_without_dict)
    
    db_with_dict.close_connection()
    db_without_dict.close_connection()
    
    os.system(f"rm -rf {DB_STORAGE_LOCATION_WITH_DICT} {DB_STORAGE_LOCATION_WITHOUT_DICT}")

def get_list_of_keys(keys, list_size, diff_or_same):
    if diff_or_same == 'diff':
        print('Different')
        return keys[:list_size]
    elif diff_or_same == 'same':
        print('Same')
        i = random.randint(0, MAX_DATA_SIZE-1)
        return list_size*[keys[i]]

def restore_data(keys, db_with_dict, db_without_dict):
    restore_data_db_with_dict(keys, db_with_dict)
    restore_data_db_without_dict(keys, db_without_dict)

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def restore_data_db_with_dict(keys, db):
    db.dictionary = {}
    start_time = time.perf_counter()
    for k in keys:
        db.restore_part_of_data([k])
    end_time = time.perf_counter()
    return end_time - start_time

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def restore_data_db_without_dict(keys, db):
    start_time = time.perf_counter()
    for k in keys:
        db.restore_part_of_data(k)
    end_time = time.perf_counter()
    return end_time - start_time


if len(sys.argv) != 2:
    print("Usage: python script.py [diff/same]")
    sys.exit(1)

main()
