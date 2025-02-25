import scipy.stats as stats

# Replace these with your actual data
architecture_A = [738.6994588189991, 734.2192642589798, 737.4304501659935, 737.2300706779934, 736.7187298449571, 736.5424300479935, 736.1839472220163, 737.8183474990074, 742.3629978120443, 734.9307294070022]
architecture_B = [764.0741902639857, 761.3095902189962, 766.5731602910091, 763.9079228990013, 770.083295924007, 769.7617534280289, 768.5024409270263, 768.4014021739713, 766.755310247012, 759.4219375830144]
# architecture_C = [time1, time2, ..., time10]
# architecture_D = [time1, time2, ..., time10]

# Perform one-way ANOVA
# f_statistic, p_value = stats.f_oneway(architecture_A, architecture_B, architecture_C, architecture_D)
f_statistic, p_value = stats.f_oneway(architecture_A, architecture_B)

print(f"F-statistic: {f_statistic}")
print(f"P-value: {p_value}")


# Interpret results
if p_value < 0.05:
    print("There is a significant difference between Architecture A and Architecture B.")
else:
    print("There is no significant difference between Architecture A and Architecture B.")



# If the p-value < 0.05: There are significant differences between at least some of the architectures. Proceed to the next step to identify which architectures differ.

# If the p-value ≥ 0.05: No significant differences are found between the architectures. In this case, the architecture with the lowest average time can be considered the best.