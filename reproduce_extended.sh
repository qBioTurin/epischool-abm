#!/bin/bash

docker pull danielebaccega/netlogo:611

# Specify the number of threads to use
NUM_THREAD=$1
LOCAL_PATH="CIBBConfigurations/Extended"

for c in "LowCirculation" "MediumCirculation" "HighCirculation"
do
	mkdir $c

	for n in 01 02 03 04 05 06 07 08 09 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
	do
		mkdir $c/Scenario$n

		echo "Executing $LOCAL_PATH/Scenario${n}/${c}/Scenario${n}_0.conf $NUM_THREAD..."
		./docker_run.sh $LOCAL_PATH/Scenario${n}/${c}/Scenario${n}_0.conf $NUM_THREAD
		mv Scenario${n}_0 $c/Scenario${n}

		echo "Executing $LOCAL_PATH/Scenario${n}/${c}/Scenario${n}_10.conf $NUM_THREAD..."
		./docker_run.sh $LOCAL_PATH/Scenario${n}/${c}/Scenario${n}_10.conf $NUM_THREAD
		mv Scenario${n}_10 $c/Scenario${n}

		echo "Executing $LOCAL_PATH/Scenario${n}/${c}/Scenario${n}_40.conf $NUM_THREAD..."
		./docker_run.sh $LOCAL_PATH/Scenario${n}/${c}/Scenario${n}_40.conf $NUM_THREAD
		mv Scenario${n}_40 $c/Scenario${n}

		echo "Executing $LOCAL_PATH/Scenario${n}/${c}/Scenario${n}_70.conf $NUM_THREAD..."
		./docker_run.sh $LOCAL_PATH/Scenario${n}/${c}/Scenario${n}_70.conf $NUM_THREAD
		mv Scenario${n}_70 $c/Scenario${n}
	done
done