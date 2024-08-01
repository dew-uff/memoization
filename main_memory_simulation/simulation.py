import sys, os, copy
sys.path.append('..')

from random import randint, shuffle
from storage_scripts.util import generate_data

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

def generate_simulation_data(num_new_data, num_cached_data):
    new_data = generate_data(num_new_data)
    cached_data = generate_data(num_cached_data)
    
    all_data = copy.deepcopy(cached_data)
    all_data.update(new_data)
    
    all_keys = list(all_data.keys())
    shuffle(all_keys)

    ad = []
    cd = []
    for k in all_keys:
        ad.append(k)
        ad.append(all_data[k])
        if k in cached_data:
            cd.append(k)
            cd.append(cached_data[k])
    all_data = [str(e) for e in ad]
    cached_data = [str(e) for e in cd]
    return cached_data, all_data

def execute_simulation(cached_data, all_data, num_dict):
    print(f'\n\n>>>> Running for {num_dict} dictionaries!')

    cached_data = ' '.join(cached_data)
    all_data = ' '.join(all_data)
    
    #Preparing experiment
    os.system('python speedupy/setup_exp/setup.py script.py')
    
    #Executing the first time to add cached_data to the storage
    print('\nSaving cached values...')
    os.system(f'python script.py fast {cached_data} --exec-mode manual --num-dict {num_dict} -s db')

    #Executing measuring time
    print('\nMeasuring time...')
    os.system(f'python script.py slow {all_data} --exec-mode manual --num-dict {num_dict} -s db')

    #Erasing the cache
    os.system(f'rm -rf .speedupy/')

    print(f'---------------------------------------------------')
    
def main():
    drawn_config = draw_config()
    for set, set_config in drawn_config.items():
        print('\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>')
        print(f'Running for {set}!')
        print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>')

        cached_data, all_data = generate_simulation_data(int(set_config['cache_miss_rate'] * set_config['deterministic_calls']),
                                                         set_config['cache_size'])
        for i in range(10):
            print(f'\n>>>>>>>>>>> Trial {i+1}')
            execute_simulation(cached_data, all_data, '0')
            execute_simulation(cached_data, all_data, '1')
            execute_simulation(cached_data, all_data, '2')
            execute_simulation(cached_data, all_data, '2-fast')

if __name__ == '__main__':
    main()

# Simulação escolhe valores aleatórios para as 3 variáveis.
# Executamos a simulação um determinado número de vezes (ex.: 100) para cada grupo
# Executamos variando as opções de dicionário (0-dict, 1-dict, 2-dict e 2-dict*)
