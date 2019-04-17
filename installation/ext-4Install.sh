#!/bin/bash
# OpenFOAM-extend-4.0 for Ubuntu 18.04 (https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-4.0)
# to install correct (https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-4.0#Installing_from_source_code)

# Install requied software
sudo apt-get install git-core build-essential binutils-dev cmake flex \
zlib1g-dev qt4-dev-tools libqt4-dev libncurses5-dev \
libxt-dev rpm mercurial graphviz python python-dev  gcc-5 g++-5

mkdir -p $HOME/OpenFOAM # makes OpenFOAM directory

# Download OpenFOAM-extend-4.0
git clone git://git.code.sf.net/p/foam-extend/foam-extend-4.0 $HOME/OpenFOAM/OpenFOAM-extend-4.0\
	 | tee $HOME/OpenFOAM/extend-4.0-install.log
cd $HOME/OpenFOAM/OpenFOAM-extend-4.0/

sed -i -e 's/WM_PROJECT=foam/WM_PROJECT=OpenFOAM/' etc/bashrc

echo "export WM_THIRD_PARTY_USE_BISON_27=1" >> etc/prefs.sh
echo "export QT_SELECT=qt4" >> etc/prefs.sh
echo "export WM_CC='gcc-5'" >> etc/prefs.sh
echo "export WM_CXX='g++-5'" >> etc/prefs.sh
echo "export QT_BIN_DIR=/usr/bin/" >> etc/prefs.sh

# Set the environment variables and add them to initial shell settings
source etc/bashrc && echo "alias fe40='source \$HOME/OpenFOAM/OpenFOAM-extend-4.0/etc/bashrc'" >> $HOME/.bashrc

# Some debugging to manage compilation
sed -i -e 's=rpmbuild --define=rpmbuild --define "_build_id_links none" --define=' ThirdParty/tools/makeThirdPartyFunctionsForRPM
sed -i -e 's/gcc/\$(WM_CC)/' wmake/rules/linux64Gcc/c
sed -i -e 's/g++/\$(WM_CXX)/' wmake/rules/linux64Gcc/c++

# Compiling OpenFOAM-extend-4.0
printf """Compiling OpenFOAM-extend-4.0 what takes a time.
If you want supervise the process – open 'extend-4.0-install.log' file in'$HOME/OpenFOAM/'\n
Compiling is currently running...\n\n"""
fe40 && ./Allwmake.firstInstall <<< "Y" | tee -a $HOME/OpenFOAM/extend-4.0-install.log

printf "OpenFOAM-extend-4.0 INSTALLED.\nChecking the installations...\n"
cd $HOME/OpenFOAM/OpenFOAM-extend-4.0/bin/
foamInstallationTest | tee -a $HOME/OpenFOAM/extend-4.0-installationTest.log


# cd $HOME/OpenFOAM/
# git clone git://git.code.sf.net/p/openfoam-extend/DensityBasedTurbo DensityBasedTurbo
# ./DensityBasedTurbo/src/Allwmake
