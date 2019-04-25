#!/bin/bash
# Personal Ubuntu package: delete unneeded apps
# $ bash -c "$(wget -qO- https://raw.githubusercontent.com/StasF1/OpenFOAM-for-new-users/master/installation/deleteUnneededApps.sh)"

sudo apt remove gnome-mahjongg gnome-mines gnome-sudoku gnome-todo aisleriot cheese  <<< "Y" #default (gnome) games & apps
sudo apt purge ubuntu-web-launchers <<< "Y" #Amazon & some web-apps
sudo apt remove unity-lens-photos <<< "Y" #Photos lens for Unity
sudo apt-get purge --auto-remove shotwell <<< "Y" #Shotwell
sudo apt-get purge --auto-remove remmina <<< "Y" #Remmina
sudo apt-get purge --auto-remove transmission-gtk <<< "Y" #Transmission
sudo apt-get purge --auto-remove simple-scan <<< "Y" #Simple Scan

# Firefox
sudo apt-get purge firefox <<< "Y"
sudo rm -r /etc/firefox/
sudo rm -r /usr/lib/firefox/
sudo rm -r usr/lib/firefox-addons/

# Warning! Maybe needed things!
sudo apt-get purge --auto-remove rhythmbox <<< "Y" #Rhythmbox
sudo apt-get purge --auto-remove thunderbird <<< "Y" #Thunderbird
sudo apt-get remove --purge libreoffice* <<< "Y" #LibreOffice

sudo apt-get clean
sudo apt-get autoremove

# *****************************************************************

















