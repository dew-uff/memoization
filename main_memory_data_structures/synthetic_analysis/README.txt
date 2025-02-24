seq 1 100 | xargs -I{} sh -c 'python simulation.py >> results_draw_{}.txt 2>&1;echo "Done draw_{}" | mail -s "Phoenix - Trial 9000" joaolopez@id.uff.br'




seq 1 3 | xargs -I{} sh -c 'python simulation.py >> results_draw_{}.txt 2>&1;echo "Done draw_{}" | mail -s "Phoenix - Trial 9000" joaolopez@id.uff.br'
