import numpy as np

def cliff_delta(x, y):
    """
    Calculate Cliff's Delta for two arrays x and y.
    
    Parameters:
    x (array-like): Array of values for group X.
    y (array-like): Array of values for group Y.
    
    Returns:
    float: Cliff's Delta value.
    """
    x = np.asarray(x)
    y = np.asarray(y)
    
    # Calculate number of pairs where x > y and x < y
    n_x = len(x)
    n_y = len(y)
    
    C = 0
    D = 0
    
    for xi in x:
        for yi in y:
            if xi > yi:
                C += 1
            elif xi < yi:
                D += 1
    
    N = C + D
    if N == 0:
        return 0  # No pairs to compare
    
    delta = (C - D) / N
    return delta

def calculate_cliffs_delta_for_all_pairs(data_dict):
    """
    Calculate Cliff's Delta for all pairs of groups in the data dictionary.
    
    Parameters:
    data_dict (dict): A dictionary where keys are group names and values are lists/arrays of values.
    
    Returns:
    dict: A dictionary with pairs of group names as keys and Cliff's Delta as values.
    """
    groups = list(data_dict.keys())
    num_groups = len(groups)
    
    delta_results = {}
    
    for i in range(num_groups):
        for j in range(i + 1, num_groups):
            group1 = groups[i]
            group2 = groups[j]
            values1 = data_dict[group1]
            values2 = data_dict[group2]
            
            delta = cliff_delta(values1, values2)
            delta_results[(group1, group2)] = delta
            
    return delta_results

# Example usage
if __name__ == "__main__":
    # Example data: Replace with your actual data
    data = {
        'Architecture_A': [1.2, 2.3, 3.1, 2.9],
        'Architecture_B': [2.1, 2.5, 3.0, 3.2],
        'Architecture_C': [1.8, 2.4, 2.7, 3.1],
        'Architecture_D': [1.5, 2.0, 2.9, 3.3]
    }
    
    results = calculate_cliffs_delta_for_all_pairs(data)
    
    for pair, delta in results.items():
        print(f"Cliff's Delta between {pair[0]} and {pair[1]}: {delta:.3f}")

