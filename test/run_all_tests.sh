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

exit 0
