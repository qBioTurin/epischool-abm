#!/bin/bash
CFG=($(bash sim_setup.sh -m SchoolSEIRModel.nlogo -c $1));
echo -e "Executing...\n\tmkdir ${CFG[1]}"
if ! [ -d "${CFG[1]}" ]; then
	mkdir ${CFG[1]}
fi
echo $1 >> "${CFG[1]}/Configuration.log"
echo -e "Executing...\n\tnetlogo-headless.sh --model ${CFG[0]} --experiment ${CFG[1]} --threads $2"
# It's necessary to specify the path to netlogo-headless.sh here (for example ~/NetLogo6.1.1/netlogo-headless.sh).
netlogo-headless.sh --model ${CFG[0]} --experiment ${CFG[1]} --threads $2