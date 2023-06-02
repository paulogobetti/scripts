#!/usr/bin/env bash
#
#
#
# # # #

APPS_SNAP_REMOVE=( )

APPS_APT_REMOVE=( snapd )

APPS_APT_INSTALL=( )

APPS_FLATPAK_INSTALL=( )

# = = = =

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update && sudo apt upgrade -y

# = = = =

# Pegar última versão do VirtualBox.
wget https://download.virtualbox.org/virtualbox/LATEST-STABLE.TXT && RELEASE_VERSION="$(cat LATEST-STABLE.TXT)" && rm LATEST-STABLE.TXT

DOWNLOAD_LINK="https://download.virtualbox.org/virtualbox/$RELEASE_VERSION/"

mkdir /home/$USER/.tmp

wget -r -np -nH -A "virtualbox-*_$RELEASE_VERSION*Ubuntu~focal_amd64.deb" $DOWNLOAD_LINK -O /home/$USER/.tmp/virtualbox.deb
