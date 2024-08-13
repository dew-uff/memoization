import numpy as np
from scipy import stats
import pandas as pd
import matplotlib.pyplot as plt
import scikit_posthocs as sp

# Sample data for four architectures (replace with your actual data)
architecture_A = [6721.624818, 0.7055611955, 45.74820441, 0.07215134599, 0.1846672315, 2.127466326, 14.28081035, 12.80706461, 0.07304874001, 0.02019734748, 0.01408046001]
architecture_B = [761.5000406, 0.312357886, 15.12576256, 0.06729833601, 0.1770102135, 2.345489222, 13.77005666, 12.88959881, 0.06923659751, 0.01835649251, 0.01071555098]
architecture_C = [737.7256888, 0.3394119385, 16.53247835, 0.07016002046, 0.181082193, 2.175451922, 13.65352607, 12.66570177, 0.07209405399, 0.02052704603, 0.01390773599]
architecture_D = [764.1608846, 0.3071178615, 15.40875583, 0.06895553748, 0.1779098815, 2.41619724, 13.9368223, 12.75775603, 0.0708528375, 0.018610395, 0.01071903747]

# Combine data into a matrix where each row represents an experiment and each column an architecture
data_matrix = np.array([architecture_A, architecture_B, architecture_C, architecture_D]).T

# Friedman Test
friedman_stat, friedman_p_value = stats.friedmanchisquare(*data_matrix.T)
print(f'Friedman test statistic: {friedman_stat}')
print(f'p-value for Friedman test: {friedman_p_value}')

# Check if the p-value indicates statistical significance
alpha = 0.05
if friedman_p_value < alpha:
    print('There is a statistically significant difference between architectures (Friedman test).')
    
    # Perform post-hoc analysis using Nemenyi test if Friedman test is significant
    posthoc_results = sp.posthoc_nemenyi_friedman(data_matrix)
    print('\nPost-hoc Nemenyi test results:')
    print(posthoc_results)
else:
    print('There is no statistically significant difference between architectures (Friedman test).')

# Box plot for visualization
plt.figure(figsize=(12, 6))
plt.boxplot([architecture_A, architecture_B, architecture_C, architecture_D], labels=['Architecture A', 'Architecture B', 'Architecture C', 'Architecture D'])
plt.title('Performance Comparison of Four Architectures')
plt.ylabel('Time')
plt.grid(True)
plt.show()
