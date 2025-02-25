import random, xxhash, statistics, time

def generate_data(data_size):
    data = {}
    for _ in range(data_size):
        value = random.random()
        key = xxhash.xxh128_hexdigest(str(value).encode('utf'))
        data[key] = value    
    return data

def append_to_log_file(file_path, storage_type, data_size, exec_time):
    with open(file_path, 'a') as file:
        log_message = ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n"
        log_message += f"Storage: {storage_type}\nData Size: {data_size}\nExecution time: {exec_time:.6f} seconds\n\n"
        file.write(log_message)

#The decorated function must return the execution time it wants to measure and its first argument ('data') must be the size of the input, so we have both variables we want to put on a chart. 
def measure_performance(num_repetitions, log_file):
    def decorator(func):
        def wrapper(data, *args):
            times = []
            for _ in range(num_repetitions):
                time.sleep(random.randint(2, 5))
                exec_time = func(data, *args)
                times.append(exec_time)
            median_time = statistics.median(times)
            append_to_log_file(log_file, func.__qualname__, len(data), median_time)
        return wrapper
    return decorator