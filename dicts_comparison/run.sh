#!/bin/bash

sleep 10

python find_values_to_store_dicts_comparison.py > temp_find.txt 2>&1

python persist_dicts_comparison.py > temp_persist.txt 2>&1

python search_dicts_comparison.py > temp_search.txt 2>&1

python map_log_file_2_table_file.py find_values_to_store_dicts_comparison_script_log.txt find_output.txt
 
python map_log_file_2_table_file.py persist_dicts_comparison_script_log.txt persist_output.txt

python map_log_file_2_table_file.py search_dicts_comparison_script_log.txt search_output.txt
