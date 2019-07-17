#!/usr/bin/env bash
# OpenFOAM v5.x (https://openfoam.org/download/5-0-ubuntu/)

#$ sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/StasF1/OpenFOAM-for-new-users/master/etc/official-v5x.sh)"

# Add dl.openfoam.org to the list of software repositories
sh -c "wget -O - http://dl.openfoam.org/gpg.key | apt-key add -"
add-apt-repository http://dl.openfoam.org/ubuntu

# Download and install OpenFOAM v5.x
apt-get -y install openfoam5

# Create allias for OpenFOAM v5.x
source /opt/openfoam5/etc/bashrc\
	&& echo "alias of5x='source /opt/openfoam5/etc/bashrc'"\
	>> $HOME/.bashrc