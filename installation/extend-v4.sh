#!/bin/bash
# OpenFOAM-extend-4.0 for Ubuntu 18.04 (https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-4.0)
# to install correct (https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-4.0#Installing_from_source_code)
# $ sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/StasF1/OpenFOAM-for-new-users/master/installation/extend-v4.sh)"

# Install requied software
apt-get install git-core build-essential binutils-dev cmake flex \
zlib1g-dev qt4-dev-tools libqt4-dev libncurses5-dev \
libxt-dev rpm mercurial graphviz python python-dev  gcc-5 g++-5 <<< "Y"

# Download OpenFOAM-extend-4.0
git clone git://git.code.sf.net/p/foam-extend/foam-extend-4.0 $HOME/foam/foam-extend-4.0
cd $HOME/foam/foam-extend-4.0/

# Setting some preferences
echo "export WM_THIRD_PARTY_USE_BISON_27=1" >> etc/prefs.sh
echo "export QT_SELECT=qt4" >> etc/prefs.sh
echo "export WM_CC='gcc-5'" >> etc/prefs.sh
echo "export WM_CXX='g++-5'" >> etc/prefs.sh
echo "export QT_BIN_DIR=/usr/bin/" >> etc/prefs.sh

# Set the environment variables and add them to initial shell settings
source $HOME/foam/foam-extend-4.0/etc/bashrc && echo "alias fe40='source \$HOME/foam/foam-extend-4.0/etc/bashrc'" >> $HOME/.bashrc

# Some debugging to manage compilation
sed -i -e 's=rpmbuild --define=rpmbuild --define "_build_id_links none" --define=' ThirdParty/tools/makeThirdPartyFunctionsForRPM
sed -i -e 's/gcc/\$(WM_CC)/' wmake/rules/linux64Gcc/c
sed -i -e 's/g++/\$(WM_CXX)/' wmake/rules/linux64Gcc/c++

# Compiling OpenFOAM-extend-4.0
source $HOME/foam/foam-extend-4.0/etc/bashrc && $HOME/foam/foam-extend-4.0/./Allwmake.firstInstall <<< "Y" | tee $HOME/foam/extend-4.0-install.log

# Checking the installation
foamInstallationTest | tee -a $HOME/foam/extend-4.0-install.log
