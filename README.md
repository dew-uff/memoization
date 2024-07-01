# memoization

The storage tests are available in the `storage_scripts/` directory. To reproduce them, enter the folder and run: `python restore_storage_script.py` and `python persist_storage_script.py`

`with_or_without_dict/` folder:
    To execute the simulation scripts, run: `./run.sh`
    
    To execute the real experiments comparison, move the `run_real_experiments.sh` script to `AvaliacaoExperimental/` and execute: `seq 1 10 | xargs -I {} -n 1 -P 1 bash -c './run_real_experiments.sh >> with_or_without_script_log.txt 2>&1'`

`storage_scripts/` folder:
    To execute the simulation scripts, run: `./run.sh`
    
    To execute the real experiments comparison, move the `run_real_experiments.sh` script to `AvaliacaoExperimental/` and execute:`seq 1 10 | xargs -I {} -n 1 -P 1 bash -c './run_real_experiments.sh >> storage_scripts_log.txt 2>&1'`

`dicts_comparison/` folder:
    To execute the simulation scripts, run: `./run.sh`
    
    To execute the real experiments comparison, move the `run_real_experiments.sh` script to `AvaliacaoExperimental/` and execute:`seq 1 10 | xargs -I {} -n 1 -P 1 bash -c './run_real_experiments.sh >> dicts_comparison_log.txt 2>&1'`