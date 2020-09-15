#!/bin/bash

cd ./error_control/
./cleanup.sh
./run.sh
cd -

cd ./c212.1a/changed_global_params
./cleanup.sh
./run.sh
cd -

cd ./c212.1a/changed_parameters
./cleanup.sh
./run.sh
cd -

cd ./c212.1a/default_parameters/
./cleanup.sh
./run.sh
cd -

cd ./c212.1a/initial_values
./cleanup.sh
./run.sh
cd -

cd ./c212.1a/single_chain
./cleanup.sh
./run.sh
cd -

cd ./c212.BB/changed_global_sim_params/
./cleanup.sh
./run.sh
cd -

cd ./c212.BB/changed_individual_sim_params/
./cleanup.sh
./run.sh
cd -

cd ./c212.BB/changed_pm_weights/
./cleanup.sh
./run.sh
cd -

cd ./c212.BB/default_parameters/
./cleanup.sh
./run.sh
cd -

cd ./c212.BB/initial_values/
./cleanup.sh
./run.sh
cd -

cd ./c212.BB/single_chain/
./cleanup.sh
./run.sh
cd -

cd ./c212.1a.interim/changed_parameters/
./cleanup.sh
./run.sh
cd -

cd ./c212.1a.interim/default_parameters/
./cleanup.sh
./run.sh
cd -

cd ./c212.1a.interim/initial_values/
./cleanup.sh
./run.sh
cd -

cd ./c212.1a.interim/single_chain/
./cleanup.sh
./run.sh
cd -


cd ./c212.BB.interim/changed_pm_weights/
./cleanup.sh
./run.sh
cd -

cd ./c212.BB.interim/changed_sim_params/
./cleanup.sh
./run.sh
cd -

cd ./c212.BB.interim/default_parameters/
./cleanup.sh
./run.sh
cd -

cd ./c212.BB.interim/initial_values/
./cleanup.sh
./run.sh
cd -

cd ./c212.BB.interim/single_chain/
./cleanup.sh
./run.sh
cd -

