#!/bin/sh

# Путь к проекту и открытие его в Finder
# open /Volumes/HDD/OpenFOAM/prism/case &
cd /Volumes/HDD/OpenFOAM/prism/case

# Начальные условия
open -a TextMate solved.foam 0/p 0/U 0/k 0/epsilon 0/nut & # 0/f 0/nuTilda 0/v2

# Настройки модели (k-epsilon etc.) 
open -a TextMate constant/transportProperties constant/turbulenceProperties &

# Настройки решателя 
open -a TextMate system/controlDict system/fvSchemes system/fvSolution &

osascript -e 'tell application "Terminal" to quit'
