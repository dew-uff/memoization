import numpy as np
from scipy import stats

# Sample data for four architectures (replace with your actual paired data)
architecture_lazy = [763.8224928, 0.328169424, 16.57436324, 0.06738203898, 0.1773608945, 2.177655237, 13.75329953, 12.54634134, 0.068943002, 0.01629514701, 0.01059700901]
architecture_func_seq = [0.0037764265, 0.340696667, 0.1663855715, 0.06735132953, 0.177209607, 0.2319339215, 14.58437677, 12.87443649, 0.06893888299, 0.004496156995, 0.01073509251]
architecture_func_thread = []
architecture_eager_seq = [0.003532352479, 0.319431808, 0.359292311, 0.06706116701, 0.1765319485, 0.2178198415, 14.46027103, 12.80442439, 0.06909346097, 0.004382739513, 0.01066284554]
architecture_eager_thread = [362.4884921, 0.3227192665, 8.291828543, 0.06829212152, 0.177621434, 1.618026146, 21.48679448, 19.55945598, 0.08929831698, 0.02749853648, 0.0126766625]
# Calculate the differences between paired measurements for each pair of architectures
def calculate_differences(arch1, arch2):
    return np.array(arch1) - np.array(arch2)

diff_AB = calculate_differences(architecture_lazy, architecture_func_seq)
#########diff_AC = calculate_differences(architecture_lazy, architecture_func_thread)
diff_AD = calculate_differences(architecture_lazy, architecture_eager_seq)
diff_AE = calculate_differences(architecture_lazy, architecture_eager_thread)
#########diff_BC = calculate_differences(architecture_func_seq, architecture_func_thread)
diff_BD = calculate_differences(architecture_func_seq, architecture_eager_seq)
diff_BE = calculate_differences(architecture_func_seq, architecture_eager_thread)
#########diff_CD = calculate_differences(architecture_func_thread, architecture_eager_seq)
#########diff_CE = calculate_differences(architecture_func_thread, architecture_eager_thread)
diff_DE = calculate_differences(architecture_eager_seq, architecture_eager_thread)

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
##################shapiro_test(diff_AC, 'Architecture A vs C')
shapiro_test(diff_AD, 'Architecture A vs D')
shapiro_test(diff_AE, 'Architecture A vs E')
##################shapiro_test(diff_BC, 'Architecture B vs C')
shapiro_test(diff_BD, 'Architecture B vs D')
shapiro_test(diff_BE, 'Architecture B vs E')
##################shapiro_test(diff_CD, 'Architecture C vs D')
##################shapiro_test(diff_CE, 'Architecture C vs E')
shapiro_test(diff_DE, 'Architecture D vs E')
