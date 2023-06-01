#!/usr/bin/env bash

# wget https://raw.githubusercontent.com/paulogobetti/this-is-not-a-repository/main/sudo.sh && chmod +x sudo.sh && ./sudo.sh

rm /var/lib/dpkg/lock-frontend -y
rm /var/cache/apt/archives/lock -y

apt install sudo -y & sudo usermod -aG sudo $USER

TESTE="$(whoami)" && echo $TESTE

exit

TESTE="$(whoami)" && echo $TESTE

