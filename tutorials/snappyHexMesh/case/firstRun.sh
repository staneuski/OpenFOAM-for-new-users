#!/bin/sh
#*---------------------------------*- sh -*----------------------------------*#
# =========                 |                                                 #
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           #
#  \\    /   O peration     | Version:  5                                     #
#   \\  /    A nd           | Mail:     stas.stasheuski@gmail.com             #
#    \\/     M anipulation  |                                                 #
#*---------------------------------------------------------------------------*#

# Скрипт для запуска расчёта

# Копирование файлов сетки
cp -r ../mesh/constant/polyMesh constant

# Запуск расчёта и запись постпроцессинга
simpleFoam
postProcess -func "patchAverage(p,name=inlet)" -latestTime
echo -ne '\007'
# paraview case.foam &
