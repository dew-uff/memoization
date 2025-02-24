sleep 10
for i in $(seq 1 100); do
  python simulation.py >> results_draw_${i}.txt 2>&1
done