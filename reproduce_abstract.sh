#!/bin/bash

# Specify the number of threads to use
NUM_THREAD=$1
if [ -z "$1" ]; then
    NUM_THREAD=8
fi
LOCAL_PATH="CIBBConfigurations/Abstract"

mkdir LowCirculation

for n in 01 02 03 04 05 06 07 08 09 10 11 12
do
	mkdir LowCirculation/Scenario$n

	echo "Executing $LOCAL_PATH/Scenario${n}/LowCirculation/Scenario${n}_0.conf $NUM_THREAD..."
	./docker_run.sh $LOCAL_PATH/Scenario${n}/LowCirculation/Scenario${n}_0.conf $NUM_THREAD
	mv Scenario${n}_0 LowCirculation/Scenario${n}

	echo "Executing $LOCAL_PATH/Scenario${n}/LowCirculation/Scenario${n}_10.conf $NUM_THREAD..."
	./docker_run.sh $LOCAL_PATH/Scenario${n}/LowCirculation/Scenario${n}_10.conf $NUM_THREAD
	mv Scenario${n}_10 LowCirculation/Scenario${n}

	echo "Executing $LOCAL_PATH/Scenario${n}/LowCirculation/Scenario${n}_40.conf $NUM_THREAD..."
	./docker_run.sh $LOCAL_PATH/Scenario${n}/LowCirculation/Scenario${n}_40.conf $NUM_THREAD
	mv Scenario${n}_40 LowCirculation/Scenario${n}

	echo "Executing $LOCAL_PATH/Scenario${n}/LowCirculation/Scenario${n}_70.conf $NUM_THREAD..."
	./docker_run.sh $LOCAL_PATH/Scenario${n}/LowCirculation/Scenario${n}_70.conf $NUM_THREAD
	mv Scenario${n}_70 LowCirculation/Scenario${n}
done