# Real Script Trials Profiling

This folder contains information on how to reproduce the profiling conducted on the real-world script trials.

## Reproducibility
To reproduce the profiling analysis used to group each experiment trial based on the number of cache requests and cache misses, follow these steps:

1. Install **Python 3.9** on your machine.
2. Download and extract the SpeeduPy release [v1.0.1-profiling](https://github.com/dew-uff/speedupy/releases/tag/v1.0.1-profiling).
3. Install SpeeduPy by running the following commands:
```bash
mv speedupy-1.0.1-profiling/ speedupy/
cd speedupy/
pip install -r requirements.txt
```
4. Update experiment paths in **scripts/new_new_scripts_trials_profiling.sh** to match your local setup, then run:
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
