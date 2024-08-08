import numpy as np
import scipy.stats as stats
import matplotlib.pyplot as plt
import seaborn as sns

# Replace these with your actual data
architecture_A = [0.07048150902846828, 0.07015394204063341, 0.07283645099960268, 0.0725898290402256, 0.06965354504063725, 0.0728103059809655, 0.06962973601184785, 0.0706249619834125, 0.07354195998050272, 0.06983292003860697]
architecture_B = [0.06797757197637111, 0.06880977295804769, 0.06751874001929536, 0.06758205301593989, 0.06741292198421434, 0.0676723460201174, 0.066589804016985, 0.06629980995785445, 0.06654942000750452, 0.06645810697227716]
# architecture_C = [time1, time2, ..., time10]
# architecture_D = [time1, time2, ..., time10]

def check_shapiro_wilk(data, name):
    print(f"Shapiro-Wilk Test for {name}:")
    
    # Perform the Shapiro-Wilk Test
    stat, p_value = stats.shapiro(data)
    
    # Print results
    print(f"  Statistic: {stat}")
    print(f"  p-value: {p_value}")

    # Check if p-value is greater than 0.05 (commonly used threshold)
    if p_value > 0.05:
        print("  Data appears to be normally distributed.")
    else:
        print("  Data does not appear to be normally distributed.")

    # Plot histogram and Q-Q plot for visual inspection
    plt.figure(figsize=(12, 6))
    
    # Histogram
    plt.subplot(1, 2, 1)
    sns.histplot(data, kde=True)
    plt.title(f'Histogram of {name}')
    
    # Q-Q Plot
    plt.subplot(1, 2, 2)
    stats.probplot(data, dist="norm", plot=plt)
    plt.title(f'Q-Q Plot of {name}')
    
    plt.savefig('out.png')

# Check normality for each architecture
check_shapiro_wilk(architecture_A, 'Architecture A')
check_shapiro_wilk(architecture_B, 'Architecture B')
# check_shapiro_wilk(architecture_C, 'Architecture C')
# check_shapiro_wilk(architecture_D, 'Architecture D')
