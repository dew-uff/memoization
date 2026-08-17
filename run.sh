#!/bin/bash
# sleep 10

# Checking if a seed was passed in the CLI
if [ -n "$1" ]; then
  SEED="$1"
else
  SEED=$(python -c "import secrets; print(secrets.randbits(64))")
fi

echo "Using seed: $SEED"

BASE_DIR=
SPEEDUPY_DIR=

run_in_docker() {
  local docker_image="$1"
  local exp_path="$2"
  local cmd="$3"

  docker run --rm \
    --network host \
    -v "$exp_path:/app" \
    -w /app \
    "$docker_image" bash -c "$cmd"
}

create_env() {
  local exp_path="$1"

  echo ''

  echo "Entering exp folder: cd ${exp_path}"
  cd ${exp_path}

  echo "Copying speedupy to exp folder: cp -r ${SPEEDUPY_DIR} ./"
  cp -r ${SPEEDUPY_DIR} ./
}

destroy_env() {
  local exp_path="$1"
  local docker_image="$2"

  echo ''
  echo "Erasing cache using ${docker_image}: rm -rf speeedupy/ .speedupy/"
  run_in_docker "$docker_image" "$exp_path" "rm -rf speedupy/ .speedupy/"
}


run_exp() {
  local exp_path="$1"
  local docker_image="$2"

  shift 2  # Remove first 2 arguments; the rest are commands
  local commands=("$@")

  echo '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>'
  echo "Using Docker image: $docker_image"
  
  create_env $exp_path
  
  echo ''
  echo ''

  local i
  for ((i = 0; i < ${#commands[@]}; i++)); do
    local cmd="${commands[$i]}"
    echo "Executing command: $cmd"
    run_in_docker "$docker_image" "$exp_path" "$cmd"
  done

  echo ''

  destroy_env $exp_path $docker_image
}

run_trials_once_sequentially() {
  local setup_commands=("${@:1:5}")
  local exec_commands=("${@:6:5}")
  local exp_options=("${11}")
  local exp_path=("${12}")
  local docker_image=("${13}")

  local i
  local cmds=()
  for i in "${!setup_commands[@]}"; do
    cmds+=("${setup_commands[$i]}")
    cmds+=("${exec_commands[$i]} $exp_options")
  done

  run_exp "$exp_path" "$docker_image" "${cmds[@]}"
}

run_random_trials_once_sequentially() {
  local setup_commands=("${@:1:5}")
  local exec_commands=("${@:6:5}")
  local exp_options=("${11}")
  local exp_path=("${12}")
  local docker_image=("${13}")
  local random_seed=("${14}")

  # Generate random value
  echo "Entering repository: cd ${BASE_DIR}/.."
  cd $BASE_DIR/..
  
  echo "Generating random inputs: python random_input_generator.py ${#setup_commands[@]} --seed ${random_seed}"
  result=$(python random_input_generator.py ${#setup_commands[@]} --seed $random_seed)

  mapfile -t inputs < <(jq -r '.inputs[]' <<< "$result")

  echo "Results: ${result}"

  local random_setup_commands=()
  local random_exec_commands=()
  local i
  for i in "${inputs[@]}"; do
    random_setup_commands+=("${setup_commands[i]}")
    random_exec_commands+=("${exec_commands[i]}")
  done

  run_trials_once_sequentially "${random_setup_commands[@]}" "${random_exec_commands[@]}" "$exp_options" "$exp_path" "$docker_image"
}

run_trials_twice_isolated() {
  local setup_commands=("${@:1:5}")
  local exec_commands=("${@:6:5}")
  local exp_options=("${11}")
  local exp_path=("${12}")
  local docker_image=("${13}")

  local i
  for i in "${!setup_commands[@]}"; do
    run_exp "$exp_path" "$docker_image" "${setup_commands[$i]}" "${exec_commands[$i]} $exp_options" "${exec_commands[$i]} $exp_options"
  done
}

run_without_cache() {
  local setup_commands=("${@:1:5}")
  local exec_commands=("${@:6:5}")
  local exp_path=("${11}")
  local docker_image=("${12}")

  run_trials_once_sequentially "${setup_commands[@]}" "${exec_commands[@]}" "--exec-mode no-cache --measure-time" "$exp_path" "$docker_image"
}

run_with_cache() {
  local setup_commands=("${@:1:5}")
  local exec_commands=("${@:6:5}")
  local exp_options=("${11}")
  local exp_path=("${12}")
  local docker_image=("${13}")

  run_trials_twice_isolated "${setup_commands[@]}" "${exec_commands[@]}" "$exp_options -mt 0.01 --exec-mode manual --measure-time" "$exp_path" "$docker_image"
  run_trials_once_sequentially "${setup_commands[@]}" "${exec_commands[@]}" "$exp_options -mt 0.01 --exec-mode manual --measure-time" "$exp_path" "$docker_image"


  # Inverting commands sequence
  mapfile -t setup_commands < <(printf "%s\n" "${setup_commands[@]}" | tac)
  mapfile -t exec_commands  < <(printf "%s\n" "${exec_commands[@]}" | tac)

  run_trials_once_sequentially "${setup_commands[@]}" "${exec_commands[@]}" "$exp_options -mt 0.01 --exec-mode manual --measure-time" "$exp_path" "$docker_image"

  local i
  for i in {0..2}; do
    run_random_trials_once_sequentially "${setup_commands[@]}" "${exec_commands[@]}" "--exec-mode no-cache --measure-time" "$exp_path" "$docker_image" "$((SEED+i))"
    run_random_trials_once_sequentially "${setup_commands[@]}" "${exec_commands[@]}" "$exp_options -mt 0.01 --exec-mode manual --measure-time" "$exp_path" "$docker_image" "$((SEED+i))"
  done
}

# Hashes disponíveis: ("md5" "murmur" "xxhash" "meowhash" "museair" "a5hash")
# Storages disponíveis: ("sqlite" "redis" "mongo-file" "mysql" "file")
# Arquiteturas de memória disponíveis: ("0-dict" "1-dict" "2-dict" "2-dict-fast" "memcached-wt" "memcached-wb")
hashes=("meowhash" "museair" "a5hash")
storages=("file")
mem_arch=("0-dict")
retrieval_strategy_with_exec_mode=(
  "lazy|sequential"
  # "function|sequential"
  # "function|thread"
  # "eager|sequential"
  # "eager|thread"
)

# EXPERIMENT TEST LAPLACE JACOBI
run_without_cache \
  "python speedupy/setup_exp/setup.py test_laplace_jacobi_param.py" \
  "python speedupy/setup_exp/setup.py test_laplace_jacobi_param.py" \
  "python speedupy/setup_exp/setup.py test_laplace_jacobi_param.py" \
  "python speedupy/setup_exp/setup.py test_laplace_jacobi_param.py" \
  "python speedupy/setup_exp/setup.py test_laplace_jacobi_param.py" \
  "python test_laplace_jacobi_param.py 105 0.006" \
  "python test_laplace_jacobi_param.py 105 0.002" \
  "python test_laplace_jacobi_param.py 105 0.0006" \
  "python test_laplace_jacobi_param.py 105 0.0003" \
  "python test_laplace_jacobi_param.py 105 0.00008" \
  "${BASE_DIR}/01_test_laplace_jacobi" \
  "experiments_image"


# EXPERIMENT COUNT UNIQUE WORDS WITH HEADER REPETITIONS
run_without_cache \
  "python speedupy/setup_exp/setup.py count_unique_words_speedupy.py" \
  "python speedupy/setup_exp/setup.py count_unique_words_speedupy.py" \
  "python speedupy/setup_exp/setup.py count_unique_words_speedupy.py" \
  "python speedupy/setup_exp/setup.py count_unique_words_speedupy.py" \
  "python speedupy/setup_exp/setup.py count_unique_words_speedupy.py" \
  "python count_unique_words_speedupy.py input11.txt" \
  "python count_unique_words_speedupy.py input12.txt" \
  "python count_unique_words_speedupy.py input13.txt" \
  "python count_unique_words_speedupy.py input14.txt" \
  "python count_unique_words_speedupy.py input15.txt" \
  "${BASE_DIR}/02_count_unique_words" \
  "experiments_image"


# EXPERIMENT SPHERE POTENTIALS
run_without_cache \
  "python speedupy/setup_exp/setup.py sphere_potentials_param.py" \
  "python speedupy/setup_exp/setup.py sphere_potentials_param.py" \
  "python speedupy/setup_exp/setup.py sphere_potentials_param.py" \
  "python speedupy/setup_exp/setup.py sphere_potentials_param.py" \
  "python speedupy/setup_exp/setup.py sphere_potentials_param.py" \
  "python sphere_potentials_param.py 0.08" \
  "python sphere_potentials_param.py 0.039" \
  "python sphere_potentials_param.py 0.026" \
  "python sphere_potentials_param.py 0.02" \
  "python sphere_potentials_param.py 0.0157" \
  "${BASE_DIR}/03_sphere_potentials" \
  "experiments_image"

# EXPERIMENT METROPOLIS HASTINGS
run_without_cache \
  "python speedupy/setup_exp/setup.py metropolis_hastings.py" \
  "python speedupy/setup_exp/setup.py metropolis_hastings.py" \
  "python speedupy/setup_exp/setup.py metropolis_hastings.py" \
  "python speedupy/setup_exp/setup.py metropolis_hastings.py" \
  "python speedupy/setup_exp/setup.py metropolis_hastings.py" \
  "python metropolis_hastings.py 6000000" \
  "python metropolis_hastings.py 11000000" \
  "python metropolis_hastings.py 17000000" \
  "python metropolis_hastings.py 19000000" \
  "python metropolis_hastings.py 29000000" \
  "${BASE_DIR}/04_metropolis_hastings" \
  "experiments_image"


# EXPERIMENT MENGER SPONGE
run_without_cache \
  "python speedupy/setup_exp/setup.py menger_sponge_speedupy_param.py" \
  "python speedupy/setup_exp/setup.py menger_sponge_speedupy_param.py" \
  "python speedupy/setup_exp/setup.py menger_sponge_speedupy_param.py" \
  "python speedupy/setup_exp/setup.py menger_sponge_speedupy_param.py" \
  "python speedupy/setup_exp/setup.py menger_sponge_speedupy_param.py" \
  "python menger_sponge_speedupy_param.py 2400" \
  "python menger_sponge_speedupy_param.py 3100" \
  "python menger_sponge_speedupy_param.py 3800" \
  "python menger_sponge_speedupy_param.py 4750" \
  "python menger_sponge_speedupy_param.py 5000" \
  "${BASE_DIR}/05_menger_sponge" \
  "experiments_image"


# EXPERIMENT EQ SOLVER
run_without_cache \
  "python speedupy/setup_exp/setup.py eq_solver_speedupy_param.py" \
  "python speedupy/setup_exp/setup.py eq_solver_speedupy_param.py" \
  "python speedupy/setup_exp/setup.py eq_solver_speedupy_param.py" \
  "python speedupy/setup_exp/setup.py eq_solver_speedupy_param.py" \
  "python speedupy/setup_exp/setup.py eq_solver_speedupy_param.py" \
  "python eq_solver_speedupy_param.py 600 499976" \
  "python eq_solver_speedupy_param.py 600 1000000" \
  "python eq_solver_speedupy_param.py 600 1420000" \
  "python eq_solver_speedupy_param.py 600 1999901" \
  "python eq_solver_speedupy_param.py 600 2499851" \
  "${BASE_DIR}/06_eq_solver" \
  "experiments_image"


# EXPERIMENT SQUIRREL
run_without_cache \
  "python simulate_mock_datacube.py; python speedupy/setup_exp/setup.py squirrel_example_param.py" \
  "python simulate_mock_datacube.py; python speedupy/setup_exp/setup.py squirrel_example_param.py" \
  "python simulate_mock_datacube.py; python speedupy/setup_exp/setup.py squirrel_example_param.py" \
  "python simulate_mock_datacube.py; python speedupy/setup_exp/setup.py squirrel_example_param.py" \
  "python simulate_mock_datacube.py; python speedupy/setup_exp/setup.py squirrel_example_param.py" \
  "python squirrel_example_param.py 1" \
  "python squirrel_example_param.py 17" \
  "python squirrel_example_param.py 33" \
  "python squirrel_example_param.py 50" \
  "python squirrel_example_param.py 60" \
  "${BASE_DIR}/07_squirrel/notebooks" \
  "experiments_image"


# EXPERIMENT Detecting_Paleoclimate_Transitions_with_LERM
run_without_cache \
  "python speedupy/setup_exp/setup.py ODP_LERM_param.py" \
  "python speedupy/setup_exp/setup.py ODP_LERM_param.py" \
  "python speedupy/setup_exp/setup.py ODP_LERM_param.py" \
  "python speedupy/setup_exp/setup.py ODP_LERM_param.py" \
  "python speedupy/setup_exp/setup.py ODP_LERM_param.py" \
  "python ODP_LERM_param.py 1" \
  "python ODP_LERM_param.py 130000" \
  "python ODP_LERM_param.py 350000" \
  "python ODP_LERM_param.py 540000" \
  "python ODP_LERM_param.py 820000" \
  "${BASE_DIR}/08_detecting_paleoclimate_transitions" \
  "detecting_paleoclimate_transitions_image"


# EXPERIMENT HARMONIC ENSEMBLE SIMILARITY
run_without_cache \
  "python speedupy/setup_exp/setup.py harmonic_ensemble_similarity_param.py" \
  "python speedupy/setup_exp/setup.py harmonic_ensemble_similarity_param.py" \
  "python speedupy/setup_exp/setup.py harmonic_ensemble_similarity_param.py" \
  "python speedupy/setup_exp/setup.py harmonic_ensemble_similarity_param.py" \
  "python speedupy/setup_exp/setup.py harmonic_ensemble_similarity_param.py" \
  "python harmonic_ensemble_similarity_param.py 'backbone'" \
  "python harmonic_ensemble_similarity_param.py 'backbone or name CG*'" \
  "python harmonic_ensemble_similarity_param.py 'backbone or name CB or name CG'" \
  "python harmonic_ensemble_similarity_param.py 'backbone or name CB or name CG or name CD or name CE'" \
  "python harmonic_ensemble_similarity_param.py 'backbone or name CB or name CG or name CD or name CG1 or name CG2 or name CE or name NZ or (resname PHE TYR TRP and name CZ CE* CD*)'" \
  "${BASE_DIR}/09_MDAnalysis_UserGuide" \
  "experiments_image"

for h in "${hashes[@]}"; do
  for s in "${storages[@]}"; do
    for m in "${mem_arch[@]}"; do
      for r in "${retrieval_strategy_with_exec_mode[@]}"; do
        IFS="|" read -r rs rem <<< "$r"

        # EXPERIMENT TEST LAPLACE JACOBI
        run_with_cache \
          "python speedupy/setup_exp/setup.py test_laplace_jacobi_param.py" \
          "python speedupy/setup_exp/setup.py test_laplace_jacobi_param.py" \
          "python speedupy/setup_exp/setup.py test_laplace_jacobi_param.py" \
          "python speedupy/setup_exp/setup.py test_laplace_jacobi_param.py" \
          "python speedupy/setup_exp/setup.py test_laplace_jacobi_param.py" \
          "python test_laplace_jacobi_param.py 105 0.006" \
          "python test_laplace_jacobi_param.py 105 0.002" \
          "python test_laplace_jacobi_param.py 105 0.0006" \
          "python test_laplace_jacobi_param.py 105 0.0003" \
          "python test_laplace_jacobi_param.py 105 0.00008" \
          "-H $h -s $s --mem-arch $m --retrieval-strategy $rs --retrieval-exec-mode $rem" \
          "${BASE_DIR}/01_test_laplace_jacobi" \
          "experiments_image"


        # EXPERIMENT COUNT UNIQUE WORDS WITH HEADER REPETITIONS
        run_with_cache \
          "python speedupy/setup_exp/setup.py count_unique_words_speedupy.py" \
          "python speedupy/setup_exp/setup.py count_unique_words_speedupy.py" \
          "python speedupy/setup_exp/setup.py count_unique_words_speedupy.py" \
          "python speedupy/setup_exp/setup.py count_unique_words_speedupy.py" \
          "python speedupy/setup_exp/setup.py count_unique_words_speedupy.py" \
          "python count_unique_words_speedupy.py input11.txt" \
          "python count_unique_words_speedupy.py input12.txt" \
          "python count_unique_words_speedupy.py input13.txt" \
          "python count_unique_words_speedupy.py input14.txt" \
          "python count_unique_words_speedupy.py input15.txt" \
          "-H $h -s $s --mem-arch $m --retrieval-strategy $rs --retrieval-exec-mode $rem"\
          "${BASE_DIR}/02_count_unique_words" \
          "experiments_image"


        # EXPERIMENT SPHERE POTENTIALS
        run_with_cache \
          "python speedupy/setup_exp/setup.py sphere_potentials_param.py" \
          "python speedupy/setup_exp/setup.py sphere_potentials_param.py" \
          "python speedupy/setup_exp/setup.py sphere_potentials_param.py" \
          "python speedupy/setup_exp/setup.py sphere_potentials_param.py" \
          "python speedupy/setup_exp/setup.py sphere_potentials_param.py" \
          "python sphere_potentials_param.py 0.08" \
          "python sphere_potentials_param.py 0.039" \
          "python sphere_potentials_param.py 0.026" \
          "python sphere_potentials_param.py 0.02" \
          "python sphere_potentials_param.py 0.0157" \
          "-H $h -s $s --mem-arch $m --retrieval-strategy $rs --retrieval-exec-mode $rem" \
          "${BASE_DIR}/03_sphere_potentials" \
          "experiments_image"


        # EXPERIMENT METROPOLIS HASTINGS
        run_with_cache \
          "python speedupy/setup_exp/setup.py metropolis_hastings.py" \
          "python speedupy/setup_exp/setup.py metropolis_hastings.py" \
          "python speedupy/setup_exp/setup.py metropolis_hastings.py" \
          "python speedupy/setup_exp/setup.py metropolis_hastings.py" \
          "python speedupy/setup_exp/setup.py metropolis_hastings.py" \
          "python metropolis_hastings.py 6000000" \
          "python metropolis_hastings.py 11000000" \
          "python metropolis_hastings.py 17000000" \
          "python metropolis_hastings.py 19000000" \
          "python metropolis_hastings.py 29000000" \
          "-H $h -s $s --mem-arch $m --retrieval-strategy $rs --retrieval-exec-mode $rem" \
          "${BASE_DIR}/04_metropolis_hastings" \
          "experiments_image"


        # EXPERIMENT MENGER SPONGE
        run_with_cache \
          "python speedupy/setup_exp/setup.py menger_sponge_speedupy_param.py" \
          "python speedupy/setup_exp/setup.py menger_sponge_speedupy_param.py" \
          "python speedupy/setup_exp/setup.py menger_sponge_speedupy_param.py" \
          "python speedupy/setup_exp/setup.py menger_sponge_speedupy_param.py" \
          "python speedupy/setup_exp/setup.py menger_sponge_speedupy_param.py" \
          "python menger_sponge_speedupy_param.py 2400" \
          "python menger_sponge_speedupy_param.py 3100" \
          "python menger_sponge_speedupy_param.py 3800" \
          "python menger_sponge_speedupy_param.py 4750" \
          "python menger_sponge_speedupy_param.py 5000" \
          "-H $h -s $s --mem-arch $m --retrieval-strategy $rs --retrieval-exec-mode $rem" \
          "${BASE_DIR}/05_menger_sponge" \
          "experiments_image"


        # EXPERIMENT EQ SOLVER
        run_with_cache \
          "python speedupy/setup_exp/setup.py eq_solver_speedupy_param.py" \
          "python speedupy/setup_exp/setup.py eq_solver_speedupy_param.py" \
          "python speedupy/setup_exp/setup.py eq_solver_speedupy_param.py" \
          "python speedupy/setup_exp/setup.py eq_solver_speedupy_param.py" \
          "python speedupy/setup_exp/setup.py eq_solver_speedupy_param.py" \
          "python eq_solver_speedupy_param.py 600 499976" \
          "python eq_solver_speedupy_param.py 600 1000000" \
          "python eq_solver_speedupy_param.py 600 1420000" \
          "python eq_solver_speedupy_param.py 600 1999901" \
          "python eq_solver_speedupy_param.py 600 2499851" \
          "-H $h -s $s --mem-arch $m --retrieval-strategy $rs --retrieval-exec-mode $rem" \
          "${BASE_DIR}/06_eq_solver" \
          "experiments_image"


        # EXPERIMENT SQUIRREL
        run_with_cache \
          "python simulate_mock_datacube.py; python speedupy/setup_exp/setup.py squirrel_example_param.py" \
          "python simulate_mock_datacube.py; python speedupy/setup_exp/setup.py squirrel_example_param.py" \
          "python simulate_mock_datacube.py; python speedupy/setup_exp/setup.py squirrel_example_param.py" \
          "python simulate_mock_datacube.py; python speedupy/setup_exp/setup.py squirrel_example_param.py" \
          "python simulate_mock_datacube.py; python speedupy/setup_exp/setup.py squirrel_example_param.py" \
          "python squirrel_example_param.py 1" \
          "python squirrel_example_param.py 17" \
          "python squirrel_example_param.py 33" \
          "python squirrel_example_param.py 50" \
          "python squirrel_example_param.py 60" \
          "-H $h -s $s --mem-arch $m --retrieval-strategy $rs --retrieval-exec-mode $rem" \
          "${BASE_DIR}/07_squirrel/notebooks" \
          "experiments_image"


        # EXPERIMENT Detecting_Paleoclimate_Transitions_with_LERM
        run_with_cache \
          "python speedupy/setup_exp/setup.py ODP_LERM_param.py" \
          "python speedupy/setup_exp/setup.py ODP_LERM_param.py" \
          "python speedupy/setup_exp/setup.py ODP_LERM_param.py" \
          "python speedupy/setup_exp/setup.py ODP_LERM_param.py" \
          "python speedupy/setup_exp/setup.py ODP_LERM_param.py" \
          "python ODP_LERM_param.py 1" \
          "python ODP_LERM_param.py 130000" \
          "python ODP_LERM_param.py 350000" \
          "python ODP_LERM_param.py 540000" \
          "python ODP_LERM_param.py 820000" \
          "-H $h -s $s --mem-arch $m --retrieval-strategy $rs --retrieval-exec-mode $rem" \
          "${BASE_DIR}/08_detecting_paleoclimate_transitions" \
          "detecting_paleoclimate_transitions_image"


        # EXPERIMENT HARMONIC ENSEMBLE SIMILARITY
        run_with_cache \
          "python speedupy/setup_exp/setup.py harmonic_ensemble_similarity_param.py" \
          "python speedupy/setup_exp/setup.py harmonic_ensemble_similarity_param.py" \
          "python speedupy/setup_exp/setup.py harmonic_ensemble_similarity_param.py" \
          "python speedupy/setup_exp/setup.py harmonic_ensemble_similarity_param.py" \
          "python speedupy/setup_exp/setup.py harmonic_ensemble_similarity_param.py" \
          "python harmonic_ensemble_similarity_param.py 'backbone'" \
          "python harmonic_ensemble_similarity_param.py 'backbone or name CG*'" \
          "python harmonic_ensemble_similarity_param.py 'backbone or name CB or name CG'" \
          "python harmonic_ensemble_similarity_param.py 'backbone or name CB or name CG or name CD or name CE'" \
          "python harmonic_ensemble_similarity_param.py 'backbone or name CB or name CG or name CD or name CG1 or name CG2 or name CE or name NZ or (resname PHE TYR TRP and name CZ CE* CD*)'" \
          "-H $h -s $s --mem-arch $m --retrieval-strategy $rs --retrieval-exec-mode $rem" \
          "${BASE_DIR}/09_MDAnalysis_UserGuide" \
          "experiments_image"
      done
    done
  done
done