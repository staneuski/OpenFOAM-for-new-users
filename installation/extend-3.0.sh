#!/bin/bash
# OpenFOAM-extend-3.0 for Ubuntu 14.04 (https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-3.0#Installing_from_source_code)
# to install correct (https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-3.0/Ubuntu#Ubuntu_14.04)

# Install requied software
sudo apt-get install git-core build-essential binutils-dev flex \
bison zlib1g-dev qt4-dev-tools libqt4-dev libncurses5-dev libiberty-dev \
libxt-dev rpm mercurial graphviz <<< "Y"

sudo ln -s /usr/bin/make /usr/bin/gmake # creating an additional link

# Download OpenFOAM-extend-3.0
git clone git://git.code.sf.net/p/foam-extend/foam-extend-3.0 $HOME/foam/foam-extend-3.0
cd $HOME/foam/foam-extend-3.0/

# Set the environment variables and add them to initial shell settings
source $HOME/foam/foam-extend-3.0/etc/bashrc && echo "alias fe30='source \$HOME/foam/foam-extend-3.0/etc/bashrc'" >> $HOME/.bashrc

# Compiling OpenFOAM-extend-3.0
source $HOME/foam/foam-extend-3.0/etc/bashrc && $HOME/foam/foam-extend-3.0/./Allwmake.firstInstall <<< "Y" | tee $HOME/foam/extend-3.0-install.log

# Checking the installation
foamInstallationTest | tee -a $HOME/foam/extend-3.0-install.log
