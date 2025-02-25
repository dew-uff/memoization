# Main Memory Data Structures - Synthetic Analysis

## Run Simulation

To reproduce the synthetic analysis of the article execute:

```bash
cd scripts/
bash run_simulation.sh
```

This will generate 100 files with the results obtained by the simulation.


## Extracting Simulation Results

Our simulation executes 10 trials the same experiment. In our article we use the median output obtained as the oficial result. In order to extract the median outputs obtained, please execute:

```bash
cd util_scripts/
bash extract_median_results.py SIMULATION_RESULTS.txt MEDIAN_VALUES.txt
```

## Viewing All Data on a Table Style

You can view all executed trials outputs in a table style. To do so, execute:

```bash
cd util_scripts/
bash extract_raw_data.py SIMULATION_RESULTS.txt TABLE_VIEW.txt
```

## Article Results

The results we used on our article are available inside **results/** folder
