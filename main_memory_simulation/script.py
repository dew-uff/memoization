import sys
sys.path.append('..')

import time
from speedupy.speedupy import initialize_speedupy, deterministic

@deterministic
def pure_function(input, output):
    if sys.argv[1] == 'slow':
        time.sleep(1)
    return output

def get_input():
    with open('input.txt', 'rt') as f:
        input = [l.strip() for l in f]
    return input

@initialize_speedupy
def main():
    input = get_input()
    
    i = 0
    data = []
    while i < len(input):
        data.append((input[i], float(input[i+1])))
        i += 2
    
    for elem in data:
        pure_function(elem[0], elem[1])

main()