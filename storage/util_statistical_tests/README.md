# Storage - Statistical Test

In the article, the statistical test is conducted twice for the storage component: once using the results from the synthetic analysis and once using the results from the real-world script analysis.

## Running the Statistical Test

To reproduce the test, first obtain the median execution times for both the SQLite and file system approaches. These values must be manually inserted into the three Python scripts before execution.

Once the values are inserted, run the following commands to perform the statistical tests:


```bash
python 1_shapiro_wilk_test.py
python 2_wilcoxon_signed_rank_test.py
python 3_cliffs_delta.py
```

The results of the statistical tests will be displayed in the terminal.
