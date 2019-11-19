#!/bin/sh
#*---------------------------------*- sh -*----------------------------------*#
# =========                 |                                                 #
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           #
#  \\    /   O peration     | Version:  5                                     #
#   \\  /    A nd           | Mail:     stas.stasheuski@gmail.com             #
#    \\/     M anipulation  |                                                 #
#*---------------------------------------------------------------------------*#

# Скрипт для перезапуска расчёта с нуля

# Копирование файлов начальных условий без изменений из папки Orig

# cp -r 0/Orig/epsilon 0/epsilon
# cp -r 0/Orig/f 0/f
# cp -r 0/Orig/k 0/k
# cp -r 0/Orig/nut 0/nut
# cp -r 0/Orig/nuTilda 0/nuTilda
# cp -r 0/Orig/omega 0/omega
# cp -r 0/Orig/p 0/p
# cp -r 0/Orig/U 0/U
# cp -r 0/Orig/v2 0/v2

# Копирование файлов сетки
cp -r ../mesh/constant/polyMesh constant
refineMesh -overwrite

# Запуск расчёта и запись постпроцессинга
simpleFoam
postProcess -func "patchAverage(p,name=inlet)" -latestTime

# Сигнал об окончании расчёта и запуск ParaView
echo -ne '\007'
# paraview case.foam &
