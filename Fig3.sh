prefix=2021

for linear in linear nonlinear
    do
    for setting in  p_outcome_single p_outcome_double n_cause n_confounder sample_size_train
    do
        bash run_one_simulation.sh ${setting} ${linear} ${prefix}
    done
done


mkdir results${prefix}
mkdir results
rm results${prefix}/results_nips.txt
for linear in linear nonlinear
do
     for setting in p_outcome_single p_outcome_double  n_cause n_confounder sample_size_train
    do
        bash summarize_one_simulation.sh ${setting} ${linear} ${prefix}
    done
done

