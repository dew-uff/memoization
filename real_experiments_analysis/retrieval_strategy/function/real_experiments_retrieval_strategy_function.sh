#!/bin/bash
sleep 10

if command -v conda >/dev/null 2>&1; then
    CONDA_BASE=$(conda info --base)
    # If conda is installed and initialized, use the base environment
    source "$CONDA_BASE/etc/profile.d/conda.sh"
else
    echo "Error: Conda not found or not initialized."
    exit 1
fi

##################################### GROUP 1
######### Experiment test_laplace_jacobi_4.py
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp09_iterative_solver_jacobi_OK
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
conda activate benchmarks-env

#Executing for function sequential
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for function thread
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
rm -rf .speedupy/ speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep



######### Experiment TINY_GSGP.py
echo ''
echo ''
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/Tiny-GSGP-with-speedupy/adapted_for_speedupy
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
conda activate tiny-env

#Executing for function sequential
echo ''
echo ''
echo 'python TINY_GSGP.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential'
python speedupy/setup_exp/setup.py TINY_GSGP.py
python TINY_GSGP.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
python TINY_GSGP.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for function thread
echo ''
echo ''
echo 'python TINY_GSGP.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread'
python speedupy/setup_exp/setup.py TINY_GSGP.py
python TINY_GSGP.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
python TINY_GSGP.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
rm -rf .speedupy/ speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


######### Experiment count_unique_words_speedupy.py
echo ''
echo ''
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp03_count_unique_words_OK
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
conda activate benchmarks-env

#Executing for function sequential
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for function thread
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
rm -rf .speedupy/ speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep



##################################### GROUP 2
######### Experiment copy_matrix_serial.py
echo ''
echo ''
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp01_copy_matrix_OK
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
conda activate benchmarks-env

#Executing for function sequential
echo ''
echo ''
echo 'python copy_matrix_serial_speedupy.py 6250 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential'
python speedupy/setup_exp/setup.py copy_matrix_serial_speedupy.py
python copy_matrix_serial_speedupy.py 6250 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
python copy_matrix_serial_speedupy.py 6250 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for function thread
echo ''
echo ''
echo 'python copy_matrix_serial_speedupy.py 6250 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread'
python speedupy/setup_exp/setup.py copy_matrix_serial_speedupy.py
python copy_matrix_serial_speedupy.py 6250 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
python copy_matrix_serial_speedupy.py 6250 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
rm -rf .speedupy/ speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep



######### Experiment sphere_potentials.py
echo ''
echo ''
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/examples/sphere_potentials
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/dnacc ./
conda activate dnacc-env

#Executing for function sequential
echo ''
echo ''
echo 'python sphere_potentials.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential'
python speedupy/setup_exp/setup.py sphere_potentials.py
python sphere_potentials.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
python sphere_potentials.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for function thread
echo ''
echo ''
echo 'python sphere_potentials.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread'
python speedupy/setup_exp/setup.py sphere_potentials.py
python sphere_potentials.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
python sphere_potentials.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
rm -rf .speedupy/ speedupy/ dnacc/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep



######### Experiment ssDNA_tethers.py
echo ''
echo ''
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/examples/ssDNA_tethers
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/dnacc ./
conda activate dnacc-env

#Executing for function sequential
echo ''
echo ''
echo 'python ssDNA_tethers.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential'
python speedupy/setup_exp/setup.py ssDNA_tethers.py
python ssDNA_tethers.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
python ssDNA_tethers.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for function thread
echo ''
echo ''
echo 'python ssDNA_tethers.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread'
python speedupy/setup_exp/setup.py ssDNA_tethers.py
python ssDNA_tethers.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
python ssDNA_tethers.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
rm -rf .speedupy/ speedupy/ dnacc/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep



##################################### GROUP 3
######### Experiment heap_permutation.py
echo ''
echo ''
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/01pilots/01pilots_exp05_heap_permutation
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
conda activate pilots-env

#Executing for function sequential
echo ''
echo ''
echo 'python heap_permutation.py 8 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 8 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
python heap_permutation.py 8 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for function thread
echo ''
echo ''
echo 'python heap_permutation.py 8 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 8 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
python heap_permutation.py 8 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
rm -rf .speedupy/ speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep



######### Experiment metropolis_hastings.py
echo ''
echo ''
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/04benchproglangs/04benchpl_exp07_metropolis_hastings
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
conda activate benchmarks-env

#Executing for function sequential
echo ''
echo ''
echo 'python metropolis_hastings.py 75000 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 75000 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
python metropolis_hastings.py 75000 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for function thread
echo ''
echo ''
echo 'python metropolis_hastings.py 75000 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 75000 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
python metropolis_hastings.py 75000 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
rm -rf .speedupy/ speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep



######### Experiment menger_sponge_speedupy.py
echo ''
echo ''
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/menger-sponge-with-speedupy
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
conda activate menger-env

#Executing for function sequential
echo ''
echo ''
echo 'python menger_sponge_speedupy.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential'
python speedupy/setup_exp/setup.py menger_sponge_speedupy.py
python menger_sponge_speedupy.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
python menger_sponge_speedupy.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for function thread
echo ''
echo ''
echo 'python menger_sponge_speedupy.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread'
python speedupy/setup_exp/setup.py menger_sponge_speedupy.py
python menger_sponge_speedupy.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
python menger_sponge_speedupy.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
rm -rf .speedupy/ speedupy/


##################################### GROUP 4
######### Experiment mov_robots.py
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/05msrgithubexps/05msrgithubexps_exp01_mov_robots
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
conda activate msr-env

#Executing for function sequential
echo ''
echo ''
echo 'python mov_robots_speedupy.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential'
python speedupy/setup_exp/setup.py mov_robots_speedupy.py
python mov_robots_speedupy.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
python mov_robots_speedupy.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for function thread
echo ''
echo ''
echo 'python mov_robots_speedupy.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread'
python speedupy/setup_exp/setup.py mov_robots_speedupy.py
python mov_robots_speedupy.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
python mov_robots_speedupy.py --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
rm -rf .speedupy/ speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep



######### Experiment eq_solver.py
echo ''
echo ''
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/05msrgithubexps/05msrgithubexps_exp03_eq_solver
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
conda activate msr-env

#Executing for function sequential
echo ''
echo ''
echo 'python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for function thread
echo ''
echo ''
echo 'python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
rm -rf .speedupy/ speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


######### Experiment power.py
echo ''
echo ''
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/01pilots/01pilots_exp02_power
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
conda activate pilots-env

#Executing for function sequential
echo ''
echo ''
echo 'python power.py 1241231241 462 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231241 462 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
python power.py 1241231241 462 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode sequential
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for function thread
echo ''
echo ''
echo 'python power.py 1241231241 462 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231241 462 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
python power.py 1241231241 462 --exec-mode manual --num-dict 2 -s db --retrieval-strategy function --retrieval-exec-mode thread
rm -rf .speedupy/ speedupy/
