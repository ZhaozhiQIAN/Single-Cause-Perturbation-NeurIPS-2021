cd "$(dirname "$0")/.."  # cd to repo root.
mkdir -p model
mkdir -p results
set +x

prefix=2021

set -x
for linear in linear nonlinear
do
    for setting in  p_outcome_single p_outcome_double n_cause n_confounder sample_size_train
    do
        bash experiments/run_one_simulation.sh ${setting} ${linear} ${prefix}
    done
done


mkdir -p results${prefix}
mkdir -p results
rm results${prefix}/results_nips.txt
for linear in linear nonlinear
do
    for setting in p_outcome_single p_outcome_double  n_cause n_confounder sample_size_train
    do
        bash experiments/summarize_one_simulation.sh ${setting} ${linear} ${prefix}
    done
done
{ set +x; } 2>/dev/null
