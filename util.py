import random, xxhash

def generate_data(data_size):
    data = {}
    for _ in range(data_size):
        value = random.random()
        key = xxhash.xxh128_hexdigest(str(value).encode('utf'))
        data[key] = value    
    return data