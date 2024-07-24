import sys
sys.path.append('..')

import time
from speedupy.speedupy import initialize_speedupy, deterministic

@deterministic
def pure_function(input, output):
    if sys.argv[1] == 'slow':
        time.sleep(1)
    return output

@initialize_speedupy
def main():
    input = sys.argv[2:sys.argv.index('--exec-mode')]
    
    i = 0
    data = []
    while i < len(input):
        data.append((input[i], float(input[i+1])))
        i += 2
        
    for elem in data:
        print(elem)
        pure_function(elem[0], elem[1])

main()