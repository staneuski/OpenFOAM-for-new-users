#!/usr/bin/env bash
# OpenFOAM v4.x (https://openfoam.org/download/4-0-ubuntu/)

#$ sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/StasF1/OpenFOAM-for-new-users/master/etc/official-v4x.sh)"

# Add dl.openfoam.org to the list of software repositories
sh -c "wget -O - http://dl.openfoam.org/gpg.key | apt-key add -"
add-apt-repository http://dl.openfoam.org/ubuntu

# Download and install OpenFOAM v4.x
apt-get -y install openfoam4

# Create allias for OpenFOAM v4.x
source /opt/openfoam4/etc/bashrc\
	&& echo "alias of4x='source /opt/openfoam4/etc/bashrc'"\
	>> $HOME/.bashrc