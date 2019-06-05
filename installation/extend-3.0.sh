#!/bin/bash
# OpenFOAM-extend-3.0 for Ubuntu 18.04 (https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-3.0#Installing_from_source_code)
# to install correct (https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-3.0/Ubuntu#Ubuntu_14.04)

# Install requied software
sudo apt-get install git-core build-essential binutils-dev cmake flex \ #bison # 2.* required!
zlib1g-dev qt4-dev-tools libqt4-dev libncurses5-dev libiberty-dev \
libxt-dev rpm mercurial graphviz python python-dev gcc-4.8 g++-4.8 <<< "Y"

# Create an additional link
sudo ln -s /usr/bin/make /usr/bin/gmake

# Switch to the old gcc version
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 2
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 2
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 1
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 1
sudo update-alternatives --config gcc <<< "1" && gcc --version
sudo update-alternatives --config g++ <<< "1" && g++ --version

# Download OpenFOAM-extend-3.0
git clone git://git.code.sf.net/p/foam-extend/foam-extend-3.0 $HOME/foam/foam-extend-3.0
cd $HOME/foam/foam-extend-3.0/

# Edit prefs.sh script
echo "export WM_THIRD_PARTY_USE_BISON_27=1" >> etc/prefs.sh
echo "export QT_SELECT=qt4" >> etc/prefs.sh
# echo "export WM_CC='gcc-5'" >> etc/prefs.sh
# echo "export WM_CXX='g++-5'" >> etc/prefs.sh
echo "export QT_BIN_DIR=/usr/bin/" >> etc/prefs.sh

# Set the environment variables and add them to initial shell settings
source $HOME/foam/foam-extend-3.0/etc/bashrc && echo "alias fe30='source \$HOME/foam/foam-extend-3.0/etc/bashrc'" >> $HOME/.bashrc

# Set some preferences
sed -i -e 's=rpmbuild --define=rpmbuild --define "_build_id_links none" --define=' ThirdParty/tools/makeThirdPartyFunctionsForRPM
sed -i -e 's/gcc/\$(WM_CC)/' wmake/rules/linux64Gcc/c
sed -i -e 's/g++/\$(WM_CXX)/' wmake/rules/linux64Gcc/c++

# Compiling OpenFOAM-extend-3.0
source $HOME/foam/foam-extend-3.0/etc/bashrc && $HOME/foam/foam-extend-3.0/./Allwmake.firstInstall <<< "Y" | tee $HOME/foam/extend-3.0-install.log

# Switch back to the default for Ubuntu 18.04 gcc-7
sudo update-alternatives --config gcc <<< "0" && gcc --version
sudo update-alternatives --config g++ <<< "0" && g++ --version

# Checking the installation
foamInstallationTest | tee -a $HOME/foam/extend-3.0-install.log
