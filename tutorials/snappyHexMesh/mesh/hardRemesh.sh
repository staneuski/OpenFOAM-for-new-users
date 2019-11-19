#!/bin/sh
#*---------------------------------*- sh -*----------------------------------*#
# =========                 |                                                 #
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           #
#  \\    /   O peration     | Version:  5                                     #
#   \\  /    A nd           | Mail:     stas.stasheuski@gmail.com             #
#    \\/     M anipulation  |                                                 #
#*---------------------------------------------------------------------------*#

# Скрипт для генерации сетки заново с копированием файлов геометрии
cp -r ../geometry/Orig/*.stl ../geometry/

# Удаление ВСЕХ файлов созданных при предыдущем разбиении сетки
rm -r constant/extendedFeatureEdgeMesh
rm -r constant/polyMesh
rm -r constant/triSurface/*
rm -r ../geometry/*.stl

# Генерация сетки с нуля
sh firstMesh.sh
