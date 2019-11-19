#!/usr/bin/env bash
# OpenFOAM v6 (https://openfoam.org/download/6-ubuntu/)

#$ sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/StasF1/OpenFOAM-for-new-users/master/etc/official-v6.sh)"

# Add dl.openfoam.org to the list of software repositories
sh -c "wget -O - http://dl.openfoam.org/gpg.key | apt-key add -"
add-apt-repository http://dl.openfoam.org/ubuntu

# Download and install OpenFOAM v6
apt-get -y install openfoam6

# Create allias for OpenFOAM v6
source /opt/openfoam6/etc/bashrc\
	&& echo "alias of6x='source /opt/openfoam6/etc/bashrc'"\
	>> $HOME/.bashrc