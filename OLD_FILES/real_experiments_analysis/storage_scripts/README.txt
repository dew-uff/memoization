1º) Provar que segue distribuição normal
2º) (Se 1º for verdadeiro) Provar por ANOVA que os tempos não são significativamente diferentes
3º) (Se 2º for verdadeiro) Provar por Levene's test que as variâncias não são significativamente diferentes (normalidade e variâncias similares são pré-requisitos para o ANOVA)



Certainly! When performing an ANOVA (Analysis of Variance) test, the hypotheses are formulated to assess whether there are significant differences among the means of three or more groups. Here’s how you can formally state the null and alternative hypotheses for your example where you are comparing the performance times of four architectures:

Null Hypothesis (H₀)
H₀: The means of the execution times for all four architectures are equal.

Formally:

𝐻
0
:
𝜇
𝐴
=
𝜇
𝐵
=
𝜇
𝐶
=
𝜇
𝐷
H 
0
​
 :μ 
A
​
 =μ 
B
​
 =μ 
C
​
 =μ 
D
​
 
where 
𝜇
𝐴
μ 
A
​
 , 
𝜇
𝐵
μ 
B
​
 , 
𝜇
𝐶
μ 
C
​
 , and 
𝜇
𝐷
μ 
D
​
  represent the mean execution times for Architecture A, Architecture B, Architecture C, and Architecture D, respectively.

Alternative Hypothesis (H₁)
H₁: At least one of the means of the execution times for the four architectures is different.

Formally:

𝐻
1
:
At least one of 
𝜇
𝐴
,
𝜇
𝐵
,
𝜇
𝐶
,
 or 
𝜇
𝐷
 is different
H 
1
​
 :At least one of μ 
A
​
 ,μ 
B
​
 ,μ 
C
​
 , or μ 
D
​
  is different
This implies that there is at least one pair of architectures with significantly different mean execution times.

Formal Statement
Null Hypothesis (H₀): 
𝜇
𝐴
=
𝜇
𝐵
=
𝜇
𝐶
=
𝜇
𝐷
μ 
A
​
 =μ 
B
​
 =μ 
C
​
 =μ 
D
​
 

This indicates that all four architectures have the same mean execution time, and any differences observed are due to random variation.

Alternative Hypothesis (H₁): At least one of 
𝜇
𝐴
μ 
A
​
 , 
𝜇
𝐵
μ 
B
​
 , 
𝜇
𝐶
μ 
C
​
 , or 
𝜇
𝐷
μ 
D
​
  is different.

This indicates that at least one architecture has a mean execution time that is significantly different from the others.

Interpretation
If the p-value < 0.05: Reject the null hypothesis. This indicates that there are statistically significant differences among the mean execution times of the architectures. You would then need to conduct post-hoc tests (such as Tukey’s HSD) to determine which specific groups differ from each other.

If the p-value ≥ 0.05: Do not reject the null hypothesis. This suggests that there is no significant evidence to indicate that the mean execution times of the architectures differ. The observed differences in execution times could be due to random chance.

