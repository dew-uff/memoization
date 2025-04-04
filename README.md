# memoization

This repository contains all the resources needed to reproduce the experimental analyses performed in the article.

## Folder Structure

The repository is organized into the following directories:

- **data\_loading/**

  - Contains all resources for the experimental analysis of the data loading component.

- **main\_memory\_data\_structures/**

  - Contains all resources for the experimental analysis of the main memory data structure component.

- **real\_script\_trials\_profiling/**

  - Contains all resources for profiling real-world experiment trials.

- **storage/**

  - Contains all resources for the experimental analysis of the storage component.

## External Repositories

The cache memoization tool used in the experimental analysis is available at [SpeeduPy](https://github.com/dew-uff/speedupy). For profiling the scripts we used the SpeeduPy version [1.0.1-profiling](https://github.com/dew-uff/speedupy/releases/tag/v1.0.1-profiling), while for time measure we used version [1.0.1-time-measure](https://github.com/dew-uff/speedupy/releases/tag/v1.0.1-time-measure).

The real-world scripts referenced in the article can be found in the following repositories:

- [SpeeduPy Experiments](https://github.com/dew-uff/speedupy_experiments) (SPEEDUPY_EXPS_REPO)
- [Tiny GSGP](https://github.com/JoaoLopez/Tiny-GSGP-with-speedupy) (TINY_GSGP_REPO)
- [DNACC](https://github.com/JoaoLopez/DNACC-with-speedupy) (DNACC_REPO)
- [Menger Sponge](https://github.com/JoaoLopez/menger-sponge-with-speedupy) (MENGER_SPONGE_REPO)

## Experiment Folder Mapping

The following table maps the real-world scripts to their corresponding experiment folders:

|       Experiment Name     | Folder Path |
|:-------------------------:|:-----------------------:|
|    Test Laplace Jacobi    | [SPEEDUPY_EXPS_REPO/04benchproglangs/04benchpl_exp09_iterative_solver_jacobi_OK/](https://github.com/dew-uff/speedupy_experiments/tree/main/04benchproglangs/04benchpl_exp09_iterative_solver_jacobi_OK) |
|    Tiny GSGP              | [TINY_GSGP_REPO/adapted_for_speedupy/](https://github.com/JoaoLopez/Tiny-GSGP-with-speedupy/tree/master/adapted_for_speedupy) |
|    Count Unique Words     | [SPEEDUPY_EXPS_REPO/04benchproglangs/04benchpl_exp03_count_unique_words_OK/](https://github.com/dew-uff/speedupy_experiments/tree/main/04benchproglangs/04benchpl_exp03_count_unique_words_OK) |
|    Sphere Potentials      | [DNACC_REPO/adapted_for_speedupy/examples/sphere_potentials/](https://github.com/JoaoLopez/DNACC-with-speedupy/tree/master/adapted_for_speedupy/examples/sphere_potentials) |
|    ssDNA Tethers          | [DNACC_REPO/adapted_for_speedupy/examples/ssDNA_tethers/](https://github.com/JoaoLopez/DNACC-with-speedupy/tree/master/adapted_for_speedupy/examples/ssDNA_tethers) |
|    Heap Permutation       | [SPEEDUPY_EXPS_REPO/01pilots/01pilots_exp05_heap_permutation/](https://github.com/dew-uff/speedupy_experiments/tree/main/01pilots/01pilots_exp05_heap_permutation) |
|    Metropolis Hastings    | [SPEEDUPY_EXPS_REPO/04benchproglangs/04benchpl_exp07_metropolis_hastings/](https://github.com/dew-uff/speedupy_experiments/tree/main/04benchproglangs/04benchpl_exp07_metropolis_hastings) |
|    Menger Sponge          | [MENGER_SPONGE_REPO/](https://github.com/JoaoLopez/menger-sponge-with-speedupy) |
|    Eq Solver              | [SPEEDUPY_EXPS_REPO/05msrgithubexps/05msrgithubexps_exp03_eq_solver/](https://github.com/dew-uff/speedupy_experiments/tree/main/05msrgithubexps/05msrgithubexps_exp03_eq_solver) |
|    Power                  | [SPEEDUPY_EXPS_REPO/01pilots/01pilots_exp02_power/](https://github.com/dew-uff/speedupy_experiments/tree/main/01pilots/01pilots_exp02_power) |

## Reproducibility
### Installing Real-world Experiments
To perform any of the real script analyses presented in the article, you must install the real-world experiments. Visit each repository listed in the [Experiment Folder Mapping](#experiment-folder-mapping) section and follow the setup instructions provided in the **README.md** files of the corresponding projects.

### Reproducing the Real-world Experiment Trials Profiling
To reproduce the profiling performed on the real-world experiment trials follow the instructions available in the [real\_script\_trials\_profiling/README.md](https://github.com/dew-uff/memoization/blob/main/real_script_trials_profiling/README.md).

### Reproducing the Article Analyses
All analyses were conducted using SpeeduPy release [v1.0.1-time-measure](https://github.com/dew-uff/speedupy/releases/tag/v1.0.1-time-measure). To set it up, follow these steps:

1. Install **Python 3.9** on your machine.
2. Download and extract the SpeeduPy release [v1.0.1-time-measure](https://github.com/dew-uff/speedupy/releases/tag/v1.0.1-time-measure).
3. Install SpeeduPy by running the following commands:
```bash
mv speedupy-1.0.1-time-measure/ speedupy/
cd speedupy/
pip install -r requirements.txt
```
4. To reproduce a specific analysis, follow the appropriate link below:
- [Data Loading - Real Script Analysis](https://github.com/dew-uff/memoization/blob/main/data_loading/real_script_analysis/README.md)
- [Main Memory Data Structures - Real Script Analysis](https://github.com/dew-uff/memoization/blob/main/main_memory_data_structures/real_script_analysis/README.md)
- [Main Memory Data Structures - Synthetic Analysis](https://github.com/dew-uff/memoization/blob/main/main_memory_data_structures/synthetic_analysis/README.md)
- [Storage - Real Script Analysis](https://github.com/dew-uff/memoization/blob/main/storage/real_script_analysis/README.md)
- [Storage - Synthetic Analysis](https://github.com/dew-uff/memoization/blob/main/storage/synthetic_analysis/README.md)
