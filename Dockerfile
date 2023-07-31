# Base image https://hub.docker.com/u/danielebaccega
FROM danielebaccega/netlogo:611
LABEL maintainer="Daniele Baccega <daniele.baccega@unito.it>"

## Copy files
COPY start.sh .
COPY sim_setup.sh .
COPY read_config.awk .
COPY Utils .
COPY JASSSConfigurations .
COPY SchoolSEIRModel.nlogo .