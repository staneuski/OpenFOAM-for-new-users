#!/bin/bash
# OpenFOAM-extend-4.0 for Ubuntu 18.04 (https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-4.0)
# to install correct (https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-4.0#Installing_from_source_code)

cd $HOME/
mkdir foam
cd $HOME/foam
git clone git://git.code.sf.net/p/foam-extend/foam-extend-4.0 foam-extend-4.0\
	 | tee $HOME/foam/extend-4.0-install.log
cd $HOME/foam/foam-extend-4.0

echo export WM_THIRD_PARTY_USE_BISON_27=1  >> etc/prefs.sh
echo export QT_SELECT=qt4  >> etc/prefs.sh
echo "export WM_CC='gcc-5'"  >> etc/prefs.sh
echo "export WM_CXX='g++-5'"  >> etc/prefs.sh
echo "export QT_BIN_DIR=/usr/bin/" >> etc/prefs.sh

source etc/bashrc && echo "alias fe40='source\
	 \$HOME/foam/foam-extend-4.0/etc/bashrc'" >> $HOME/.bashrc

sed -i -e 's=rpmbuild --define=rpmbuild --define "_build_id_links none" --define=' ThirdParty/tools/makeThirdPartyFunctionsForRPM
sed -i -e 's/gcc/\$(WM_CC)/' wmake/rules/linux64Gcc/c
sed -i -e 's/g++/\$(WM_CXX)/' wmake/rules/linux64Gcc/c++

printf """Installing OpenFOAM-extend-4.0 what takes a time.
If you want supervise the process open 'extend-4.0-install.log' file in'$HOME/foam/'\n
Instalation is currently running...\n"""

fe40 && ./Allwmake.firstInstall <<< "Y" | tee $HOME/foam/extend-4.0-install.log

cd $HOME/foam/
git clone git://git.code.sf.net/p/openfoam-extend/DensityBasedTurbo DensityBasedTurbo
./DensityBasedTurbo/src/Allwmake

cd $HOME/foam/foam-extend-4.0/bin/
printf "OpenFOAM-extend-4.0 INSTALLED\n"
printf "Checking the installations...\n"
foamInstallationTest | tee -a $HOME/foam/extend-4.0-installationTest.log
