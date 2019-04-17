#!/bin/bash
# OpenFOAM-1.6-ext for Ubuntu 18.04 (https://openfoamwiki.net/index.php/Installation/Linux/OpenFOAM-1.6-ext/Ubuntu)

# Install the necessary packages
sudo apt-get install git flex rpm build-essential zlib1g-dev binutils-dev\
	 openmpi-bin libopenmpi-dev cmake libstdc++5 libiberty-dev


# Set-up the base folder where OpenFOAM-1.6-ext will be installed
cd $HOME/
mkdir OpenFOAM
cd $HOME/OpenFOAM
git clone git://git.code.sf.net/p/openfoam-extend/OpenFOAM-1.6-ext\
	 | tee $HOME/OpenFOAM/1.6-ext-preinstall.log


# Checkout the commit associated to 1.6.1, so that the correct 1.6-ext version is used
cd $HOME/foam/OpenFOAM-1.6-ext
git checkout 1.6.1 -b 16ext


# Configure the preferences file
cp etc/prefs.sh-EXAMPLE etc/prefs.sh
 
# Use the system compiler and configure to use Gcc 5.4
echo "export WM_COMPILER=Gcc54" >> etc/prefs.sh
 
# Use the system installation of OpenMPI
sed -i s/"#export WM_MPLIB=SYSTEMOPENMPI"/"export WM_MPLIB=SYSTEMOPENMPI"/g etc/prefs.sh
sed -i s/"#export OPENMPI_DIR=path_to_system_installed_openmpi"/"export OPENMPI_DIR=\/usr"/g etc/prefs.sh
sed -i s/"^#export OPENMPI_BIN_DIR"/"export OPENMPI_BIN_DIR"/g etc/prefs.sh
 
# Use the system's ParaView
sed -i s/"#export PARAVIEW_SYSTEM=1"/"export PARAVIEW_SYSTEM=1"/g etc/prefs.sh
sed -i s/"#export PARAVIEW_DIR=path_to_system_installed_paraview"/"export PARAVIEW_DIR=\/usr"/g etc/prefs.sh
sed -i s/"^#export PARAVIEW_BIN_DIR"/"export PARAVIEW_BIN_DIR"/g etc/prefs.sh
 
echo "export WM_NCOMPPROCS=4" >> etc/prefs.sh # Here you can change 4 to the number of cores you've got


# we'll need to switch to the internal reader for ParaView
sed -i -e 's=\.OpenFOAM=\.foam=' bin/paraFoam
sed -i -e 's/^unset/export LC_ALL=C; unset/' bin/paraFoam
 
# Create a symbolic link for gmake
ln -s /usr/bin/make bin/gmake
 
# disable X dependencies in tecio
sed -i -e 's=\(U_WIN32\)$=\1 -DENGINE=g'\
	 applications/utilities/postProcessing/dataConversion/foamToTecplot360/tecio/tecsrc/Make/tecioOptions
 
# Fix the link for Mesquite
sed -i -e 's=software.sandia.gov/~jakraft=downloads.sourceforge.net/project/openfoam-extend/foam-extend-3.0/ThirdParty=g' \
  ThirdParty/AllMake.stage3 ThirdParty/rpmBuild/SPECS/mesquite-2.1.2.spec
 
# Fix for Flex version detection
find src applications -name "*.L" -type f\
	 | xargs sed -i -e 's=\(YY\_FLEX\_SUBMINOR\_VERSION\)=YY_FLEX_MINOR_VERSION < 6 \&\& \1='

cp -r wmake/rules/linux64Gcc46 wmake/rules/linux64Gcc54 # copy the rules from ''Gcc46'' to ''Gcc54''
 
# due to stricter name lookup rules in GCC 4.8 and newer, we need to tell the compiler to lighten up on this
sed -i 's/^\(c++FLAGS.*\)/\1 -fpermissive/g' wmake/rules/linux64Gcc54/c++


# Activate the environment and save an alias in the personal .bashrc file
source etc/bashrc && echo"alias of16ext='source \$HOME/OpenFOAM/OpenFOAM-1.6-ext/etc/bashrc'" >> $HOME/.bashrc


# Now we need avoid building cmake, so first go into the ThirdParty folder
cd ThirdParty && sed -i 's=^( rpm_make -p cmake=#( rpm_make -p cmake=' AllMake.stage1


# A few fixes are necessary for building some of the third-party applications/libraries
sed -i -e 's/\(\+.*LIBS = \)/\1-Xlinker --add-needed -Xlinker --no-as-needed /' ./rpmBuild/SOURCES/ParMGridGen-1.0.patch
sed -i -e 's/\(\+.*LIBS = \)/\1-Xlinker --add-needed -Xlinker --no-as-needed /' ./rpmBuild/SOURCES/ParMetis-3.1.1.patch
sed -i -e 's=$(LDFLAGS)=$(LDFLAGS) -pthread=' ./rpmBuild/SOURCES/scotch-5.1.10b_patch_0


printf """Preinstalling OpenFOAM-1.6-ext what takes a time (somewhere between 5 and 30 minutes).
If you want supervise the process open '1.6-ext-preinstall.log' file in'$HOME/foam/'\n
Instalation is currently running...\n"""
./AllMake > $HOME/OpenFOAM/1.6-ext-preinstall.log 2>&1
./AllMake | tee -a $HOME/OpenFOAM/1.6-ext-preinstall.log 2>&1


cd ../ && source etc/bashrc # go back to the main folder and update the environment
printf """Installing OpenFOAM-1.6-ext what takes a time (somewhere between 30 minutes and 3-6 hours).
If you want supervise the process open '1.6-ext-install.log' file in'$HOME/foam/'\n
Instalation is currently running...\n"""
./Allwmake > $HOME/OpenFOAM/1.6-ext-install.log 2>&1
./Allwmake | tee $HOME/OpenFOAM/1.6-ext-install.log 2>&1


cd $HOME/OpenFOAM/
git clone git://git.code.sf.net/p/openfoam-extend/DensityBasedTurbo DensityBasedTurbo | tee $HOME/OpenFOAM/1.6-ext-postinstall.log
./DensityBasedTurbo/src/Allwmake | tee -a $HOME/OpenFOAM/1.6-ext-postinstall.log







