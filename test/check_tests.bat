echo "#####################################"
echo "Checking errorcontrol...."
cd error_control/
CALL check_test.bat
cd..


echo "#####################################"
echo "Checking c212.1a...."

cd c212.1a/changed_parameters 
CALL check_test.bat
cd../..


cd c212.1a/default_parameters/ 
CALL check_test.bat
cd../..

cd c212.1a/initial_values/
CALL check_test.bat
cd../..


cd c212.1a/single_chain/
CALL check_test.bat
cd../..


cd c212.1a/changed_global_params/
CALL check_test.bat
cd../..


echo "#####################################"

echo "#####################################"
echo "Checking c212.BB...."

cd c212.BB/changed_global_sim_params/
CALL check_test.bat
cd../..


cd c212.BB/changed_individual_sim_params/
CALL check_test.bat
cd../..


cd c212.BB/changed_pm_weights/
CALL check_test.bat
cd../..


cd c212.BB/default_parameters/
CALL check_test.bat
cd../..

cd c212.BB/initial_values/
CALL check_test.bat
cd../..

cd c212.BB/single_chain/
CALL check_test.bat
cd../..


echo "#####################################"
echo "Checking c212.1a.interim...."

cd c212.1a.interim/changed_parameters
CALL check_test.bat
cd../..

cd c212.1a.interim/default_parameters
CALL check_test.bat
cd../..

cd c212.1a.interim/initial_values/
CALL check_test.bat
cd../..

cd c212.1a.interim/single_chain/
CALL check_test.bat
cd../..

echo "#####################################"
echo "Checking c212.BB.interim...."

cd c212.BB.interim/changed_pm_weights/
CALL check_test.bat
cd../..

cd c212.BB.interim/changed_sim_params/
CALL check_test.bat
cd../..

cd c212.BB.interim/default_parameters/
CALL check_test.bat
cd../..

cd c212.BB.interim/initial_values/
CALL check_test.bat
cd../..

cd /c212.BB.interim/single_chain/
/CALL check_test.bat
cd../..
