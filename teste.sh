#!/usr/bin/env bash
#
# Require: sudo & wget
#
# echo "$(sudo )"
#

# apt install sudo wget
# wget https://raw.githubusercontent.com/paulogobetti/this-is-not-a-repository/main/teste.sh && chmod +x teste.sh && teste.sh

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update && sudo apt upgrade -y

sudo apt install ufw ssh openssh-client curl git docker.io docker-compose apt-utils php-xml libc6 libstdc++6 python3-minimal ca-certificates tar openssh-server bash wget -y && sudo usermod -aG docker $USER

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22 && sudo ufw allow 80 && sudo ufw allow 8443

sudo ufw enable -y

sudo systemctl enable docker

docker run -d --name vscode -p 8443:8443 -v /home/$USER/.git:/.git -e DEFAULT_WORKSPACE=/.git linuxserver/code-server:latest

sudo chown $USER:$USER /home/$USER/.git -R

sudo chmod 777 /home/$USER/.git -R

echo "Instalação finalizada com sucesso. Reinicie o dispositivo para que todas as modificações entrem em vigor."
