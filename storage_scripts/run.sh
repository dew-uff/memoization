#!/bin/bash

sleep 10
python persist_storage_script.py > temp_persist.txt 2>&1

python restore_storage_script.py > temp_restore.txt 2>&1

python map_log_file_2_table_file.py persist_storage_script_log.txt persist_output.txt
 
python map_log_file_2_table_file.py restore_storage_script_log.txt restore_output.txt
