import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt

# Sample data for Architecture A and Architecture B
# Replace these lists with your actual paired data
architecture_A = [736.9744003, 0.336105962, 16.86387289, 0.07055323551, 0.181583031, 2.24059915, 13.82645409, 12.48234422, 0.07188145799, 0.02040505249, 0.01457504596]
architecture_B = [766.6642353, 0.3309742265, 18.32987274, 0.067465831, 0.1785426555, 3.563244967, 15.35210858, 14.03270602, 0.07387165452, 0.02570510848, 0.01125669951]

# Calculate the differences between paired measurements
differences = np.array(architecture_A) - np.array(architecture_B)

# Shapiro-Wilk test for the normality of differences
shapiro_stat, shapiro_p_value = stats.shapiro(differences)

# Print results
print(f'Shapiro-Wilk test statistic for differences: {shapiro_stat}')
print(f'p-value for normality of differences: {shapiro_p_value}')

# Check if the p-value indicates normality
alpha = 0.05
if shapiro_p_value < alpha:
    print('The differences are not normally distributed (reject H0).')
else:
    print('The differences are approximately normally distributed (fail to reject H0).')
