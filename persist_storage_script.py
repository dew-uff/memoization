import time, statistics, os
from util import generate_data, append_to_log_file
from DBStorage import DBStorage
from FileSystemStorage import FileSystemStorage

MAX_DATA_SIZE = 1000
NUM_REPETITIONS = 10
LOG_FILE = 'storage_log.txt'
STORAGE_LOCATION = 'my_storage'

def main():
    sizes = [1] + [x for x in range(10, MAX_DATA_SIZE+1, 10)]
    for s in sizes:
        print(f">>>>>> Size {s}\n")
        data = generate_data(s)
        persist_data(data)
        print('\n\n\n')

def persist_data(data):
    persist_data_db(data)
    persist_data_filesystem(data)

def measure_performance(func):
    def wrapper(data):
        times = []
        for _ in range(NUM_REPETITIONS):
            exec_time = func(data)
            times.append(exec_time)
        median_time = statistics.median(times)
        append_to_log_file(LOG_FILE, func.__qualname__, len(data), median_time)
    return wrapper

@measure_performance
def persist_data_db(data):
    db = DBStorage(STORAGE_LOCATION)

    start_time = time.perf_counter()
    db.persist_data(data)
    end_time = time.perf_counter()
    
    db.close_connection()
    os.system(f"rm -rf {STORAGE_LOCATION}")
    
    return end_time - start_time

@measure_performance
def persist_data_filesystem(data):
    times = []
    for _ in range(NUM_REPETITIONS):
        fs = FileSystemStorage(STORAGE_LOCATION)

        start_time = time.perf_counter()
        fs.persist_data(data)
        end_time = time.perf_counter()

        os.system(f"rm -rf {STORAGE_LOCATION}")
        
        return end_time - start_time

main()
