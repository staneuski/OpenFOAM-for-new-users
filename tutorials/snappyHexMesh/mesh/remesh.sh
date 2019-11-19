#!/bin/sh
#*---------------------------------*- sh -*----------------------------------*#
# =========                 |                                                 #
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           #
#  \\    /   O peration     | Version:  5                                     #
#   \\  /    A nd           | Mail:     stas.stasheuski@gmail.com             #
#    \\/     M anipulation  |                                                 #
#*---------------------------------------------------------------------------*#

# Скрипт для регенерации сетки по уже созданным файлам

rm -r constant/polyMesh
blockMesh
snappyHexMesh -overwrite

# Сигнал об окончании регенерации и запуск ParaView
echo -ne '\007'
# paraview mesh.foam &