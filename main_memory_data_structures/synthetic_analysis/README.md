# Main Memory Data Structures - Synthetic Analysis

## Running the Simulation

To reproduce the synthetic analysis presented in the article, execute the following command:

```bash
cd scripts/
bash run_simulation.sh
```

This will generate 100 files containing the results obtained from the simulation.

## Extracting Simulation Results

Our simulation executes 10 trials the same experiment. In our article we use the median output as the official result. To extract the median results, execute:

```bash
cd util_scripts/
python extract_median_results.py SIMULATION_RESULTS.txt MEDIAN_VALUES.txt
```

## Viewing Results in Table Format

To view all executed trial outputs in a structured table format, execute:

```bash
cd util_scripts/
python extract_raw_data.py SIMULATION_RESULTS.txt TABLE_VIEW.txt
```

## Article Results

The results used in our article are available in the **results/** folder.
