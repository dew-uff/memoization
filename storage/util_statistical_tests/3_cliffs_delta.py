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
        'DB': [0.12207343796035275, 0.22409891890129074, 0.3267555800266564, 0.4324298504507169, 0.5406429584836587, 16.830887498508673, 18.968560002569575, 11.025947016954888, 14.867521504987963, 23.85790151299443, 2.152758880984038, 0.2582977665006183, 0.03851273295003921, 0.008299077511765063, 0.0034487859811633825, 13.507480194501113, 13.084258006012533, 12.71542937454069, 12.277480562916026, 11.755068216007203, 7.941176762920804, 8.913726428057998, 10.203824914060533, 11.149205784488004, 12.331694144464564, 1.821248706546612, 9.214084290899336, 18.787912201485597, 187.31082491995767, 91.20250713254791, 0.03940946504008025, 0.13446106854826212, 0.3412482920102775, 0.06766814296133816, 0.09984851954504848, 0.2160790910711512, 0.3882541755447164, 0.2828188504790887, 0.317984577617608, 0.24766450352035463, 0.0719565434847027, 0.03484639595262706, 0.0970592035446316, 0.12891227449290454, 0.15860264154616743, 0.02002041693776846, 0.016312299529090524, 0.015598553465679288, 0.014414429548196495, 0.016660146531648934],
        'Filesystem': [0.11942789400927722, 0.22245975153055042, 0.3328454624279402, 0.4345769445062615, 0.5372979944804683, 17.795492196048144, 19.22764132847078, 12.044683618529234, 15.86810926249018, 24.930035458004568, 3.623951620538719, 0.44255787698784843, 0.06675352499587461, 0.01248021051287651, 0.004059276543557644, 15.758420146536082, 14.865333427500445, 14.487506986537483, 13.900729314424098, 13.320396867464297, 8.984616118017584, 10.0380003490136, 11.46861743851332, 12.545427077449858, 13.909882535459474, 1.8260773785877973, 9.129972119466402, 18.189611969981343, 182.71561890200246, 90.53834349149838, 0.0357571414206177, 0.131828332436271, 0.3311833150219172, 0.06803166144527495, 0.10007760988082737, 0.21414455748163164, 0.3853263494092971, 0.28481994359754026, 0.3173525545280427, 0.2491467189975083, 0.0735728848958388, 0.03618957905564457, 0.103319879504852, 0.1374422590015456, 0.17082806455437094, 0.025917196995578706, 0.0246791725512594, 0.023418914526700974, 0.02168385754339397, 0.025059604551643133]
    }
    
    results = calculate_cliffs_delta_for_all_pairs(data)
    
    for pair, delta in results.items():
        print(f"Cliff's Delta between {pair[0]} and {pair[1]}: {delta:.3f}")

