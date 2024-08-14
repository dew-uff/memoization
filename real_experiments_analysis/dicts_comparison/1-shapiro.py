import numpy as np
from scipy import stats

# Sample data for four architectures (replace with your actual paired data)
architecture_A = [6721.624818, 0.7055611955, 45.74820441, 0.07215134599, 0.1846672315, 2.127466326, 14.28081035, 12.80706461, 0.07304874001, 0.02019734748, 0.01408046001]
architecture_B = [761.5000406, 0.312357886, 15.12576256, 0.06729833601, 0.1770102135, 2.345489222, 13.77005666, 12.88959881, 0.06923659751, 0.01835649251, 0.01071555098]
architecture_C = [737.7256888, 0.3394119385, 16.53247835, 0.07016002046, 0.181082193, 2.175451922, 13.65352607, 12.66570177, 0.07209405399, 0.02052704603, 0.01390773599]
architecture_D = [764.1608846, 0.3071178615, 15.40875583, 0.06895553748, 0.1779098815, 2.41619724, 13.9368223, 12.75775603, 0.0708528375, 0.018610395, 0.01071903747]

# Calculate the differences between paired measurements for each pair of architectures
diff_AB = np.array(architecture_A) - np.array(architecture_B)
diff_AC = np.array(architecture_A) - np.array(architecture_C)
diff_AD = np.array(architecture_A) - np.array(architecture_D)
diff_BC = np.array(architecture_B) - np.array(architecture_C)
diff_BD = np.array(architecture_B) - np.array(architecture_D)
diff_CD = np.array(architecture_C) - np.array(architecture_D)

# Perform Shapiro-Wilk test for each set of differences
def shapiro_test(differences, name):
    shapiro_stat, shapiro_p_value = stats.shapiro(differences)
    print(f'\nShapiro-Wilk test for {name}:')
    print(f'Statistic: {shapiro_stat}')
    print(f'p-value: {shapiro_p_value}')
    if shapiro_p_value < 0.05:
        print(f'The differences for {name} are not normally distributed (reject H0).')
    else:
        print(f'The differences for {name} are approximately normally distributed (fail to reject H0).')

shapiro_test(diff_AB, 'Architecture A vs B')
shapiro_test(diff_AC, 'Architecture A vs C')
shapiro_test(diff_AD, 'Architecture A vs D')
shapiro_test(diff_BC, 'Architecture B vs C')
shapiro_test(diff_BD, 'Architecture B vs D')
shapiro_test(diff_CD, 'Architecture C vs D')
