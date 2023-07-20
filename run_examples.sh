#!/bin/bash

docker pull danielebaccega/netlogo:611

# Specify the number of threads to use
NUM_THREAD=$1
LOCAL_PATH="ExampleOfConfigurationFile"


echo "Executing $LOCAL_PATH/Example1.conf $NUM_THREAD..."
./docker_run.sh $LOCAL_PATH/Example1.conf $NUM_THREAD

echo "Executing $LOCAL_PATH/Example2.conf $NUM_THREAD..."
./docker_run.sh $LOCAL_PATH/Example2.conf $NUM_THREAD