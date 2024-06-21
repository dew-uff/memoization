import random, xxhash

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