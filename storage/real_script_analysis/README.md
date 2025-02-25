# Storage - Real Script Analysis

## Run Scripts

To reproduce the analysis of the article execute:

```bash
cd scripts/
seq 1 10 | xargs -I {} -n 1 -P 1 bash -c './new_new_scripts_trials_storage_scripts.sh >> raw_results.txt 2>&1'
```

This will execute all real world experiments trials used on the article, 10 times each. The results will be saved on file **raw_results.txt**

## Extracting Results

The previous scruot executes 10 times the same experiment trial. In our article we use the median output obtained as the oficial result. In order to extract the median outputs obtained, please execute:

```bash
cd util_scripts/
python extract_main_data.py raw_results.txt temp_file.txt
python extract_median_results.py temp_file.txt median_results.txt
```

**extract_main_data.py** will summarize the original results file, leaving only the experiment command and the execution time obtained.

**extract_median_results.py** will pick the summarized results file and generate an output file with the median results obtained.

## Article Results

The results we used on our article are available inside **results/** folder
