#!/usr/bin/env bash
# OpenFOAM 6 (https://openfoam.org/download/6-ubuntu/)
# $ sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/StasF1/OpenFOAM-for-new-users/master/installation/official-6.sh)"

apt-get -y install openfoam6
printf "\nsource /opt/openfoam6/etc/bashrc" >> ~/.bashrc
