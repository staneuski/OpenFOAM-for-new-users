#!/bin/bash
# Personal Ubuntu package: delete unneeded apps
# $ sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/StasF1/OpenFOAM-for-new-users/master/installation/deleteUnneededApps.sh)"

apt remove gnome-mahjongg gnome-mines gnome-sudoku gnome-todo aisleriot cheese  <<< "Y" #default (gnome) games & apps
apt purge ubuntu-web-launchers <<< "Y" #Amazon & some web-apps
apt remove unity-lens-photos <<< "Y" #Photos lens for Unity
apt-get purge --auto-remove shotwell <<< "Y" #Shotwell
apt-get purge --auto-remove remmina <<< "Y" #Remmina
apt-get purge --auto-remove transmission-gtk <<< "Y" #Transmission
apt-get purge --auto-remove simple-scan <<< "Y" #Simple Scan

# Firefox
apt-get purge firefox <<< "Y"
rm -r /etc/firefox/
rm -r /usr/lib/firefox/
rm -r usr/lib/firefox-addons/

# Warning! Maybe needed things!
apt-get purge --auto-remove rhythmbox <<< "Y" #Rhythmbox
apt-get purge --auto-remove thunderbird <<< "Y" #Thunderbird
apt-get remove --purge libreoffice* <<< "Y" #LibreOffice

apt-get clean
apt-get autoremove

# *****************************************************************

















