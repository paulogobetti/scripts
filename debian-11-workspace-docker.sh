#!/usr/bin/env bash
#
# wget https://raw.githubusercontent.com/paulogobetti/this-is-not-a-repository/main/debian-11-workspace-docker.sh -O /home/$USER/install.sh && chmod +x install.sh && ./install.sh

# Setar variáveis.

LOCAL_IP="$(hostname -I | cut -f1 -d' ')"
USER_PASS="$(date | base64)"
APT_APPS=( ufw ssh openssh-client curl git docker.io docker-compose apt-utils php-xml libc6 libstdc++6 python3-minimal ca-certificates tar openssh-server bash wget )

# Remover potenciais bloqueios ao gerenciador de pacotes.
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

# Atualizar sistema.
sudo apt update && sudo apt upgrade -y

# Instalar dependências e adicionar usuário ao grupo 'docker'.
sudo apt install ufw ssh openssh-client curl git docker.io docker-compose apt-utils php-xml libc6 libstdc++6 python3-minimal ca-certificates tar openssh-server bash wget -y && sudo usermod -aG docker $USER

# Configurar e habilitar firewall.
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22 && sudo ufw allow 80 && sudo ufw allow 8443
sudo ufw enable

# Habilitar Docker na inicialização.
sudo systemctl enable docker

# Criar container do VSCode.
sudo docker run -d --name vscode -p 8443:8443 -v /home/$USER/.git:/.git -e DEFAULT_WORKSPACE=/.git -e PASSWORD=$USER_PASS linuxserver/code-server:latest

# Alterar propriedade do workspace.
sudo chown $USER:$USER /home/$USER/.git -R

# Alterar permissão do workspace.
sudo chmod 777 /home/$USER/.git -R

# Configurar VSCode.
wget https://raw.githubusercontent.com/paulogobetti/this-is-not-a-repository/main/vscode/settings.json -O /home/$USER/settings.json && sudo docker cp /home/$USER/settings.json vscode:/config/data/User/

# Setar IP estático.

# Configurar Git.

echo "Instalação finalizada com sucesso. VSCode em $LOCAL_IP:8443, Senha: $USER_PASS"

