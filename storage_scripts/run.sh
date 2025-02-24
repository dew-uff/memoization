#!/bin/bash

sleep 10

echo "Starting persist_storage_script.py (1/2)" | mail -s "Phoenix - Trial 2" joaolopez@id.uff.br
python persist_storage_script.py > temp_persist.txt 2>&1

echo "Done persist_storage_script.py (1/2)\nStarting restore_storage_script.py (2/2)" | mail -s "Phoenix - Trial 2" joaolopez@id.uff.br
python restore_storage_script.py > temp_restore.txt 2>&1

echo "Done restore_storage_script.py (2/2)\nStarting map_log_file_2_table_file.py" | mail -s "Phoenix - Trial 2" joaolopez@id.uff.br
python map_log_file_2_table_file.py persist_storage_script_log.txt persist_output.txt
 
python map_log_file_2_table_file.py restore_storage_script_log.txt restore_output.txt

echo "Done mapping log files to table files" | mail -s "Phoenix - Trial 2" joaolopez@id.uff.br
