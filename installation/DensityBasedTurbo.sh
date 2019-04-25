#!/bin/bash
# Install DensityBasedTurbo for OpenFOAM-extend-3.0 on Ubuntu 14.04 (https://openfoamwiki.net/index.php/Installation/Linux/foam-extend-3.0)

mkdir -p $FOAM_RUN

# Clone
git clone git://git.code.sf.net/p/openfoam-extend/DensityBasedTurbo $FOAM_RUN/../DensityBasedTurbo

# Copy tools to manage wmake
cd $FOAM_RUN/../DensityBasedTurbo/src
cp -r timeStepping/MRF/* $FOAM_SRC/finiteVolume/cfdTools/general/MRF/

# Install dependences
wmake libso $FOAM_SRC/finiteVolume | tee $HOME/foam/DensityBasedTurbo-install.log

# Install DensityBasedTools
# sed
# +++ transonicMRFFSIDyMFoam/Make/options
# @@ -11,6 +11,7 @@ EXE_INC = \
#      -I$(LIB_SRC)/dynamicMesh/dynamicMesh/lnInclude \
#      -I$(LIB_SRC)/meshTools/lnInclude\
#      $(WM_DECOMP_INC) \
# +    -I$(LIB_SRC)/tetFiniteElement/lnInclude \
#      -I$(LIB_SRC)/tetDecompositionFiniteElement/lnInclude \
#      -I$(LIB_SRC)/tetDecompositionMotionSolver/lnInclude

./Allwmake | tee -a $HOME/foam/DensityBasedTurbo-install.log


