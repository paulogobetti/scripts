#!/usr/bin/env bash

# wget https://raw.githubusercontent.com/paulogobetti/this-is-not-a-repository/main/sudo.sh && chmod +x sudo.sh && ./sudo.sh

rm /var/lib/dpkg/lock-frontend
rm /var/cache/apt/archives/lock

apt install sudo -y && sudo usermod -aG sudo $USER

apt update && apt dist-upgrade -y
apt autoclean
apt autoremove -y

