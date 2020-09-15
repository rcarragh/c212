#!/bin/bash

diff test/bh.10.dat baseline/bh.10.dat
if [ $? -ne 0 ]
then
	echo test - bh.10
	exit 1
fi
diff test/bh.dat baseline/bh.dat
if [ $? -ne 0 ]
then
	echo test - bh
	exit 1
fi
diff test/bonf.10.dat baseline/bonf.10.dat
if [ $? -ne 0 ]
then
	echo test - bonf.10
	exit 1
fi
diff test/bonf.dat baseline/bonf.dat
if [ $? -ne 0 ]
then
	echo test - bonf
	exit 1
fi
diff test/dfdr.10.dat baseline/dfdr.10.dat
if [ $? -ne 0 ]
then
	echo test - dfdr.10
	exit 1
fi
diff test/dfdr.dat baseline/dfdr.dat
if [ $? -ne 0 ]
then
	echo test - dfdr
	exit 1
fi
diff test/gbh.10.dat baseline/gbh.10.dat
if [ $? -ne 0 ]
then
	echo test - gbh.10
	exit 1
fi
diff test/gbh.dat baseline/gbh.dat
if [ $? -ne 0 ]
then
	echo test - gbh
	exit 1
fi
diff test/noadj.10.dat baseline/noadj.10.dat
if [ $? -ne 0 ]
then
	echo test - noadj.10
	exit 1
fi
diff test/noadj.dat baseline/noadj.dat
if [ $? -ne 0 ]
then
	echo test - noadj
	exit 1
fi
diff test/ssbh.10.dat baseline/ssbh.10.dat
if [ $? -ne 0 ]
then
	echo test - ssBH.10
	exit 1
fi
diff test/ssbh.dat baseline/ssbh.dat
if [ $? -ne 0 ]
then
	echo test - ssBH
	exit 1
fi
