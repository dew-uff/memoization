import sys, os
sys.path.append('..')

from random import randint, shuffle
from storage_scripts.util import generate_data, measure_performance

def little_cache_size():
    return {'min': 1, 'max': 3}

def great_cache_size():
    return {'min': 60e3, 'max': 120e3}

def little_deterministic_calls():
    return {'min': 10, 'max': 20}

def great_deterministic_calls():
    return {'min': 660e3, 'max': 1300e3}

def little_cache_miss_rate():
    return {'min': 0, 'max': 5}

def great_cache_miss_rate():
    return {'min': 50, 'max': 100}

def get_config_boundaries():
    return {
        'SET_1': {
            'cache_size': great_cache_size(),
            'deterministic_calls': great_deterministic_calls(),
            'cache_miss_rate': little_cache_miss_rate()
        },
        'SET_2': {
            'cache_size': little_cache_size(),
            'deterministic_calls': little_deterministic_calls(),
            'cache_miss_rate': little_cache_miss_rate()
        },
        'SET_3': {
            'cache_size': great_cache_size(),
            'deterministic_calls': great_deterministic_calls(),
            'cache_miss_rate': great_cache_miss_rate()
        }
    }

def draw_config():
    boundaries = get_config_boundaries()
    drawn_config = {}
    for set in boundaries.keys():
        set_config = boundaries[set]
        drawn_config[set] = {
            'cache_size': randint(set_config['cache_size']['min'],
                                  set_config['cache_size']['max']),

            'deterministic_calls': randint(set_config['deterministic_calls']['min'],
                                           set_config['deterministic_calls']['max']),

            'cache_miss_rate': randint(set_config['cache_miss_rate']['min'],
                                       set_config['cache_miss_rate']['max'])/100
        }
    return drawn_config

def execute_simulation(cached_data, all_data, num_dict):
    print(f'num_dict: {num_dict}')


    cached_data = ' '.join(cached_data)
    all_data = ' '.join(all_data)
    
    #Preparing experiment
    os.system('python speedupy/setup_exp/setup.py script.py')
    
    #Executing the first time to add cached_data to the storage
    os.system(f'python script.py fast {cached_data} --exec-mode manual --num-dict {num_dict} -s db')

    #Executing measuring time
    os.system(f'python script.py slow {all_data} --exec-mode manual --num-dict {num_dict} -s db')

    #Erasing the cache
    os.system(f'rm -rf .speedupy/')
    
def main():
    drawn_config = draw_config()
    for set_config in drawn_config.values():
        print(f'set_config: {set_config}')


        cached_data = generate_data(2)#(set_config['cache_size'])
        new_data = generate_data(3)#(int(set_config['cache_miss_rate'] * set_config['deterministic_calls']))
        
        cached_data = [(k, v) for k, v in cached_data.items()]
        new_data = [(k, v) for k, v in new_data.items()]
        all_data = cached_data + new_data
        shuffle(all_data)

        aux = []
        for (k, v) in cached_data:
            aux.append(str(k))
            aux.append(str(v))
        cached_data = aux

        aux = []
        for (k, v) in all_data:
            aux.append(str(k))
            aux.append(str(v))
        all_data = aux

        execute_simulation(cached_data, all_data, '0')
        execute_simulation(cached_data, all_data, '1')
        execute_simulation(cached_data, all_data, '2')
        execute_simulation(cached_data, all_data, '2-fast')

if __name__ == '__main__':
    main()


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
