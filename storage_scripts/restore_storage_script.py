import time, os
from util import generate_data, measure_performance
from DBStorage import DBStorage
from FileSystemStorage import FileSystemStorage

MAX_DATA_SIZE = 5000
NUM_REPETITIONS = 10
LOG_FILE = 'restore_storage_script_log.txt'
DB_STORAGE_LOCATION = 'db_restore_storage_script'
FILESYSTEM_STORAGE_LOCATION = 'fs_restore_storage_script'

def main():
    db = DBStorage(DB_STORAGE_LOCATION)
    fs = FileSystemStorage(FILESYSTEM_STORAGE_LOCATION)
    
    data = generate_data(MAX_DATA_SIZE)
    db.persist_data(data)
    fs.persist_data(data)

    sizes = [1] + [x for x in range(10, MAX_DATA_SIZE+1, 10)]
    for s in sizes:
        print(f">>>>>> Size {s}\n")
        restore_data(list(data.keys())[:s], db, fs)
    db.close_connection()
    os.system(f"rm -rf {DB_STORAGE_LOCATION} {FILESYSTEM_STORAGE_LOCATION}")

def restore_data(keys, db, fs):
    restore_data_db(keys, db)
    restore_data_filesystem(keys, fs)

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def restore_data_db(keys, db):
    start_time, end_time = 0, 0
    if len(keys) == MAX_DATA_SIZE:
        start_time = time.perf_counter()
        db.restore_all_data()
        end_time = time.perf_counter()
    else:
        start_time = time.perf_counter()
        db.restore_part_of_data(keys)
        end_time = time.perf_counter()
    return end_time - start_time

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def restore_data_filesystem(keys, fs):
    start_time, end_time = 0, 0
    if len(keys) == MAX_DATA_SIZE:
        start_time = time.perf_counter()
        fs.restore_all_data()
        end_time = time.perf_counter()
    else:
        start_time = time.perf_counter()
        fs.restore_part_of_data(keys)
        end_time = time.perf_counter()
    return end_time - start_time

main()
