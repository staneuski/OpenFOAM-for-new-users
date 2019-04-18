#!/bin/bash
# OpenFOAM-extend-3.0 for Ubuntu 18.04 (https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-3.0)
# to install correct (https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-3.0#Installing_from_source_code)

# Install requied software
sudo apt-get install git-core build-essential binutils-dev flex \
bison zlib1g-dev qt4-dev-tools libqt4-dev libncurses5-dev libiberty-dev \
libxt-dev rpm mercurial graphviz python python-dev  gcc-5 g++-5 <<< "Y"

sudo ln -s /usr/bin/make /usr/bin/gmake # creating an additional link

# Download OpenFOAM-extend-4.0
git clone git://git.code.sf.net/p/foam-extend/foam-extend-4.0 $HOME/foam/foam-extend-4.0
cd $HOME/foam/foam-extend-3.0/

# Setting some presences
echo "export WM_THIRD_PARTY_USE_BISON_27=1" >> etc/prefs.sh
echo "export QT_SELECT=qt4" >> etc/prefs.sh
echo "export WM_CC='gcc-5'" >> etc/prefs.sh
echo "export WM_CXX='g++-5'" >> etc/prefs.sh
echo "export QT_BIN_DIR=/usr/bin/" >> etc/prefs.sh
# echo "export xxxxx=xxxxx" >> etc/prefs.sh

# Set the environment variables and add them to initial shell settings
source etc/bashrc && echo "alias fe30='source \$HOME/foam/foam-extend-3.0/etc/bashrc'" >> $HOME/.bashrc

# Some debugging to manage compilation
sed -i -e 's=rpmbuild --define=rpmbuild --define "_build_id_links none" --define=' ThirdParty/tools/makeThirdPartyFunctionsForRPM
sed -i -e 's/gcc/\$(WM_CC)/' wmake/rules/linux64Gcc/c
sed -i -e 's/g++/\$(WM_CXX)/' wmake/rules/linux64Gcc/c++

# Compiling OpenFOAM-extend-4.0
fe40 && ./Allwmake.firstInstall <<< "Y" | tee $HOME/foam/extend-3.0-install.log

# Checking the installation
cd $HOME/foam/foam-extend-3.0/bin/
foamInstallationTest | tee $HOME/foam/extend-3.0-installationTest.log
