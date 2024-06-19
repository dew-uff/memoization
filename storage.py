# Storages {db, file}
# Análises de desempenho + experimentos sintéticos!
# Metodologia:
# Dados utilizados:
# Gerar 1.000 dados (float) usando  random.random()
# Para cada dado gerado, obter seu hash usando um xxhash (escolha aleatória sem importância, pois o tempo de geração do hash não será considerado na avaliação. Só contabilizamos o tempo para de fato persistir/recuperar o dado do banco/disco)
# Operações do storage:
# Busca:
# Um dado (Lazy): Buscamos 1 dado do storage
# Grupo de dados (Function/Eager): Buscamos 10, 20, 30, 40, …, 1.000 dados do storage
# Inserção de novos dados:
# Um dado: Inserimos 1 dado do storage
# Grupo de dados: Inserimos 10, 20, 30, 40, …, 1.000 dados do storage
# Argumentação: testaremos um dado e um grupo de dados porque às vezes há benefícios em salvar/recuperar dados conforme a necessidade da aplicação principal surge (operações sobre 1 dado por vez)  ou em grupos de dados (pode haver economia de disco, CPU, etc.)
# Medimos o tempo gasto para cada operação!
# Resultados:
# Mostramos dois gráficos de quantidade de dados buscados/inseridos X tempo total gasto
# Cada gráfico possui 2 retas (1 para cada storage)

import time, random, xxhash, statistics
from DBStorage import DBStorage

MAX_DATA_SIZE = 1000
NUM_REPETITIONS = 10
LOG_FILE = 'storage_log.txt'
STORAGE_LOCATION = 'my_storage'

def measure_time(func):
    def wrapper(data):
        times = []
        for _ in range(NUM_REPETITIONS):
            start_time = time.perf_counter()
            result = func(data)
            end_time = time.perf_counter()
            times.append(end_time - start_time)

        with open(LOG_FILE, 'a') as file:
            median_time = statistics.median(times)
            log_message = ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n"
            log_message += f"Function {func.__name__}\nData Size: {len(data)}\nExecution time: {median_time:.6f} seconds\n\n"
            file.write(log_message)
        
        return result
    return wrapper

def main():
    sizes = [1] + [x for x in range(10, MAX_DATA_SIZE+1, 10)]
    for s in sizes:
        data = generate_data(s)
        persist_data(data)
        restore_data(data)

def generate_data(data_size):
    data = {}
    for _ in range(data_size):
        value = random.random()
        key = xxhash.xxh128_hexdigest(str(value).encode('utf'))
        data[key] = value
    return data

def persist_data(data):
    persist_data_db(data)
    persist_data_filesystem(data)
    
@measure_time
def persist_data_db(data):
    pass

@measure_time
def persist_data_filesystem(data):
    pass

def restore_data(data):
    restore_data_db(data)
    restore_data_filesystem(data)

@measure_time
def restore_data_db(data):
    pass

@measure_time
def restore_data_filesystem(data):
    pass

main()
