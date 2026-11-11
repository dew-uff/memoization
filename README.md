# memoization

This repository contains all the resources needed to reproduce the experimental analyses performed in the article.

## External Repositories

The cache memoization tool used in the experimental analysis is available at [SpeeduPy](https://github.com/dew-uff/speedupy). The release used for the article is SpeeduPy's version [1.7.0](https://github.com/dew-uff/speedupy/releases/tag/v1.7.0).

The real-world scripts referenced in the article can be found in the following repositories:

- [SpeeduPy Experiments](https://github.com/dew-uff/speedupy_experiments) (SPEEDUPY_EXPS_REPO)
- [DNACC](https://github.com/JoaoLopez/DNACC-with-speedupy) (DNACC_REPO)
- [Menger Sponge](https://github.com/JoaoLopez/menger-sponge-with-speedupy) (MENGER_SPONGE_REPO)

## Experiment Folder Mapping

The following table maps the real-world scripts to their corresponding experiment folders:

|           Experiment Name          | Folder Path |
|:----------------------------------:|:-----------------------:|
|    Test Laplace Jacobi             | [SPEEDUPY_EXPS_REPO/04benchproglangs/04benchpl_exp09_iterative_solver_jacobi_OK/](https://github.com/dew-uff/speedupy_experiments/tree/main/04benchproglangs/04benchpl_exp09_iterative_solver_jacobi_OK) |
|    Count Unique Words              | [SPEEDUPY_EXPS_REPO/04benchproglangs/04benchpl_exp03_count_unique_words_OK/](https://github.com/dew-uff/speedupy_experiments/tree/main/04benchproglangs/04benchpl_exp03_count_unique_words_OK) |
|    Sphere Potentials               | [DNACC_REPO/adapted_for_speedupy/examples/sphere_potentials/](https://github.com/JoaoLopez/DNACC-with-speedupy/tree/master/adapted_for_speedupy/examples/sphere_potentials) |
|    Metropolis Hastings             | [SPEEDUPY_EXPS_REPO/04benchproglangs/04benchpl_exp07_metropolis_hastings/](https://github.com/dew-uff/speedupy_experiments/tree/main/04benchproglangs/04benchpl_exp07_metropolis_hastings) |
|    Menger Sponge                   | [MENGER_SPONGE_REPO/](https://github.com/JoaoLopez/menger-sponge-with-speedupy) |
|    Eq Solver                       | [SPEEDUPY_EXPS_REPO/05msrgithubexps/05msrgithubexps_exp03_eq_solver/](https://github.com/dew-uff/speedupy_experiments/tree/main/05msrgithubexps/05msrgithubexps_exp03_eq_solver) |
|    Squirrel                        | [SQUIRREL_REPO]([https://github.com/JoaoLopez/Tiny-GSGP-with-speedupy/tree/master/adapted_for_speedupy](https://github.com/JoaoLopez/squirrel-with-s)) |
| Detecting Paleoclimate Transitions | [PALEOCLIMATE_REPO](https://github.com/JoaoLopez/Detecting_Paleoclimate_Transitions_with_LERM-with-s) |
|    MDAnalysis                      | [MD_ANALYSIS_REPO/doc/source/examples/analysis/trajectory_similarity/](https://github.com/JoaoLopez/MDAnalysis-UserGuide-with-s/blob/develop/doc/source/examples/analysis/trajectory_similarity/) |


## Reproducibility
All experiments were runed inside `Dockerfile_experiments` container, except for `Detecting Paleoclimate Transitions` which were executed in a container built from `Dockerfile_detecting_paleoclimate_transitions`.
