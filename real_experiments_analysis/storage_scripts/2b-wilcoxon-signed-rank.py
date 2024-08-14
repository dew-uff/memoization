import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt

# Data for Architecture A and B
architecture_A = [736.9744003, 0.336105962, 16.86387289, 0.07055323551, 0.181583031, 2.24059915, 13.82645409, 12.48234422, 0.07188145799, 0.02040505249, 0.01457504596]
architecture_B = [766.6642353, 0.3309742265, 18.32987274, 0.067465831, 0.1785426555, 3.563244967, 15.35210858, 14.03270602, 0.07387165452, 0.02570510848, 0.01125669951]

# Perform Wilcoxon signed-rank test
w_stat, p_value = stats.wilcoxon(architecture_A, architecture_B)

# Print the results of the Wilcoxon signed-rank test
print(f'Wilcoxon signed-rank test statistic: {w_stat}')
print(f'p-value: {p_value}')

# Check if the p-value indicates statistical significance
alpha = 0.05
if p_value < alpha:
    print('The difference between Architecture A and Architecture B is statistically significant.')
else:
    print('The difference between Architecture A and Architecture B is not statistically significant.')

# Create box plots
plt.figure(figsize=(10, 6))
plt.boxplot([architecture_A, architecture_B], labels=['Architecture A', 'Architecture B'])
plt.title('Performance Comparison of Architectures A and B')
plt.ylabel('Time')
plt.grid(True)
plt.show()