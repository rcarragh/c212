#!/bin/bash


H=`pwd`

echo "#####################################"
echo "Checking error.control...."
cd $H/error_control/

./check.sh >/dev/null 2>&1
if [ $? -ne 0 ]
then
	echo "error.control...FAILED <----"
else
echo "error.control...PASSED"
fi


echo "#####################################"
echo "Checking c212.1a...."

cd $H/c212.1a/changed_parameters 
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.1a(1)...FAILED <----"
else
echo "c212.1a(1)...PASSED"
fi


cd $H/c212.1a/default_parameters/ 
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.1a(2)...FAILED <----"
else
echo "c212.1a(2)...PASSED"
fi

cd $H/c212.1a/initial_values/ >/dev/null
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.1a(3)...FAILED <----"
else
echo "c212.1a(3)...PASSED"
fi


cd $H/c212.1a/single_chain/ >/dev/null
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.1a(4)...FAILED <----"
else
echo "c212.1a(4)...PASSED"
fi


cd $H/c212.1a/changed_global_params/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.1a(5)...FAILED <----"
else
echo "c212.1a(5)...PASSED"
fi


echo "#####################################"

echo "#####################################"
echo "Checking c212.BB...."

cd $H/c212.BB/changed_global_sim_params/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.BB(1)...FAILED <----"
else
echo "c212.BB(1)...PASSED"
fi


cd $H/c212.BB/changed_individual_sim_params/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.BB(2)...FAILED <----"
else
echo "c212.BB(2)...PASSED"
fi


cd $H/c212.BB/changed_pm_weights/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.BB(3)...FAILED <----"
else
echo "c212.BB(3)...PASSED"
fi


cd $H/c212.BB/default_parameters/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.BB(4)...FAILED <----"
else
echo "c212.BB(4)...PASSED"
fi

cd $H/c212.BB/initial_values/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.BB(5)...FAILED <----"
else
echo "c212.BB(5)...PASSED"
fi

cd $H/c212.BB/single_chain/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.BB(6)...FAILED <----"
else
echo "c212.BB(6)...PASSED"
fi


echo "#####################################"
echo "Checking c212.1a.interim...."

cd $H/c212.1a.interim/changed_parameters
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.1a.interim(1)...FAILED <----"
else
echo "c212.1a.interim(1)...PASSED"
fi


cd $H/c212.1a.interim/default_parameters
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.1a.interim(2)...FAILED <----"
else
echo "c212.1a.interim(2)...PASSED"
fi


cd $H/c212.1a.interim/initial_values/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.1a.interim(3)...FAILED <----"
else
echo "c212.1a.interim(3)...PASSED"
fi


cd $H/c212.1a.interim/single_chain/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.1a.interim(4)...FAILED <----"
else
echo "c212.1a.interim(4)...PASSED"
fi


echo "#####################################"
echo "Checking c212.BB.interim...."

cd $H/c212.BB.interim/changed_pm_weights/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.BB.interim(1)...FAILED <----"
else
echo "c212.BB.interim(1)...PASSED"
fi



cd $H/c212.BB.interim/changed_sim_params/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.BB.interim(2)...FAILED <----"
else
echo "c212.BB.interim(2)...PASSED"
fi



cd $H/c212.BB.interim/default_parameters/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.BB.interim(3)...FAILED <----"
else
echo "c212.BB.interim(3)...PASSED"
fi


cd $H/c212.BB.interim/initial_values/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.BB.interim(4)...FAILED <----"
else
echo "c212.BB.interim(4)...PASSED"
fi

cd $H/c212.BB.interim/single_chain/
./check_test.sh
if [ $? -ne 0 ]
then
	echo "c212.BB.interim(5)...FAILED <----"
else
echo "c212.BB.interim(5)...PASSED"
fi



exit 0
