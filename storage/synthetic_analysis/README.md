# Storage - Synthetic Analysis

## Run Simulation

To reproduce the synthetic analysis of the article execute:

```bash
cd scripts/
python persist_storage_script.py
python restore_storage_script.py
```

This will generate 4 files with the results obtained by the simulation.


## Viewing All Data on a Table Style

Each simulation is executed 10 trials but only the median of the execution times is saved to the file. However, the result files generated have a quite big output. To see the results in a table style, execute:

```bash
cd util_scripts/
bash map_log_file_2_table_file.py SIMULATION_RESULTS.txt TABLE_VIEW.txt
```


## Article Results

The results we used on our article are available inside **results/** folder
