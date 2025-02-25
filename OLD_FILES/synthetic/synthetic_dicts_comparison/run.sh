#!/bin/bash

sleep 10

echo "Starting find_values_to_store_dicts_comparison.py (1/3)" | mail -s "Phoenix - Trial 5" joaolopez@id.uff.br
python find_values_to_store_dicts_comparison.py > temp_find.txt 2>&1

echo "Done find_values_to_store_dicts_comparison.py (1/3)\nStarting persist_dicts_comparison.py (2/3)" | mail -s "Phoenix - Trial 5" joaolopez@id.uff.br
python persist_dicts_comparison.py > temp_persist.txt 2>&1

echo "Done persist_dicts_comparison.py (2/3)\nStarting search_dicts_comparison.py (3/3)" | mail -s "Phoenix - Trial 5" joaolopez@id.uff.br
python search_dicts_comparison.py > temp_search.txt 2>&1

echo "Done search_dicts_comparison.py (3/3)\nStarting mapping log files to table files" | mail -s "Phoenix - Trial 5" joaolopez@id.uff.br
python map_log_file_2_table_file.py find_values_to_store_dicts_comparison_script_log.txt find_output.txt
 
python map_log_file_2_table_file.py persist_dicts_comparison_script_log.txt persist_output.txt

python map_log_file_2_table_file.py search_dicts_comparison_script_log.txt search_output.txt

echo "Done mapping log files to table files" | mail -s "Phoenix - Trial 5" joaolopez@id.uff.br
