#!/usr/bin/env bash
#
# Require: sudo & wget
#
# echo "$(sudo )"
#

echo "$(sudo apt update && sudo apt upgrade -y)"

echo "$(sudo apt install ufw ssh openssh-client curl git docker.io docker-compose apt-utils php-xml libc6 libstdc++6 python-minimal ca-certificates tar openssh-server bash wget -y)"

echo "$(sudo usermod -aG docker $USER)"

echo "$(sudo ufw default deny incoming)"
echo "$(sudo ufw default allow outgoing)"
echo "$(sudo ufw allow 22 && sudo ufw allow 80 && sudo ufw allow 8443)"

echo "$(sudo ufw enable)"

echo "$(sudo systemctl enable docker)"

echo "$(docker run --name vscode -p 8443:8443 -v /home/$USER/.git:/.git -e DEFAULT_WORKSPACE=/.git linuxserver/code-server:latest)"

echo "$(sudo chown $USER:$USER /home/$USER/.git -R)"

echo "$(sudo chmod 777 /home/$USER/.git -R)"

echo "Instalação finalizada com sucesso. Reinicie o dispositivo para que todas as modificações entrem em vigor."
