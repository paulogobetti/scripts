#!/usr/bin/env bash
#
# wget https://raw.githubusercontent.com/paulogobetti/this-is-not-a-repository/main/debian-11-workspace-docker.sh -O /home/$USER/install.sh && chmod +x install.sh && ./install.sh

LOCAL_IP="$(hostname -I | cut -f1 -d' ')"

sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

sudo apt update && sudo apt upgrade -y

sudo apt install ufw ssh openssh-client curl git docker.io docker-compose apt-utils php-xml libc6 libstdc++6 python3-minimal ca-certificates tar openssh-server bash wget -y && sudo usermod -aG docker $USER

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22 && sudo ufw allow 80 && sudo ufw allow 8443

sudo ufw enable

sudo systemctl enable docker

sudo docker run -d --name vscode -p 8443:8443 -v /home/$USER/.git:/.git -e DEFAULT_WORKSPACE=/.git linuxserver/code-server:latest

sudo chown $USER:$USER /home/$USER/.git -R

sudo chmod 777 /home/$USER/.git -R

wget https://raw.githubusercontent.com/paulogobetti/this-is-not-a-repository/main/vscode/settings.json && sudo docker cp /home/$USER/settings.json vscode:/config/data/User/

# Substituir settings.json.

# Setar IP estático.

echo "Instalação finalizada com sucesso. VSCode em $LOCAL_IP:8443."

