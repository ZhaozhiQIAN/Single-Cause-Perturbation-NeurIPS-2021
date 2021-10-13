
#### Balancing Histogram ####


for level in 2 4 6 8 10
do
    for seed in 1 2 3 4 5
    do
        python -u run_simulation_scp.py --config=ea_balance_${level} --save_data=True --seed=$seed
        python -u run_simulation_propensity.py --config=ea_balance_${level} --save_data=True --seed=$seed
    done
done


#### SCP ####
sigma_arr=( 0 0.1 0.2 0.3 0.41 0.5 0.6 )

for sigma in "${sigma_arr[@]}"
do
  python -u run_ea.py --sigma=${sigma} --config=ea_5_linear > results/ea_sigma_${sigma}.txt
done

# summarize

sigma_arr=( 0 0.1 0.2 0.3 0.41 0.5 0.6 )

rm results/results_ea.txt
for sigma in "${sigma_arr[@]}"
do
    value=`tail -n 1 results/ea_sigma_${sigma}.txt`
    echo "SCP ${sigma} ${value}" >> results/results_ea.txt
done



#### baseline ####
python -u run_ea.py --p=0 --sigma=0 --revert=y --config=ea_5_linear > results/ea_revert.txt


flip_arr=( 0 1 2 3 4 5 )

for flip in "${flip_arr[@]}"
do
    python -u run_simulation_dor.py --ablation=dor-perturb_subset-0 --config=ea_5_linear_${flip} > results/ea_baseline_${flip}.txt
done

# summarize

flip_arr=( 1 2 3 4 5 )
rm results/results_ea_baseline.txt
for flip in "${flip_arr[@]}"
do
    value=`tail -n 1 results/ea_baseline_${flip}.txt`
    echo "FB ${flip} ${value}" >> results/results_ea_baseline.txt
done
cat results/results_ea_baseline.txt

