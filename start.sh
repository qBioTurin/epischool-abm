#!/bin/bash
CFG=($(./sim_setup.sh -m SchoolSEIRModel.nlogo -c $1));
echo -e "executing...\n\tmkdir Results${CFG[1]}"
mkdir Results${CFG[1]}
# mkdir ${CFG[1]}
echo -e "Executing...\n\tnetlogo-headless.sh --model ${CFG[0]} --experiment ${CFG[1]} --threads $2"
netlogo-headless.sh --model ${CFG[0]} --experiment ${CFG[1]} --threads $2
