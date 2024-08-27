#!/bin/bash

if command -v conda >/dev/null 2>&1; then
    CONDA_BASE=$(conda info --base)
    # If conda is installed and initialized, use the base environment
    source "$CONDA_BASE/etc/profile.d/conda.sh"
else
    echo "Error: Conda not found or not initialized."
    exit 1
fi

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 2A'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/01pilots/01pilots_exp02_power
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
rm report-*
conda activate pilots-env
python speedupy/setup_exp/setup.py power.py
python power.py 1241231241 462 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 2B'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/01pilots/01pilots_exp02_power
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate pilots-env
python speedupy/setup_exp/setup.py power.py
python power.py 1241231241 450 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 2C'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/01pilots/01pilots_exp02_power
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate pilots-env
python speedupy/setup_exp/setup.py power.py
python power.py 1241231000 462 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 2D'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/01pilots/01pilots_exp02_power
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate pilots-env
python speedupy/setup_exp/setup.py power.py
python power.py 124123124 462 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 2E'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/01pilots/01pilots_exp02_power
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate pilots-env
python speedupy/setup_exp/setup.py power.py
python power.py 1241231231 460 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 5A'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/01pilots/01pilots_exp05_heap_permutation
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
rm report-*
conda activate pilots-env
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 8 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 5B'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/01pilots/01pilots_exp05_heap_permutation
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate pilots-env
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 7 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 5C'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/01pilots/01pilots_exp05_heap_permutation
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate pilots-env
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 6 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 5D'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/01pilots/01pilots_exp05_heap_permutation
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate pilots-env
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 5 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 5E'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/01pilots/01pilots_exp05_heap_permutation
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate pilots-env
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 4 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 13A'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp03_count_unique_words_OK
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg52106.txt -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 13B'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp03_count_unique_words_OK
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg31100.txt -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 13C'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp03_count_unique_words_OK
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg29090.txt -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 13D'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp03_count_unique_words_OK
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg9600.txt -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 13E'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp03_count_unique_words_OK
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg100.txt -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 17A'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp07_metropolis_hastings
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 75000 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 17B'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp07_metropolis_hastings
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 72500 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 17C'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp07_metropolis_hastings
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 70000 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 17D'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp07_metropolis_hastings
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 67500 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 17E'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp07_metropolis_hastings
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 65000 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 19A'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp09_iterative_solver_jacobi_OK
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 100 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 19B'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp09_iterative_solver_jacobi_OK
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 125 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 19C'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp09_iterative_solver_jacobi_OK
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 150 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 19D'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp09_iterative_solver_jacobi_OK
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 175 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 19E'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp09_iterative_solver_jacobi_OK
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate benchmarks-env
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 200 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/


echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 24A'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/05msrgithubexps/05msrgithubexps_exp01_mov_robots
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
rm report-*
conda activate msr-env
python speedupy/setup_exp/setup.py mov_robots_speedupy.py
python mov_robots_speedupy.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/


echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 24B'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/05msrgithubexps/05msrgithubexps_exp01_mov_robots
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate msr-env
python speedupy/setup_exp/setup.py mov_robots_speedupy_1.py
python mov_robots_speedupy_1.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/


echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 24C'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/05msrgithubexps/05msrgithubexps_exp01_mov_robots
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate msr-env
python speedupy/setup_exp/setup.py mov_robots_speedupy_2.py
python mov_robots_speedupy_2.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/


echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 24D'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/05msrgithubexps/05msrgithubexps_exp01_mov_robots
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate msr-env
python speedupy/setup_exp/setup.py mov_robots_speedupy_3.py
python mov_robots_speedupy_3.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/


echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 24E'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/05msrgithubexps/05msrgithubexps_exp01_mov_robots
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate msr-env
python speedupy/setup_exp/setup.py mov_robots_speedupy_4.py
python mov_robots_speedupy_4.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/


echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 26A'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/05msrgithubexps/05msrgithubexps_exp03_eq_solver
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
rm report-*
conda activate msr-env
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 1000 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 26B'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/05msrgithubexps/05msrgithubexps_exp03_eq_solver
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate msr-env
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 900 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 26C'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/05msrgithubexps/05msrgithubexps_exp03_eq_solver
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate msr-env
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 800 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 26D'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/05msrgithubexps/05msrgithubexps_exp03_eq_solver
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate msr-env
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 700 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 26E'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/05msrgithubexps/05msrgithubexps_exp03_eq_solver
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate msr-env
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 600 -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 33A'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/examples/sphere_potentials
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
rm report-*
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/dnacc ./
conda activate dnacc-env
python speedupy/setup_exp/setup.py sphere_potentials_5.py
python sphere_potentials_5.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/ dnacc/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 33B'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/examples/sphere_potentials
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/dnacc ./
conda activate dnacc-env
python speedupy/setup_exp/setup.py sphere_potentials_10.py
python sphere_potentials_10.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/ dnacc/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 33C'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/examples/sphere_potentials
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/dnacc ./
conda activate dnacc-env
python speedupy/setup_exp/setup.py sphere_potentials_15.py
python sphere_potentials_15.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/ dnacc/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 33D'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/examples/sphere_potentials
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/dnacc ./
conda activate dnacc-env
python speedupy/setup_exp/setup.py sphere_potentials.py
python sphere_potentials.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/ dnacc/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 33E'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/examples/sphere_potentials
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/dnacc ./
conda activate dnacc-env
python speedupy/setup_exp/setup.py sphere_potentials_25.py
python sphere_potentials_25.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/ dnacc/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 34A'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/examples/ssDNA_tethers
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
rm report-*
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/dnacc ./
conda activate dnacc-env
python speedupy/setup_exp/setup.py ssDNA_tethers_1.py
python ssDNA_tethers_1.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/ dnacc/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 34B'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/examples/ssDNA_tethers
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/dnacc ./
conda activate dnacc-env
python speedupy/setup_exp/setup.py ssDNA_tethers_2.py
python ssDNA_tethers_2.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/ dnacc/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 34C'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/examples/ssDNA_tethers
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/dnacc ./
conda activate dnacc-env
python speedupy/setup_exp/setup.py ssDNA_tethers_3.py
python ssDNA_tethers_3.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/ dnacc/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 34D'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/examples/ssDNA_tethers
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/dnacc ./
conda activate dnacc-env
python speedupy/setup_exp/setup.py ssDNA_tethers_4.py
python ssDNA_tethers_4.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/ dnacc/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 34E'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/examples/ssDNA_tethers
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/dnacc ./
conda activate dnacc-env
python speedupy/setup_exp/setup.py ssDNA_tethers.py
python ssDNA_tethers.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/ dnacc/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 37A'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/menger-sponge-with-speedupy
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
rm report-*
conda activate menger-env
python speedupy/setup_exp/setup.py menger_sponge_speedupy_160.py
python menger_sponge_speedupy_160.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 37B'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/menger-sponge-with-speedupy
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate menger-env
python speedupy/setup_exp/setup.py menger_sponge_speedupy_170.py
python menger_sponge_speedupy_170.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 37C'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/menger-sponge-with-speedupy
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate menger-env
python speedupy/setup_exp/setup.py menger_sponge_speedupy_180.py
python menger_sponge_speedupy_180.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 37D'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/menger-sponge-with-speedupy
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate menger-env
python speedupy/setup_exp/setup.py menger_sponge_speedupy_190.py
python menger_sponge_speedupy_190.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 37E'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/menger-sponge-with-speedupy
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate menger-env
python speedupy/setup_exp/setup.py menger_sponge_speedupy.py
python menger_sponge_speedupy.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 39A'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/Tiny-GSGP-with-speedupy/adapted_for_speedupy
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
rm report-*
conda activate tiny-env
python speedupy/setup_exp/setup.py TINY_GSGP_10.py
python TINY_GSGP_10.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 39B'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/Tiny-GSGP-with-speedupy/adapted_for_speedupy
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate tiny-env
python speedupy/setup_exp/setup.py TINY_GSGP_20.py
python TINY_GSGP_20.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 39C'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/Tiny-GSGP-with-speedupy/adapted_for_speedupy
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate tiny-env
python speedupy/setup_exp/setup.py TINY_GSGP.py
python TINY_GSGP.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 39D'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/Tiny-GSGP-with-speedupy/adapted_for_speedupy
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate tiny-env
python speedupy/setup_exp/setup.py TINY_GSGP_40.py
python TINY_GSGP_40.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/

echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
echo ''
echo ''
echo 'Experiment 39E'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/Tiny-GSGP-with-speedupy/adapted_for_speedupy
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
# rm report-*
conda activate tiny-env
python speedupy/setup_exp/setup.py TINY_GSGP_50.py
python TINY_GSGP_50.py -s db --exec-mode manual
rm -rf .speedupy/ speedupy/
