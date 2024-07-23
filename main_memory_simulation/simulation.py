import sys
sys.path.append('..')

import time
from random import randint
from storage_scripts.util import generate_data, measure_performance
from speedupy.speedupy import initialize_speedupy, deterministic

CONFIG = {
    'SET_1': {
        'cache_size': {
            'min': 60e3,
            'max': 120e3
        },
        'deterministic_calls': {
            'min': 660e3,
            'max': 1300e3
        },
        'cache_miss_rate': {
            'min': 0,
            'max': 5
        }
    },
    'SET_2': {
        'cache_size': {
            'min': 1,
            'max': 3
        },
        'deterministic_calls': {
            'min': 10,
            'max': 20
        },
        'cache_miss_rate': {
            'min': 0,
            'max': 5
        }
    },
    'SET_3': {
        'cache_size':{
            'min': 60e3,
            'max': 120e3
        },
        'deterministic_calls':{
            'min': 660e3,
            'max': 1300e3
        },
        'cache_miss_rate':{
            'min': 50,
            'max': 100
        }
    }
}

def draw_config():
    drawn_config = {}
    for set in CONFIG.keys():
        set_config = CONFIG[set]
        drawn_config[set] = {
            'cache_size': randint(set_config['cache_size']['min'],
                                  set_config['cache_size']['max']),

            'deterministic_calls': randint(set_config['deterministic_calls']['min'],
                                           set_config['deterministic_calls']['max']),

            'cache_miss_rate': randint(set_config['cache_miss_rate']['min'],
                                       set_config['cache_miss_rate']['max'])/100
        }
    return drawn_config

@deterministic
def pure_function(input, output):
    time.sleep(1)
    return output
    
def main():
    drawn_config = draw_config()
    set_config = draw_config['SET_1']

    cached_data = generate_data(set_config['cache_size'])
    new_data = generate_data(set_config['cache_miss_rate'] * set_config['cache_size'])
    
    add_cached_values_to_storage(cached_data)
    


    # sizes = [1] + [x for x in range(10, MAX_DATA_SIZE+1, 10)]
    # for s in sizes:
    #     print(f">>>>>> Size {s}\n")
    #     data = generate_data(s)
    #     keys = list(data.keys())
    #     values = list(data.values())
    #     insert_in_one_dict(keys, values)
    #     insert_in_two_dicts(keys, values)




# Simulação escolhe valores aleatórios para as 3 variáveis.
# Executamos a simulação um determinado número de vezes (ex.: 100) para cada grupo
# Executamos variando as opções de dicionário (0-dict, 1-dict, 2-dict e 2-dict*)


# MAX_DATA_SIZE = 5000
# NUM_REPETITIONS = 10
# LOG_FILE = 'persist_dicts_comparison_script_log.txt'



# @measure_performance(NUM_REPETITIONS, LOG_FILE)
# def insert_in_one_dict(keys, values):
#     start_time = time.perf_counter()
#     a_dict = {keys[i] : values[i] for i in range(len(keys))}
#     end_time = time.perf_counter()
#     return end_time - start_time

# @measure_performance(NUM_REPETITIONS, LOG_FILE)
# def insert_in_two_dicts(keys, values):
#     start_time = time.perf_counter()
#     first_dict = {keys[i] : values[i] for i in range(len(keys))}
#     second_dict = {keys[i] : values[i] for i in range(len(keys))}
#     end_time = time.perf_counter()
#     return end_time - start_time

# main()
