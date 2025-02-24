import sys
sys.path.append('/home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/memoization/main_memory_simulation')
from speedupy.speedupy import maybe_deterministic
import sys
sys.path.append('..')
import time
from speedupy.speedupy import initialize_speedupy, deterministic

@deterministic
def pure_function(input, output):
    if sys.argv[1] == 'slow':
        time.sleep(0.001)
    return output

@maybe_deterministic
def get_input():
    with open('input.txt', 'rt') as f:
        input = [l.strip() for l in f]
    return input

@maybe_deterministic
def structure_data(input):
    i = 0
    data = []
    while i < len(input):
        data.append((input[i], float(input[i + 1])))
        i += 2
    return data

@initialize_speedupy
def main():
    input = get_input()
    data = structure_data(input)
    for elem in data:
        pure_function(elem[0], elem[1])
main()