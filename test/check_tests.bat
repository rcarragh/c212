#!/bin/bash


echo "#####################################"
echo "Checking errorcontrol...."
cd error_control/
CALL check_test.bat
cd ..


echo "#####################################"
echo "Checking c2121a...."

cd c2121a/changed_parameters 
CALL check_test.bat
cd ../..


cd c2121a/default_parameters/ 
CALL check_test.bat
cd ../..

cd c2121a/initial_values/ >/dev/null
CALL check_test.bat
cd ../..


cd c2121a/single_chain/ >/dev/null
CALL check_test.bat
cd ../..


cd c2121a/changed_global_params/
CALL check_test.bat
cd ../..


echo "#####################################"

echo "#####################################"
echo "Checking c212BB...."

cd c212BB/changed_global_sim_params/
CALL check_test.bat
cd ../..


cd c212BB/changed_individual_sim_params/
CALL check_test.bat
cd ../..


cd c212BB/changed_pm_weights/
CALL check_test.bat
cd ../..


cd c212BB/default_parameters/
CALL check_test.bat
cd ../..

cd c212BB/initial_values/
CALL check_test.bat
cd ../..

cd c212BB/single_chain/
CALL check_test.bat
cd ../..


echo "#####################################"
echo "Checking c2121a.interim...."

cd c2121a.interim/changed_parameters
CALL check_test.bat
cd ../..

cd c2121a.interim/default_parameters
CALL check_test.bat
cd ../..

cd c2121a.interim/initial_values/
CALL check_test.bat
cd ../..

cd c2121a.interim/single_chain/
CALL check_test.bat
cd ../..

echo "#####################################"
echo "Checking c212BB.interim...."

cd c212BB.interim/changed_pm_weights/
CALL check_test.bat
cd ../..

cd c212BB.interim/changed_sim_params/
CALL check_test.bat
cd ../..

cd c212BB.interim/default_parameters/
CALL check_test.bat
cd ../..

cd c212BB.interim/initial_values/
CALL check_test.bat
cd ../..

cd /c212BB.interim/single_chain/
/CALL check_test.bat
cd ../..
