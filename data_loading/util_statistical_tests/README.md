# Data Loading - Statistical Test

In the article, the statistical test is conducted twice for the data loading component: once using the results from the synthetic analysis and once using the results from the real-world script analysis.

## Running the Statistical Test

To reproduce the test, first obtain the median execution times for all five approaches evaluated. These values must be manually inserted into the three Python scripts before execution.

Once the values are inserted, run the following commands to perform the statistical tests:


```bash
python 1_shapiro_wilk_test.py
python 2_friedman_and_post_hoc_nemenyi_tests.py
python 3_cliffs_delta.py
```

The results of the statistical tests will be displayed in the terminal.
