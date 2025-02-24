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

# diff_AB = calculate_differences(architecture_lazy, architecture_func_seq)
#########diff_AC = calculate_differences(architecture_lazy, architecture_func_thread)
# diff_AD = calculate_differences(architecture_lazy, architecture_eager_seq)
# diff_AE = calculate_differences(architecture_lazy, architecture_eager_thread)
#########diff_BC = calculate_differences(architecture_func_seq, architecture_func_thread)
# diff_BD = calculate_differences(architecture_func_seq, architecture_eager_seq)
# diff_BE = calculate_differences(architecture_func_seq, architecture_eager_thread)
#########diff_CD = calculate_differences(architecture_func_thread, architecture_eager_seq)
#########diff_CE = calculate_differences(architecture_func_thread, architecture_eager_thread)
diff_DE = [0.11664951255079359, 0.2157980774063617, 0.31847325939452276, 0.4194123215856962, 0.5203030414995737, 0.35685042198747396, 0.295100505463779, 0.3005272409063764, 0.32615387707483023, 0.4330778931034729, 0.21485557255800813, 0.026687731442507356, 0.0057040860410779715, 0.002775888890028, 0.0024050140054896474, 14.224207813036628, 13.759432928520255, 13.332054883707315, 12.996211241115816, 12.635024129995145, 8.039386880001985, 8.955075748555828, 10.163587493007071, 11.39557527640136, 12.459590659535024, 0.002415066468529403, 0.0023779449984431267, 0.002380456542596221, 0.002362716943025589, 0.0023565569426864386, 0.036051691975444555, 0.13396013097371906, 0.33334217604715377, 0.0677707385038957, 0.09977164398878813, 0.21446886647026986, 0.39139545150101185, 0.2830175175331533, 0.3181656365050003, 0.2491036815335974, 0.06889317242894322, 0.034202255425043404, 0.09754853404592723, 0.12751726352144033, 0.15882839157711715, 0.00439105648547411, 0.0044003690127283335, 0.004178331117145717, 0.003876583999954164, 0.004341974970884621]

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

# shapiro_test(diff_AB, 'Architecture A vs B')
# ##################shapiro_test(diff_AC, 'Architecture A vs C')
# shapiro_test(diff_AD, 'Architecture A vs D')
# shapiro_test(diff_AE, 'Architecture A vs E')
# ##################shapiro_test(diff_BC, 'Architecture B vs C')
# shapiro_test(diff_BD, 'Architecture B vs D')
# shapiro_test(diff_BE, 'Architecture B vs E')
# ##################shapiro_test(diff_CD, 'Architecture C vs D')
# ##################shapiro_test(diff_CE, 'Architecture C vs E')
shapiro_test(diff_DE, 'Architecture D vs E')
