#!/bin/bash
#------------------------------------------------------------------------------
# =========                 |
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox
#  \\    /   O peration     | Website:  https://github.com/StasF1
#   \\  /    A nd           | Copyright (C) 2019
#    \\/     M anipulation  |
#------------------------------------------------------------------------------
# Script
#     cloneExistingSolver
#
# Description
#     Creates new OpenFOAM solver with new name by copying existing solver from
#	  OpenFOAM application directory
#
#------------------------------------------------------------------------------

newSolverName="mySuperSolver" # name of the new solver

donorName="potentialFoam" # name of the copied/donor solver

donorDir="$FOAM_APP/solvers/basic/$donorName" # directory to the copied/donor solver

# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 

cp -r $donorDir ./ # copying donor solver 
mv $donorName $newSolverName # changing the name of the copied solver folder to the new name

## Change names of files and their contents to the new solver name
cd $newSolverName
mv $donorName.C $newSolverName.C
sed -i "s/$donorName/$newSolverName/g" Make/files
sed -i "s/$donorName/$newSolverName/g" $newSolverName.C

sed -i "s/FOAM_APPBIN/FOAM_USER_APPBIN/g" Make/files # changing path in utility linking files

printf 'Coping and renaming files FINISHED.\n\n'

## Compilating the new solver
printf 'Compilating the solver...\n'
wmake >> compilation-$newSolverName.log
printf 'Compilation of the new solver FINISHED.\n'
echo -ne '\007'

# **************************************************************************



