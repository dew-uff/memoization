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

The cache memoization tool used in the experimental analysis is available at [SpeeduPy](https://github.com/dew-uff/speedupy). For profiling the scripts we used the SpeeduPy version [1.0.1_profiling](), while for time measure we used version [1.0.1_time_measure]().

The real-world scripts referenced in the article can be found in the following repositories:

- [SpeeduPy Experiments](https://github.com/dew-uff/speedupy_experiments) (SPEEDUPY_EXPS_REPO)
- [Tiny GSGP](https://github.com/JoaoLopez/Tiny-GSGP-with-speedupy) (TINY_GSGP_REPO)
- [DNACC](https://github.com/JoaoLopez/DNACC-with-speedupy) (DNACC_REPO)
- [Menger Sponge](https://github.com/JoaoLopez/menger-sponge-with-speedupy) (MENGER_SPONGE_REPO)

## Experiment Folder Mapping

The following table maps the real-world scripts to their corresponding experiment folders:

|       Experiment Name     | Folder Path |
|:-------------------------:|:-----------------------:|
|    Test Laplace Jacobi    |            0            |
|    Tiny GSGP              |            1            |
|    Count Unique Words     |            2            |
|    Sphere Potentials      |          2-fast         |
|    ssDNA Tethers          |            0            |
|    Heap Permutation       |            0            |
|    Metropolis Hastings    |            0            |
|    Menger Sponge          |            0            |
|    Eq Solver              |            0            |
|    Power                  |            0            |
