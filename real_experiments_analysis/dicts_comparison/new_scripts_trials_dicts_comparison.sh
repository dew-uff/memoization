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

######### TRIAL 1
#Executing for num-dict 0
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 100 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 100 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 100 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 100 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 100 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 100 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 100 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 100 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

######### TRIAL 2
#Executing for num-dict 0
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 125 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 125 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 125 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 125 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 125 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 125 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 125 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 125 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

######### TRIAL 3
#Executing for num-dict 0
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 150 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 150 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 150 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 150 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 150 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 150 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 150 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 150 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

######### TRIAL 4
#Executing for num-dict 0
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 175 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 175 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 175 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 175 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 175 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 175 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 175 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 175 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

######### TRIAL 5
#Executing for num-dict 0
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py test_laplace_jacobi_4.py
python test_laplace_jacobi_4.py 200 --exec-mode manual --num-dict 2-fast
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

###### TRIAL 1
#Executing for num-dict 0
echo ''
echo ''
echo 'python TINY_GSGP_10.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py TINY_GSGP_10.py
python TINY_GSGP_10.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python TINY_GSGP_10.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py TINY_GSGP_10.py
python TINY_GSGP_10.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python TINY_GSGP_10.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py TINY_GSGP_10.py
python TINY_GSGP_10.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python TINY_GSGP_10.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py TINY_GSGP_10.py
python TINY_GSGP_10.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

###### TRIAL 2
#Executing for num-dict 0
echo ''
echo ''
echo 'python TINY_GSGP_20.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py TINY_GSGP_20.py
python TINY_GSGP_20.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python TINY_GSGP_20.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py TINY_GSGP_20.py
python TINY_GSGP_20.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python TINY_GSGP_20.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py TINY_GSGP_20.py
python TINY_GSGP_20.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python TINY_GSGP_20.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py TINY_GSGP_20.py
python TINY_GSGP_20.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


###### TRIAL 3
#Executing for num-dict 0
echo ''
echo ''
echo 'python TINY_GSGP.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py TINY_GSGP.py
python TINY_GSGP.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python TINY_GSGP.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py TINY_GSGP.py
python TINY_GSGP.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python TINY_GSGP.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py TINY_GSGP.py
python TINY_GSGP.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python TINY_GSGP.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py TINY_GSGP.py
python TINY_GSGP.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

###### TRIAL 4
#Executing for num-dict 0
echo ''
echo ''
echo 'python TINY_GSGP_40.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py TINY_GSGP_40.py
python TINY_GSGP_40.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python TINY_GSGP_40.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py TINY_GSGP_40.py
python TINY_GSGP_40.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python TINY_GSGP_40.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py TINY_GSGP_40.py
python TINY_GSGP_40.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python TINY_GSGP_40.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py TINY_GSGP_40.py
python TINY_GSGP_40.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

###### TRIAL 5
#Executing for num-dict 0
echo ''
echo ''
echo 'python TINY_GSGP_50.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py TINY_GSGP_50.py
python TINY_GSGP_50.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python TINY_GSGP_50.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py TINY_GSGP_50.py
python TINY_GSGP_50.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python TINY_GSGP_50.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py TINY_GSGP_50.py
python TINY_GSGP_50.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python TINY_GSGP_50.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py TINY_GSGP_50.py
python TINY_GSGP_50.py --exec-mode manual --num-dict 2-fast
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

###### TRIAL 1
#Executing for num-dict 0
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


#Executing for num-dict 2
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg52106.txt --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/



###### TRIAL 2
#Executing for num-dict 0
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg31100.txt --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg31100.txt --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg31100.txt --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg31100.txt --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


#Executing for num-dict 2
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg31100.txt --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg31100.txt --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg31100.txt --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg31100.txt --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/



###### TRIAL 3
#Executing for num-dict 0
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg29090.txt --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg29090.txt --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg29090.txt --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg29090.txt --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


#Executing for num-dict 2
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg29090.txt --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg29090.txt --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg29090.txt --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg29090.txt --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/



###### TRIAL 4
#Executing for num-dict 0
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg9600.txt --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg9600.txt --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg9600.txt --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg9600.txt --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


#Executing for num-dict 2
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg9600.txt --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg9600.txt --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg9600.txt --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg9600.txt --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/



###### TRIAL 5
#Executing for num-dict 0
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg100.txt --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg100.txt --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg100.txt --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg100.txt --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


#Executing for num-dict 2
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg100.txt --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg100.txt --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python count_unique_words_speedupy.py pg100.txt --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py count_unique_words_speedupy.py
python count_unique_words_speedupy.py pg100.txt --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/ speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep



##################################### GROUP 2
######### Experiment sphere_potentials.py
echo ''
echo ''
echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/examples/sphere_potentials
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/DNACC-with-speedupy/adapted_for_speedupy/dnacc ./
conda activate dnacc-env

############ TRIAL 1
#Executing for num-dict 0
echo ''
echo ''
echo 'python sphere_potentials_5.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py sphere_potentials_5.py
python sphere_potentials_5.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python sphere_potentials_5.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py sphere_potentials_5.py
python sphere_potentials_5.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


#Executing for num-dict 2
echo ''
echo ''
echo 'python sphere_potentials_5.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py sphere_potentials_5.py
python sphere_potentials_5.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python sphere_potentials_5.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py sphere_potentials_5.py
python sphere_potentials_5.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


############ TRIAL 2
#Executing for num-dict 0
echo ''
echo ''
echo 'python sphere_potentials_10.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py sphere_potentials_10.py
python sphere_potentials_10.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python sphere_potentials_10.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py sphere_potentials_10.py
python sphere_potentials_10.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


#Executing for num-dict 2
echo ''
echo ''
echo 'python sphere_potentials_10.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py sphere_potentials_10.py
python sphere_potentials_10.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python sphere_potentials_10.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py sphere_potentials_10.py
python sphere_potentials_10.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


############ TRIAL 3
#Executing for num-dict 0
echo ''
echo ''
echo 'python sphere_potentials_15.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py sphere_potentials_15.py
python sphere_potentials_15.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python sphere_potentials_15.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py sphere_potentials_15.py
python sphere_potentials_15.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


#Executing for num-dict 2
echo ''
echo ''
echo 'python sphere_potentials_15.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py sphere_potentials_15.py
python sphere_potentials_15.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python sphere_potentials_15.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py sphere_potentials_15.py
python sphere_potentials_15.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


############ TRIAL 4
#Executing for num-dict 0
echo ''
echo ''
echo 'python sphere_potentials.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py sphere_potentials.py
python sphere_potentials.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python sphere_potentials.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py sphere_potentials.py
python sphere_potentials.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


#Executing for num-dict 2
echo ''
echo ''
echo 'python sphere_potentials.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py sphere_potentials.py
python sphere_potentials.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python sphere_potentials.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py sphere_potentials.py
python sphere_potentials.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


############ TRIAL 5
#Executing for num-dict 0
echo ''
echo ''
echo 'python sphere_potentials_25.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py sphere_potentials_25.py
python sphere_potentials_25.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python sphere_potentials_25.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py sphere_potentials_25.py
python sphere_potentials_25.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


#Executing for num-dict 2
echo ''
echo ''
echo 'python sphere_potentials_25.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py sphere_potentials_25.py
python sphere_potentials_25.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python sphere_potentials_25.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py sphere_potentials_25.py
python sphere_potentials_25.py --exec-mode manual --num-dict 2-fast
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

######## TRIAL 1
#Executing for num-dict 0
echo ''
echo ''
echo 'python ssDNA_tethers_1.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py ssDNA_tethers_1.py
python ssDNA_tethers_1.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python ssDNA_tethers_1.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py ssDNA_tethers_1.py
python ssDNA_tethers_1.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python ssDNA_tethers_1.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py ssDNA_tethers_1.py
python ssDNA_tethers_1.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python ssDNA_tethers_1.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py ssDNA_tethers_1.py
python ssDNA_tethers_1.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


######## TRIAL 2
#Executing for num-dict 0
echo ''
echo ''
echo 'python ssDNA_tethers_2.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py ssDNA_tethers_2.py
python ssDNA_tethers_2.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python ssDNA_tethers_2.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py ssDNA_tethers_2.py
python ssDNA_tethers_2.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python ssDNA_tethers_2.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py ssDNA_tethers_2.py
python ssDNA_tethers_2.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python ssDNA_tethers_2.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py ssDNA_tethers_2.py
python ssDNA_tethers_2.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


######## TRIAL 3
#Executing for num-dict 0
echo ''
echo ''
echo 'python ssDNA_tethers_3.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py ssDNA_tethers_3.py
python ssDNA_tethers_3.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python ssDNA_tethers_3.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py ssDNA_tethers_3.py
python ssDNA_tethers_3.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python ssDNA_tethers_3.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py ssDNA_tethers_3.py
python ssDNA_tethers_3.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python ssDNA_tethers_3.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py ssDNA_tethers_3.py
python ssDNA_tethers_3.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


######## TRIAL 4
#Executing for num-dict 0
echo ''
echo ''
echo 'python ssDNA_tethers_4.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py ssDNA_tethers_4.py
python ssDNA_tethers_4.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python ssDNA_tethers_4.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py ssDNA_tethers_4.py
python ssDNA_tethers_4.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python ssDNA_tethers_4.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py ssDNA_tethers_4.py
python ssDNA_tethers_4.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python ssDNA_tethers_4.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py ssDNA_tethers_4.py
python ssDNA_tethers_4.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


######## TRIAL 5
#Executing for num-dict 0
echo ''
echo ''
echo 'python ssDNA_tethers.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py ssDNA_tethers.py
python ssDNA_tethers.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python ssDNA_tethers.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py ssDNA_tethers.py
python ssDNA_tethers.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python ssDNA_tethers.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py ssDNA_tethers.py
python ssDNA_tethers.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python ssDNA_tethers.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py ssDNA_tethers.py
python ssDNA_tethers.py --exec-mode manual --num-dict 2-fast
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

##### TRIAL 1
#Executing for num-dict 0
echo ''
echo ''
echo 'python heap_permutation.py 8 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 8 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python heap_permutation.py 8 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 8 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python heap_permutation.py 8 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 8 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python heap_permutation.py 8 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 8 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 2
#Executing for num-dict 0
echo ''
echo ''
echo 'python heap_permutation.py 7 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 7 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python heap_permutation.py 7 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 7 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python heap_permutation.py 7 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 7 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python heap_permutation.py 7 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 7 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 3
#Executing for num-dict 0
echo ''
echo ''
echo 'python heap_permutation.py 6 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 6 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python heap_permutation.py 6 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 6 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python heap_permutation.py 6 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 6 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python heap_permutation.py 6 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 6 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 4
#Executing for num-dict 0
echo ''
echo ''
echo 'python heap_permutation.py 5 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 5 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python heap_permutation.py 5 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 5 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python heap_permutation.py 5 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 5 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python heap_permutation.py 5 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 5 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 5
#Executing for num-dict 0
echo ''
echo ''
echo 'python heap_permutation.py 4 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 4 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python heap_permutation.py 4 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 4 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python heap_permutation.py 4 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 4 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python heap_permutation.py 4 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py heap_permutation.py
python heap_permutation.py 4 --exec-mode manual --num-dict 2-fast
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

##### TRIAL 1
#Executing for num-dict 0
echo ''
echo ''
echo 'python metropolis_hastings.py 75000 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 75000 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python metropolis_hastings.py 75000 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 75000 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python metropolis_hastings.py 75000 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 75000 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python metropolis_hastings.py 75000 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 75000 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 2
#Executing for num-dict 0
echo ''
echo ''
echo 'python metropolis_hastings.py 72500 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 72500 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python metropolis_hastings.py 72500 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 72500 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python metropolis_hastings.py 72500 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 72500 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python metropolis_hastings.py 72500 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 72500 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 3
#Executing for num-dict 0
echo ''
echo ''
echo 'python metropolis_hastings.py 70000 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 70000 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python metropolis_hastings.py 70000 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 70000 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python metropolis_hastings.py 70000 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 70000 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python metropolis_hastings.py 70000 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 70000 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 4
#Executing for num-dict 0
echo ''
echo ''
echo 'python metropolis_hastings.py 67500 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 67500 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python metropolis_hastings.py 67500 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 67500 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python metropolis_hastings.py 67500 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 67500 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python metropolis_hastings.py 67500 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 67500 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 5
#Executing for num-dict 0
echo ''
echo ''
echo 'python metropolis_hastings.py 65000 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 65000 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python metropolis_hastings.py 65000 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 65000 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python metropolis_hastings.py 65000 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 65000 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python metropolis_hastings.py 65000 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py metropolis_hastings.py
python metropolis_hastings.py 65000 --exec-mode manual --num-dict 2-fast
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

##### TRIAL 1
#Executing for num-dict 0
echo ''
echo ''
echo 'python menger_sponge_speedupy_160.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_160.py
python menger_sponge_speedupy_160.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python menger_sponge_speedupy_160.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_160.py
python menger_sponge_speedupy_160.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

#Executing for num-dict 2
echo ''
echo ''
echo 'python menger_sponge_speedupy_160.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_160.py
python menger_sponge_speedupy_160.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python menger_sponge_speedupy_160.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_160.py
python menger_sponge_speedupy_160.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/


##### TRIAL 2
#Executing for num-dict 0
echo ''
echo ''
echo 'python menger_sponge_speedupy_170.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_170.py
python menger_sponge_speedupy_170.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python menger_sponge_speedupy_170.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_170.py
python menger_sponge_speedupy_170.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

#Executing for num-dict 2
echo ''
echo ''
echo 'python menger_sponge_speedupy_170.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_170.py
python menger_sponge_speedupy_170.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python menger_sponge_speedupy_170.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_170.py
python menger_sponge_speedupy_170.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/


##### TRIAL 3
#Executing for num-dict 0
echo ''
echo ''
echo 'python menger_sponge_speedupy_180.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_180.py
python menger_sponge_speedupy_180.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python menger_sponge_speedupy_180.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_180.py
python menger_sponge_speedupy_180.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

#Executing for num-dict 2
echo ''
echo ''
echo 'python menger_sponge_speedupy_180.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_180.py
python menger_sponge_speedupy_180.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python menger_sponge_speedupy_180.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_180.py
python menger_sponge_speedupy_180.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/


##### TRIAL 4
#Executing for num-dict 0
echo ''
echo ''
echo 'python menger_sponge_speedupy_190.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_190.py
python menger_sponge_speedupy_190.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python menger_sponge_speedupy_190.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_190.py
python menger_sponge_speedupy_190.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

#Executing for num-dict 2
echo ''
echo ''
echo 'python menger_sponge_speedupy_190.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_190.py
python menger_sponge_speedupy_190.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python menger_sponge_speedupy_190.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py menger_sponge_speedupy_190.py
python menger_sponge_speedupy_190.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/


##### TRIAL 5
#Executing for num-dict 0
echo ''
echo ''
echo 'python menger_sponge_speedupy.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py menger_sponge_speedupy.py
python menger_sponge_speedupy.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python menger_sponge_speedupy.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py menger_sponge_speedupy.py
python menger_sponge_speedupy.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

#Executing for num-dict 2
echo ''
echo ''
echo 'python menger_sponge_speedupy.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py menger_sponge_speedupy.py
python menger_sponge_speedupy.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python menger_sponge_speedupy.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py menger_sponge_speedupy.py
python menger_sponge_speedupy.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/ speedupy/




##################################### GROUP 4
######### Experiment mov_robots_speedupy.py
cd /home/joaopedrolopez/Downloads/AvaliacaoExperimental/Experimentos/speedupy_experiments/05msrgithubexps/05msrgithubexps_exp01_mov_robots
cp -r /home/joaopedrolopez/Downloads/AvaliacaoExperimental/ProfilingExperimentos/speedupy ./
conda activate msr-env

##### TRIAL 1
#Executing for num-dict 0
echo ''
echo ''
echo 'python mov_robots_speedupy.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py mov_robots_speedupy.py
python mov_robots_speedupy.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python mov_robots_speedupy.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py mov_robots_speedupy.py
python mov_robots_speedupy.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python mov_robots_speedupy.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py mov_robots_speedupy.py
python mov_robots_speedupy.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python mov_robots_speedupy.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py mov_robots_speedupy.py
python mov_robots_speedupy.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep



##### TRIAL 2
#Executing for num-dict 0
echo ''
echo ''
echo 'python mov_robots_speedupy_1.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py mov_robots_speedupy_1.py
python mov_robots_speedupy_1.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python mov_robots_speedupy_1.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py mov_robots_speedupy_1.py
python mov_robots_speedupy_1.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python mov_robots_speedupy_1.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py mov_robots_speedupy_1.py
python mov_robots_speedupy_1.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python mov_robots_speedupy_1.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py mov_robots_speedupy_1.py
python mov_robots_speedupy_1.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 3
#Executing for num-dict 0
echo ''
echo ''
echo 'python mov_robots_speedupy_2.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py mov_robots_speedupy_2.py
python mov_robots_speedupy_2.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python mov_robots_speedupy_2.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py mov_robots_speedupy_2.py
python mov_robots_speedupy_2.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python mov_robots_speedupy_2.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py mov_robots_speedupy_2.py
python mov_robots_speedupy_2.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python mov_robots_speedupy_2.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py mov_robots_speedupy_2.py
python mov_robots_speedupy_2.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 4
#Executing for num-dict 0
echo ''
echo ''
echo 'python mov_robots_speedupy_3.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py mov_robots_speedupy_3.py
python mov_robots_speedupy_3.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python mov_robots_speedupy_3.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py mov_robots_speedupy_3.py
python mov_robots_speedupy_3.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python mov_robots_speedupy_3.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py mov_robots_speedupy_3.py
python mov_robots_speedupy_3.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python mov_robots_speedupy_3.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py mov_robots_speedupy_3.py
python mov_robots_speedupy_3.py --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 5
#Executing for num-dict 0
echo ''
echo ''
echo 'python mov_robots_speedupy_4.py --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py mov_robots_speedupy_4.py
python mov_robots_speedupy_4.py --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python mov_robots_speedupy_4.py --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py mov_robots_speedupy_4.py
python mov_robots_speedupy_4.py --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python mov_robots_speedupy_4.py --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py mov_robots_speedupy_4.py
python mov_robots_speedupy_4.py --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python mov_robots_speedupy_4.py --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py mov_robots_speedupy_4.py
python mov_robots_speedupy_4.py --exec-mode manual --num-dict 2-fast
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


##### TRIAL 1
#Executing for num-dict 0
echo ''
echo ''
echo 'python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 1000 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 2
#Executing for num-dict 0
echo ''
echo ''
echo 'python eq_solver_speedupy.py 900 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 900 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python eq_solver_speedupy.py 900 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 900 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python eq_solver_speedupy.py 900 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 900 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python eq_solver_speedupy.py 900 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 900 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 3
#Executing for num-dict 0
echo ''
echo ''
echo 'python eq_solver_speedupy.py 800 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 800 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python eq_solver_speedupy.py 800 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 800 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python eq_solver_speedupy.py 800 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 800 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python eq_solver_speedupy.py 800 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 800 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 4
#Executing for num-dict 0
echo ''
echo ''
echo 'python eq_solver_speedupy.py 700 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 700 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python eq_solver_speedupy.py 700 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 700 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python eq_solver_speedupy.py 700 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 700 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python eq_solver_speedupy.py 700 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 700 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


##### TRIAL 5
#Executing for num-dict 0
echo ''
echo ''
echo 'python eq_solver_speedupy.py 600 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 600 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python eq_solver_speedupy.py 600 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 600 --exec-mode manual --num-dict 1
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2
echo ''
echo ''
echo 'python eq_solver_speedupy.py 600 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 600 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python eq_solver_speedupy.py 600 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py eq_solver_speedupy.py
python eq_solver_speedupy.py 600 --exec-mode manual --num-dict 2-fast
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

###### TRIAL 1
#Executing for num-dict 0
echo ''
echo ''
echo 'python power.py 1241231241 462 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231241 462 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python power.py 1241231241 462 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231241 462 --exec-mode manual --num-dict 1
rm -rf .speedupy/

#Executing for num-dict 2
echo ''
echo ''
echo 'python power.py 1241231241 462 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231241 462 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python power.py 1241231241 462 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231241 462 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


###### TRIAL 2
#Executing for num-dict 0
echo ''
echo ''
echo 'python power.py 1241231241 450 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231241 450 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python power.py 1241231241 450 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231241 450 --exec-mode manual --num-dict 1
rm -rf .speedupy/

#Executing for num-dict 2
echo ''
echo ''
echo 'python power.py 1241231241 450 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231241 450 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python power.py 1241231241 450 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231241 450 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


###### TRIAL 3
#Executing for num-dict 0
echo ''
echo ''
echo 'python power.py 1241231000 462 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231000 462 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python power.py 1241231000 462 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231000 462 --exec-mode manual --num-dict 1
rm -rf .speedupy/

#Executing for num-dict 2
echo ''
echo ''
echo 'python power.py 1241231000 462 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231000 462 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python power.py 1241231000 462 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231000 462 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


###### TRIAL 4
#Executing for num-dict 0
echo ''
echo ''
echo 'python power.py 124123124 462 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py power.py
python power.py 124123124 462 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python power.py 124123124 462 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py power.py
python power.py 124123124 462 --exec-mode manual --num-dict 1
rm -rf .speedupy/

#Executing for num-dict 2
echo ''
echo ''
echo 'python power.py 124123124 462 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py power.py
python power.py 124123124 462 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python power.py 124123124 462 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py power.py
python power.py 124123124 462 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep


###### TRIAL 5
#Executing for num-dict 0
echo ''
echo ''
echo 'python power.py 1241231231 460 --exec-mode manual --num-dict 0'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231231 460 --exec-mode manual --num-dict 0
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 1
echo ''
echo ''
echo 'python power.py 1241231231 460 --exec-mode manual --num-dict 1'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231231 460 --exec-mode manual --num-dict 1
rm -rf .speedupy/

#Executing for num-dict 2
echo ''
echo ''
echo 'python power.py 1241231231 460 --exec-mode manual --num-dict 2'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231231 460 --exec-mode manual --num-dict 2
rm -rf .speedupy/

random_sleep=$(shuf -i 2-5 -n 1)
sleep $random_sleep

#Executing for num-dict 2-fast
echo ''
echo ''
echo 'python power.py 1241231231 460 --exec-mode manual --num-dict 2-fast'
python speedupy/setup_exp/setup.py power.py
python power.py 1241231231 460 --exec-mode manual --num-dict 2-fast
rm -rf .speedupy/ speedupy/
