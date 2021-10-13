# run all simulations sequentially
# this will take some time

bash Fig3.sh > Fig3.txt

bash Fig4.sh > Fig4.txt

bash Fig5.sh > Fig5.txt

bash run_one_real.sh
bash summarise_real.sh

bash Fig_app.sh > Fig_app.txt
