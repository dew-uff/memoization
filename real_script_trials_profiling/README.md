# Real Script Trials Profiling

This folder contains information on how to reproduce the profiling conducted on the real-world script trials.

## Run Scripts

To reproduce the profiling, execute the following commands:

```bash
cd scripts/
./new_new_scripts_trials_profiling.sh
```

This script will generate five profiling report files (named `report-TIMESTAMP.txt`) in each script folder. These files contain the profiling data collected during the experiment trials. The order of execution is preserved through the timestamps in the filenames.

## Extracting Results

To consolidate all results into a single file, navigate to the parent folder where all experiments are stored and execute:

```bash
cd util_scripts/
find PARENT_EXPERIMENTS_FOLDER/ -type f -name 'report-*' -exec sh -c 'echo "=== {} ==="; cat {}' \; >> combined_reports.txt
python combined_reports2txt_table.py
```
- The **find** command collects all report file contents into a single file named **combined_reports.txt**.
- The **combined_reports2txt_table.py** script processes **combined_reports.txt** and generates a **final.txt** file with the results formatted as a table.

## Article Results

The results used in our article are available in the **results/** folder.
