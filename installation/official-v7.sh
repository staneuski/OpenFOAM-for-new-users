#!/usr/bin/env bash
# OpenFOAM v7 (https://openfoam.org/download/7-ubuntu/)

#$ sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/StasF1/OpenFOAM-for-new-users/master/installation/official-v7.sh)"

# Add dl.openfoam.org to the list of software repositories
sh -c "wget -O - http://dl.openfoam.org/gpg.key | apt-key add -"
add-apt-repository http://dl.openfoam.org/ubuntu

# Download and install OpenFOAM v7
apt-get -y install openfoam7

# Create allias for OpenFOAM v7
source /opt/openfoam7/etc/bashrc\
	&& echo "alias of7x='source /opt/openfoam7/etc/bashrc'"\
	>> $HOME/.bashrc