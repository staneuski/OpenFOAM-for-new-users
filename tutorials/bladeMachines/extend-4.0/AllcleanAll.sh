#!/bin/bash

cd steadyCompressibleFoam/
cd 2bump && ./Allclean
cd ../transonicBump && ./Allclean

cd ../../steadyCompressibleMRFFoam/
cd bentRotorStator/ && ./Allclean
cd ../simpleRotorStator/ && ./Allclean

cd ../../steadyCompressibleSRFFoam/
cd bentBlade/ && ./Allclean
cd ../simpleBlade/ && ./Allclean

cd ../../steadyUniversalMRFFoam
cd axialTurbineGgiJump/ && ./Allclean
cd ../axialTurbineMixingPlane/ && ./Allclean
