#!/bin/sh

# Путь к проекту и открытие его в Finder
# open /Volumes/HDD/OpenFOAM/prism/mesh &

# Открытие словарей для настройки параметров разбиения сетки и скриптов для её генерации
cd /Volumes/HDD/OpenFOAM/prism/mesh
open -a TextMate mesh.foam system/blockMeshDict system/surfaceFeatureExtractDict system/snappyHexMeshDict firstMesh.sh remesh.sh hardRemesh.sh system/meshQualityDict &


osascript -e 'tell application "Terminal" to quit'
