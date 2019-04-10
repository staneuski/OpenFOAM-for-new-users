#!/bin/bash
# Personal Ubuntu package: delete unneeded apps & install needed
# Before running add new theme to the termanal by copying the existing one

# Deleting unneeded apps

sudo apt remove gnome-mahjongg gnome-mines gnome-sudoku gnome-todo aisleriot cheese  <<< "Y" #default (gnome) games & apps
sudo apt purge ubuntu-web-launchers <<< "Y" #Amazon & some web-apps
sudo apt remove unity-lens-photos <<< "Y" #Photos lens for Unity
sudo apt-get purge --auto-remove shotwell <<< "Y" #Shotwell
sudo apt-get purge --auto-remove remmina <<< "Y" #Remmina
sudo apt-get purge --auto-remove transmission-gtk <<< "Y" #Transmission
sudo apt-get purge --auto-remove simple-scan <<< "Y" #Simple Scan

# Hide "Logout", "Reboot" & "Shutdown" buttons from GNOME shell app list
sudo apt purge session-shortcuts <<< "Y" # completely delete them

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

# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

# Installing features

# Disable screen lock
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false

# Samba
sudo apt-get update
sudo apt-get install samba <<< "Y"
sudo smbpasswd -a user
sudo chown stas /opt <<< "1950"

sudo apt-get install python-numpy python-scipy python-matplotlib ipython\
	jupyter-notebook python-pandas python-sympy python-nose <<< "Y" #Python Science Package

sudo apt install git <<< "Y" #git
sudo apt install curl <<< "Y" #curl
sudo apt-get install gnome-tweak-tool <<< "Y" #Gnome Tweak Tools
sudo apt-get install unity-tweak-tool <<< "Y" #Unity Tweak Tools
sudo apt-get install gtk2-engines-murrine gtk2-engines-pixbuf #gtk2 for themes
git clone https://github.com/vinceliuice/Mojave-gtk-theme $HOME/./themes #macOS themes (https://github.com/vinceliuice/Mojave-gtk-theme)
cd ./themes && install.sh
curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash #Fonts

# Move to the left ‘Min, Max, Close’ buttons
gsettings set org.gnome.desktop.wm.preferences button-layout ‘close,close,maximize,minimize:’

bash -c "$(wget -qO- https://git.io/vQgMr)" <<< "141" #Terminal theme (141-Solarized Dark)

# * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

# Installing apps

cd ~/ #Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm -r ~/google-chrome-stable_current_amd64.deb

# *****************************************************************

















