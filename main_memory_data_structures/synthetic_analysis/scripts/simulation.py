import sys, os, copy, random, hashlib
sys.path.append('..')

from random import randint, shuffle, choice

def little_cache_miss_rate():
    return {'min': 0, 'max': 20}

# def great_cache_miss_rate():
#     return {'min': 50, 'max': 100}

def get_config_boundaries():
    configs = {}
    # configs = {
    #     f'SET_{i+1}': {
    #         'deterministic_calls': {'min': i*1000, 'max': (i+1)*1000},
    #         'cache_miss_rate': little_cache_miss_rate()
    #     } for i in range(1, 20, 1)
    # }
    configs['SET_1'] = {
        'deterministic_calls': {'min': 500, 'max': 1000},
        'cache_miss_rate': little_cache_miss_rate()
    }
    return configs

def draw_config():
    boundaries = get_config_boundaries()
    drawn_config = {}
    for set in boundaries.keys():
        set_config = boundaries[set]
        drawn_config[set] = {
            'deterministic_calls': randint(set_config['deterministic_calls']['min'],
                                           set_config['deterministic_calls']['max']),

            'cache_miss_rate': randint(set_config['cache_miss_rate']['min'],
                                       set_config['cache_miss_rate']['max'])/100
        }
    return drawn_config

##TODO:TEST
def generate_simulation_data(data_size, num_calls):
    new_data = generate_data(data_size)

    all_data = [(k, v) for k, v in new_data.items()]

    aux = num_calls - len(new_data)

    keys = list(new_data.keys())
    for i in range(aux):
        k = choice(keys)
        all_data.append((k, new_data[k]))
    shuffle(all_data)


    ad = []
    for (k, v) in all_data:
        ad.append(str(k))
        ad.append(str(v))
    return ad

def generate_data(data_size):
    data = {}
    for _ in range(data_size):
        value = random.random()
        key = hashlib.md5(str(value).encode('utf')).hexdigest()
        data[key] = value    
    return data

def execute_simulation(all_data, num_dict):
    print(f'\n\n>>>> Running for {num_dict} dictionaries!')

    #Preparing experiment
    os.system('python speedupy/setup_exp/setup.py script.py')
    
    #Executing the first time to add cached_data to the storage
    # print('\nSaving cached values...')
    # generate_script_input_file(cached_data)
    # os.system(f'python script.py fast --exec-mode manual --num-dict {num_dict} -s db')

    #Executing measuring time
    print('\nMeasuring time...')
    sys.stdout.flush()
    generate_script_input_file(all_data)
    os.system(f'python script.py slow --exec-mode manual --num-dict {num_dict} -s db')
    sys.stdout.flush()

    #Erasing the cache
    os.system(f'rm -rf .speedupy/')

    print(f'---------------------------------------------------')

def generate_script_input_file(data):
    with open('input.txt', 'wt') as f:
        for elem in data:
            f.write(f'{elem}\n')

##TODO:TEST
def main():
    drawn_config = draw_config()
    for set, set_config in drawn_config.items():
        print('\n\n>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>')
        print(f'Running for {set}!')
        for k, v in set_config.items(): print(f'{k}: {v}')
        print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>')

        data_size = int(set_config['cache_miss_rate'] * set_config['deterministic_calls'])
        if data_size == 0:
            data_size += 1
            set_config['cache_miss_rate'] = data_size/set_config['deterministic_calls']
            print(f"Ajustando cache_miss_rate: {set_config['cache_miss_rate']}")
        all_data = generate_simulation_data(data_size, set_config['deterministic_calls'])

        for j in range(NUM_EXECUTION_OF_A_DRAW):
            print(f'\n>>>>>>>>>>> Trial {j+1}')
            execute_simulation(all_data, '0')
            execute_simulation(all_data, '1')
            execute_simulation(all_data, '2')
            execute_simulation(all_data, '2-fast')

        os.system('rm input.txt')

if __name__ == '__main__':
    NUM_EXECUTION_OF_A_DRAW = 10
    main()

# Simulação escolhe valores aleatórios para as 2 variáveis.
# Executamos a simulação um determinado número de vezes (ex.: 100) para cada grupo
# Executamos variando as opções de dicionário (0-dict, 1-dict, 2-dict e 2-dict*)
