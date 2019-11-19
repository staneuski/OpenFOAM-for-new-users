#!/bin/sh
#*---------------------------------*- sh -*----------------------------------*#
# =========                 |                                                 #
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           #
#  \\    /   O peration     | Version:  5                                     #
#   \\  /    A nd           | Mail:     stas.stasheuski@gmail.com             #
#    \\/     M anipulation  |                                                 #
#*---------------------------------------------------------------------------*#

# Cкрипт для открытия всех файлов для настройки решателя

# Начальные условия
gedit solved.foam 0/p 0/U 0/k 0/epsilon 0/nut & # 0/f 0/nuTilda 0/v2

# Настройки модели (k-epsilon etc.) 
gedit constant/transportProperties constant/turbulenceProperties &

# Настройки решателя 
gedit system/controlDict system/fvSchemes system/fvSolution &
