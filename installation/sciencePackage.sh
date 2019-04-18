#!/bin/bash
# Personal Ubuntu package: install needed apps
# Before running add new theme to the termanal by copying the existing one

# Installing features
# ~~~~~~~~~~~~~~~~~~~

# Delete "Logout", "Reboot" & "Shutdown" buttons from GNOME shell app list
sudo apt purge session-shortcuts <<< "Y"

# Disable screen lock
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false

# Samba
sudo apt-get update
sudo apt-get install samba <<< "Y"
sudo smbpasswd -a user
sudo chown stas /opt <<< "1950"

sudo apt-get install gnuplot python-numpy python-scipy python-matplotlib ipython\
	jupyter-notebook python-pandas python-sympy python-nose <<< "Y" #Python Science Package

sudo apt install git <<< "Y" #git
sudo apt install curl <<< "Y" #curl
sudo apt-get install gnome-tweak-tool <<< "Y" #Gnome Tweak Tools
sudo apt-get install unity-tweak-tool <<< "Y" #Unity Tweak Tools
sudo apt-get install gtk2-engines-murrine gtk2-engines-pixbuf #gtk2 for themes
git clone https://github.com/vinceliuice/Mojave-gtk-theme $HOME/./themes #macOS themes (https://github.com/vinceliuice/Mojave-gtk-theme)
cd ./themes && ./install.sh
curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash #Fonts

# Move to the left ‘Min, Max, Close’ buttons
gsettings set org.gnome.desktop.wm.preferences button-layout ‘close,close,maximize,minimize:’

bash -c "$(wget -qO- https://git.io/vQgMr)" <<< "141" #Terminal theme (141-Solarized Dark)


# Installing apps
# ~~~~~~~~~~~~~~~

cd ~/ #Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo rm -r ~/google-chrome-stable_current_amd64.deb

# *****************************************************************

















