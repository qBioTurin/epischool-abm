#!/bin/bash

# Specify the number of threads to use
NUM_THREAD=$1
LOCAL_PATH="JASSSConfigurations"

for n in 01 02 12
do
	echo "Executing $LOCAL_PATH/Scenario${n}/Scenario${n}.conf $NUM_THREAD..."
	./docker_run.sh $LOCAL_PATH/Scenario${n}/Scenario${n}.conf $NUM_THREAD
done

for n in 03 04 05 06 07 08 13 14 15 16 17 18
do
	mkdir Scenario${n}

	echo "Executing $LOCAL_PATH/Scenario${n}/Scenario${n}Monday.conf $NUM_THREAD..."
	./docker_run.sh $LOCAL_PATH/Scenario${n}/Scenario${n}Monday.conf $NUM_THREAD
	mv Scenario${n}Monday Scenario${n}

	echo "Executing $LOCAL_PATH/Scenario${n}/Scenario${n}Tuesday.conf $NUM_THREAD..."
	./docker_run.sh $LOCAL_PATH/Scenario${n}/Scenario${n}Tuesday.conf $NUM_THREAD
	mv Scenario${n}Tuesday Scenario${n}

	echo "Executing $LOCAL_PATH/Scenario${n}/Scenario${n}Wednesday.conf $NUM_THREAD..."
	./docker_run.sh $LOCAL_PATH/Scenario${n}/Scenario${n}Wednesday.conf $NUM_THREAD
	mv Scenario${n}Wednesday Scenario${n}

	echo "Executing $LOCAL_PATH/Scenario${n}/Scenario${n}Thursday.conf $NUM_THREAD..."
	./docker_run.sh $LOCAL_PATH/Scenario${n}/Scenario${n}Thursday.conf $NUM_THREAD
	mv Scenario${n}Thursday Scenario${n}

	echo "Executing $LOCAL_PATH/Scenario${n}/Scenario${n}Friday.conf $NUM_THREAD..."
	./docker_run.sh $LOCAL_PATH/Scenario${n}/Scenario${n}Friday.conf $NUM_THREAD
	mv Scenario${n}Friday Scenario${n}
done

for n in 09 10 11 19 20 21
do
	mkdir Scenario${n}

	echo "Executing $LOCAL_PATH/Scenario${n}/Scenario${n}MondayWednesday.conf $NUM_THREAD..."
	./docker_run.sh $LOCAL_PATH/Scenario${n}/Scenario${n}MondayWednesday.conf $NUM_THREAD
	mv Scenario${n}MondayWednesday Scenario${n}

	echo "Executing $LOCAL_PATH/Scenario${n}/Scenario${n}TuesdayThursday.conf $NUM_THREAD..."
	./docker_run.sh $LOCAL_PATH/Scenario${n}/Scenario${n}TuesdayThursday.conf $NUM_THREAD
	mv Scenario${n}TuesdayThursday Scenario${n}

	echo "Executing $LOCAL_PATH/Scenario${n}/Scenario${n}WednesdayFriday.conf $NUM_THREAD..."
	./docker_run.sh $LOCAL_PATH/Scenario${n}/Scenario${n}WednesdayFriday.conf $NUM_THREAD
	mv Scenario${n}WednesdayFriday Scenario${n}
done