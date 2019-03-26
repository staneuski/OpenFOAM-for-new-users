#!/bin/bash
# OpenFOAM-extend-4.0(https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-4.0)

cd $HOME/
mkdir foam
cd foam
git clone git://git.code.sf.net/p/foam-extend/foam-extend-4.0 foam-extend-4.0\
	 | tee $HOME/foam/extend-4.0-install.log
cd foam-extend-4.0
source etc/bashrc && echo "alias fe40='source\
	 \$HOME/foam/foam-extend-4.0/etc/bashrc'" >> $HOME/.bashrc

printf """Installing OpenFOAM-extend-4.0 what takes a time.
If you want supervise the process open 'extend-4.0-install.log' file in'$HOME/foam/'\n
Instalation is currently running...\n"""
./Allwmake.firstInstall <<< "Y" >> $HOME/foam/extend-4.0-install.log

cd $HOME/foam/foam-extend-4.0/bin/
printf "OpenFOAM-extend-4.0 INSTALLED\n"
printf "Checking the istallations...\n"
foamInstallationTest | tee -a $HOME/foam/extend-4.0-installationTest.log