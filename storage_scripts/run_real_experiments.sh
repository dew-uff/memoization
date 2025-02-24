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

#Executing for storage db
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 200 --exec-mode manual -s db'
echo "Starting test_laplace_jacobi_4.py (1/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 200 --exec-mode manual -s db
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for storage file
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 200 --exec-mode manual -s file'
echo "Starting test_laplace_jacobi_4.py (2/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 200 --exec-mode manual -s file
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

#Executing for storage db
echo ''
echo ''
echo 'python TINY_GSGP.py --exec-mode manual -s db'
echo "Starting TINY_GSGP.py (3/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py TINY_GSGP.py
python TINY_GSGP.py --exec-mode manual -s db
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for storage file
echo ''
echo ''
echo 'python TINY_GSGP.py --exec-mode manual -s file'
echo "Starting TINY_GSGP.py (4/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py TINY_GSGP.py
python TINY_GSGP.py --exec-mode manual -s file
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

#Executing for storage db
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg52106.txt --exec-mode manual -s db'
echo "Starting count_unique_words_speedupy.py (5/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg52106.txt --exec-mode manual -s db
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for storage file
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg52106.txt --exec-mode manual -s file'
echo "Starting count_unique_words_speedupy.py (6/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg52106.txt --exec-mode manual -s file
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

#Executing for storage db
echo ''
echo ''
echo 'python copy_matrix_serial_speedupy.py 6250 --exec-mode manual -s db'
echo "Starting copy_matrix_serial_speedupy.py (7/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py copy_matrix_serial_speedupy.py
python copy_matrix_serial_speedupy.py 6250 --exec-mode manual -s db
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for storage file
echo ''
echo ''
echo 'python copy_matrix_serial_speedupy.py 6250 --exec-mode manual -s file'
echo "Starting copy_matrix_serial_speedupy.py (8/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py copy_matrix_serial_speedupy.py
python copy_matrix_serial_speedupy.py 6250 --exec-mode manual -s file
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

#Executing for storage db
echo ''
echo ''
echo 'python sphere_potentials.py --exec-mode manual -s db'
echo "Starting sphere_potentials.py (9/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py sphere_potentials.py
python sphere_potentials.py --exec-mode manual -s db
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for storage file
echo ''
echo ''
echo 'python sphere_potentials.py --exec-mode manual -s file'
echo "Starting sphere_potentials.py (10/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py sphere_potentials.py
python sphere_potentials.py --exec-mode manual -s file
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

#Executing for storage db
echo ''
echo ''
echo 'python ssDNA_tethers.py --exec-mode manual -s db'
echo "Starting ssDNA_tethers.py (11/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py ssDNA_tethers.py
python ssDNA_tethers.py --exec-mode manual -s db
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for storage file
echo ''
echo ''
echo 'python ssDNA_tethers.py --exec-mode manual -s file'
echo "Starting ssDNA_tethers.py (12/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py ssDNA_tethers.py
python ssDNA_tethers.py --exec-mode manual -s file
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

#Executing for storage db
echo ''
echo ''
echo 'python heap_permutation.py 8 --exec-mode manual -s db'
echo "Starting heap_permutation.py (13/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 8 --exec-mode manual -s db
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for storage file
echo ''
echo ''
echo 'python heap_permutation.py 8 --exec-mode manual -s file'
echo "Starting heap_permutation.py (14/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 8 --exec-mode manual -s file
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

#Executing for storage db
echo ''
echo ''
echo 'python metropolis_hastings.py 120000 --exec-mode manual -s db'
echo "Starting metropolis_hastings.py (15/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 120000 --exec-mode manual -s db
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for storage file
echo ''
echo ''
echo 'python metropolis_hastings.py 120000 --exec-mode manual -s file'
echo "Starting metropolis_hastings.py (16/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 120000 --exec-mode manual -s file
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

#Executing for storage db
echo ''
echo ''
echo 'python menger_sponge_speedupy.py --exec-mode manual -s db'
echo "Starting menger_sponge_speedupy.py (17/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py menger_sponge_speedupy.py
python menger_sponge_speedupy.py --exec-mode manual -s db
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for storage file
echo ''
echo ''
echo 'python menger_sponge_speedupy.py --exec-mode manual -s file'
echo "Starting menger_sponge_speedupy.py (18/18)" | mail -s "Phoenix - Trial 10" joaolopez@id.uff.br
python speedupy/setup_exp/setup.py menger_sponge_speedupy.py
python menger_sponge_speedupy.py --exec-mode manual -s file
rm -rf .speedupy/ speedupy/
