prefix=2021

config_arr=( 0 1 2 3 4 5 6 7 8 9 10 )
for value in "${config_arr[@]}"
do
    config="abl_n_flip_2"
    for ablation in "" oracle_po predict_all_causes
    do
        abl="${ablation}perturb_subset-${value}"
        python -u run_simulation_scp.py --ablation=${abl}  --config=${config} > results${prefix}/scp_${abl}_${config}.txt
    done
done

for value in "${config_arr[@]}"
do
    config="abl_n_flip_2"
    for ablation in "dor"
    do
        abl="${ablation}perturb_subset-${value}"
        python -u run_simulation_dor_ensemble.py --ablation=${abl}  --config=${config} > results${prefix}/scp_${abl}_${config}.txt
    done
done


rm results${prefix}/results_fig4.txt
touch results${prefix}/results_fig4.txt

for val in "${config_arr[@]}"
do
    config="abl_n_flip_2"

    for ablation in "" oracle_po predict_all_causes dor
    do
        abl="${ablation}perturb_subset-${val}"
        value=`tail -n 1 results${prefix}/scp_${abl}_${config}.txt`
        echo "${abl} ${config} ${value}" >> results${prefix}/results_fig4.txt
    done
done

cat results${prefix}/results_fig4.txt
