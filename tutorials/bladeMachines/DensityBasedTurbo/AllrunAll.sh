#!/bin/bash

cd steadyCompressibleFoam/
cd 2bump && ./Allrun
cd ../transonicBump && ./Allrun

cd ../../steadyCompressibleMRFFoam/
cd bentRotorStator/ && ./Allrun
cd ../simpleRotorStator/ && ./Allrun

cd ../../steadyCompressibleSRFFoam/
cd bentBlade/ && ./Allrun
cd ../simpleBlade/ && ./Allrun

cd ../../steadyUniversalMRFFoam
cd axialTurbineGgiJump/ && ./Allrun
cd ../axialTurbineMixingPlane/ && ./Allrun


