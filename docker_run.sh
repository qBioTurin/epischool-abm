#!/bin/bash

docker build -t danielebaccega/reproduce-netlogo:611 .
docker run --user $UID:$UID -v $(pwd):/home/docker/netlogo danielebaccega/netlogo:611 /usr/bin/bash -c "/home/docker/netlogo/start.sh ${1} ${2}"