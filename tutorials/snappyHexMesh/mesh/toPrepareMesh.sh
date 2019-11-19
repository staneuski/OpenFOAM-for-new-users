#!/bin/sh
#*---------------------------------*- sh -*----------------------------------*#
# =========                 |                                                 #
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           #
#  \\    /   O peration     | Version:  5                                     #
#   \\  /    A nd           | Mail:     stas.stasheuski@gmail.com             #
#    \\/     M anipulation  |                                                 #
#*---------------------------------------------------------------------------*#

# Открытие словарей для настройки параметров разбиения сетки и скриптов для её генерации
gedit system/blockMeshDict system/surfaceFeatureExtractDict system/snappyHexMeshDict firstMesh.sh remesh.sh hardRemesh.sh system/meshQualityDict &
