# Base image https://hub.docker.com/u/danielebaccega
FROM danielebaccega/netlogo:611
LABEL maintainer="Daniele Baccega <daniele.baccega@unito.it>"

## Copy files
COPY start.sh /home/docker/netlogo/start.sh
COPY sim_setup.sh /home/docker/netlogo/sim_setup.sh
COPY read_config.awk /home/docker/netlogo/read_config.awk
COPY Utils /home/docker/netlogo/Utils
COPY JASSSConfigurations /home/docker/netlogo/JASSSConfigurations
COPY SchoolSEIRModel.nlogo /home/docker/netlogo/SchoolSEIRModel.nlogo