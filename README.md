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

The cache memoization tool used in the experimental analysis is available at [SpeeduPy](https://github.com/dew-uff/speedupy). For profiling the scripts we used the SpeeduPy version [1.0.1-profiling](https://github.com/dew-uff/speedupy/tree/v1.0.1-profiling), while for time measure we used version [1.0.1-time-measure](https://github.com/dew-uff/speedupy/tree/v1.0.1-time-measure).

The real-world scripts referenced in the article can be found in the following repositories:

- [SpeeduPy Experiments](https://github.com/dew-uff/speedupy_experiments) (SPEEDUPY_EXPS_REPO)
- [Tiny GSGP](https://github.com/JoaoLopez/Tiny-GSGP-with-speedupy) (TINY_GSGP_REPO)
- [DNACC](https://github.com/JoaoLopez/DNACC-with-speedupy) (DNACC_REPO)
- [Menger Sponge](https://github.com/JoaoLopez/menger-sponge-with-speedupy) (MENGER_SPONGE_REPO)

## Experiment Folder Mapping

The following table maps the real-world scripts to their corresponding experiment folders:

|       Experiment Name     | Folder Path |
|:-------------------------:|:-----------------------:|
|    Test Laplace Jacobi    | SPEEDUPY_EXPS_REPO/04benchproglangs/04benchpl_exp09_iterative_solver_jacobi_OK/ |
|    Tiny GSGP              | TINY_GSGP_REPO/adapted_for_speedupy/README.md|
|    Count Unique Words     | SPEEDUPY_EXPS_REPO/04benchproglangs/04benchpl_exp03_count_unique_words_OK/ |
|    Sphere Potentials      | DNACC_REPO/adapted_for_speedupy/examples/sphere_potentials/ |
|    ssDNA Tethers          | DNACC_REPO/adapted_for_speedupy/examples/ssDNA_tethers/ |
|    Heap Permutation       | SPEEDUPY_EXPS_REPO/01pilots/01pilots_exp05_heap_permutation/heap_permutation_numba.py |
|    Metropolis Hastings    | SPEEDUPY_EXPS_REPO/04benchproglangs/04benchpl_exp07_metropolis_hastings/ |
|    Menger Sponge          | MENGER_SPONGE_REPO/ |
|    Eq Solver              | SPEEDUPY_EXPS_REPO/05msrgithubexps/05msrgithubexps_exp03_eq_solver/ |
|    Power                  | SPEEDUPY_EXPS_REPO/01pilots/01pilots_exp02_power/ |
