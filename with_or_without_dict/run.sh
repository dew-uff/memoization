#!/bin/bash
sleep 10
echo "Starting persist_with_or_without_dict.py (1/3)" | mail -s "Phoenix - Trial 4" joaolopez@id.uff.br
python persist_with_or_without_dict.py > temp_persist.txt 2>&1

echo "Done persist_with_or_without_dict.py (1/3)\nStarting restore_with_or_without_dict.py diff (2/3)" | mail -s "Phoenix - Trial 4" joaolopez@id.uff.br
python restore_with_or_without_dict.py diff > temp_restore_diff.txt 2>&1

echo "Done restore_with_or_without_dict.py diff (2/3)\nStarting restore_with_or_without_dict.py same(3/3)" | mail -s "Phoenix - Trial 4" joaolopez@id.uff.br
python restore_with_or_without_dict.py same > temp_restore_same.txt 2>&1

echo "Done restore_with_or_without_dict.py same (3/3)\nStarting map_log_file_2_table_file.py" | mail -s "Phoenix - Trial 4" joaolopez@id.uff.br
python map_log_file_2_table_file.py persist_with_or_without_dict_script_log.txt persist_output.txt

python map_log_file_2_table_file.py restore_same_values_with_or_without_dict_script_log.txt restore_same_output.txt                                 

python map_log_file_2_table_file.py restore_diff_values_with_or_without_dict_script_log.txt restore_diff_output.txt

echo "Done mapping log files to table files" | mail -s "Phoenix - Trial 4" joaolopez@id.uff.br
