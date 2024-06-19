import time, statistics, os
from util import generate_data
from DBStorage import DBStorage

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
    
def persist_data_db(data):
    times = []
    for _ in range(NUM_REPETITIONS):
        db = DBStorage(STORAGE_LOCATION)

        start_time = time.perf_counter()
        db.persist_data(data)
        end_time = time.perf_counter()
        times.append(end_time - start_time)

        db.close_connection()
        os.system(f"rm {STORAGE_LOCATION}")

    with open(LOG_FILE, 'a') as file:
        median_time = statistics.median(times)
        log_message = ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n"
        log_message += f"Storage: Database\nData Size: {len(data)}\nExecution time: {median_time:.6f} seconds\n\n"
        file.write(log_message)

def persist_data_filesystem(data):
    pass

main()
