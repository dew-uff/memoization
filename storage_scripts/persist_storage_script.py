import time, os
from util import generate_data, measure_performance
from DBStorage import DBStorage
from FileSystemStorage import FileSystemStorage

MAX_DATA_SIZE = 10000
NUM_REPETITIONS = 10
LOG_FILE = 'persist_storage_script_log.txt'
DB_STORAGE_LOCATION = 'db_persist_storage_script'
FILESYSTEM_STORAGE_LOCATION = 'fs_persist_storage_script'

def main():
    sizes = [1] + [x for x in range(10, MAX_DATA_SIZE+1, 10)]
    for s in sizes:
        print(f">>>>>> Size {s}\n")
        data = generate_data(s)
        persist_data(data)

def persist_data(data):
    persist_data_db(data)
    persist_data_filesystem(data)

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def persist_data_db(data):
    db = DBStorage(DB_STORAGE_LOCATION)

    start_time = time.perf_counter()
    db.persist_data(data)
    end_time = time.perf_counter()
    
    db.close_connection()
    os.system(f"rm -rf {DB_STORAGE_LOCATION}")
    
    return end_time - start_time

@measure_performance(NUM_REPETITIONS, LOG_FILE)
def persist_data_filesystem(data):
    fs = FileSystemStorage(FILESYSTEM_STORAGE_LOCATION)

    start_time = time.perf_counter()
    fs.persist_data(data)
    end_time = time.perf_counter()

    os.system(f"rm -rf {FILESYSTEM_STORAGE_LOCATION}")
    
    return end_time - start_time

main()
