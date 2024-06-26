#!/bin/bash

python persist_with_or_without_dict.py > temp_persist.txt 2>&1

python restore_with_or_without_dict.py diff > temp_restore_diff.txt 2>&1

python restore_with_or_without_dict.py same > temp_restore_same.txt 2>&1

python map_log_file_2_table_file.py persist_with_or_without_dict_script_log.txt persist_output.txt

python map_log_file_2_table_file.py restore_same_values_with_or_without_dict_script_log.txt restore_same_output.txt                                 

python map_log_file_2_table_file.py restore_diff_values_with_or_without_dict_script_log.txt restore_diff_output.txt