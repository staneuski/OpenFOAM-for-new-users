#!/bin/sh
#*---------------------------------*- sh -*----------------------------------*#
# =========                 |                                                 #
# \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           #
#  \\    /   O peration     | Version:  5                                     #
#   \\  /    A nd           | Mail:     stas.stasheuski@gmail.com             #
#    \\/     M anipulation  |                                                 #
#*---------------------------------------------------------------------------*#

# Скрипт для генерации сетки

# Копирование файлов из папки Orig
cd ../geometry/
cp -r Orig/*.stl .

# Масштабирование файлов .stl в intakePipe/geometry/
export FILE="inlet.stl"
surfaceTransformPoints -scale '(0.001 0.001 0.001)' $FILE $FILE
export FILE="outlet.stl"
surfaceTransformPoints -scale '(0.001 0.001 0.001)' $FILE $FILE
export FILE="walls.stl"
surfaceTransformPoints -scale '(0.001 0.001 0.001)' $FILE $FILE

# Генерация сетки
cd ../mesh/
cp ../geometry/*.stl constant/triSurface
surfaceFeatureExtract
blockMesh
snappyHexMesh -overwrite

# Сигнал об окончании генерации и запуск ParaView
echo -ne '\007'
# paraview mesh.foam &
