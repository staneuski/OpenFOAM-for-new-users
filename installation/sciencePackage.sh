#!/bin/bash
# Personal Ubuntu package: install needed apps
# Before running add new theme to the termanal by copying the existing one
# $ sudo bash -c "$(wget -qO- https://raw.githubusercontent.com/StasF1/OpenFOAM-for-new-users/master/installation/sciencePackage.sh)"

# Installing features
# ~~~~~~~~~~~~~~~~~~~

# Delete "Logout", "Reboot" & "Shutdown" buttons from GNOME shell app list
apt purge session-shortcuts <<< "Y"

# Disable screen lock
gsettings set org.gnome.desktop.session idle-delay 0
gsettings set org.gnome.desktop.screensaver lock-enabled false

# Samba
apt-get update
apt-get install samba <<< "Y"
smbpasswd -a $USER <<< "1950"
chown stas $HOME/

#Python Science Package
apt-get install gnuplot python-numpy python-scipy python-matplotlib ipython\
	jupyter-notebook python-pandas python-sympy python-nose <<< "Y"

# Appearance
apt install git <<< "Y" #git
apt install curl <<< "Y" #curl
apt-get install tweaks <<< "Y" #Gnome Tweak Tools
apt-get install gtk2-engines-murrine gtk2-engines-pixbuf #gtk2 for themes
git clone https://github.com/vinceliuice/Mojave-gtk-theme $HOME/./themes #macOS themes (https://github.com/vinceliuice/Mojave-gtk-theme)
cd ./themes && ./install.sh
# curl -L https://github.com/hbin/top-programming-fonts/raw/master/install.sh | bash #Fonts

# Move to the left ‘Min, Max, Close’ buttons
gsettings set org.gnome.desktop.wm.preferences button-layout ‘close,close,maximize,minimize:’

bash -c "$(wget -qO- https://git.io/vQgMr)" <<< "144" #Terminal theme (144-Solarized Dark)


# Installing apps
# ~~~~~~~~~~~~~~~

cd $HOME

# Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm -r ~/google-chrome-stable_current_amd64.deb

# *****************************************************************

















