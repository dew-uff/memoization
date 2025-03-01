# Main Memory Data Structures - Real Script Analysis

## Run Simulation

To reproduce the analysis presented in the article, execute the following command:

```bash
cd scripts/
seq 1 10 | xargs -I {} -n 1 -P 1 bash -c './new_new_scripts_trials_dicts_comparison.sh >> raw_results.txt 2>&1'
```

This command runs all real-world experiment trials used in the article, executing each trial 10 times. The results will be saved in **raw_results.txt**.

## Extracting Simulation Results

Our simulation executes 10 time the same experiment trial. In our article we use the median output as the official result. To extract the median results, execute:

```bash
cd util_scripts/
python extract_main_data.py raw_results.txt temp_file.txt
python extract_median_results.py temp_file.txt median_results.txt
```

- **extract_main_data.py**: Summarizes the original results file, retaining only the experiment command and execution time.
- **extract_median_results.py**: Processes the summarized results file to generate an output file with the median results.

## Article Results

The results used in our article are available in the **results/** folder.
