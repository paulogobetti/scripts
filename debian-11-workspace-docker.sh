#!/usr/bin/env bash
#
# wget https://raw.githubusercontent.com/paulogobetti/scripts/main/debian-11-workspace-docker.sh -O /home/$USER/install.sh && chmod +x install.sh && ./install.sh
#
# # # #

LOCAL_IP="$(hostname -I | cut -f1 -d' ')"
USER_PASS="$(date | base64)"
APT_APPS=( ufw ssh openssh-client curl git docker.io docker-compose apt-utils php-xml libc6 libstdc++6 python3-minimal ca-certificates tar openssh-server bash wget )
#NEW_USER_ID="0000"

# Remover potenciais bloqueios ao gerenciador de pacotes.
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

# Atualizar sistema.
sudo apt update && sudo apt upgrade -y

# Add WP-CLI.

# Instalar dependências.
# Adicionar usuário ao grupo 'docker'.
sudo apt install ufw ssh openssh-client curl git docker.io docker-compose apt-utils php-xml libc6 libstdc++6 python3-minimal ca-certificates tar openssh-server bash wget -y && sudo usermod -aG docker $USER

# Configurar e habilitar firewall.
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 8443
sudo ufw enable

# Habilitar Docker na inicialização.
sudo systemctl enable docker

# Criar um usuário sem permissões para gerenciar os containers.
# Capturar PID com >NEW_USER_ID=$(id nomedousuario)

# Gerar certificado SSL auto-gerado (OpenSSL).

# Criar container do VSCode.
# Alterar propriedade do workspace.
# Alterar permissão do workspace.
sudo docker run -d --restart always --name=vscode -e PUID=1000 -e PGID=1000 -e TZ=America/Sao_Paulo -e PASSWORD=$USER_PASS -e DEFAULT_WORKSPACE=/.workspace -p 8443:8443 -v /home/$USER/.workspace:/.workspace linuxserver/code-server:latest && sudo chown $USER:docker /home/$USER/.workspace -R

# Configurar VSCode.
wget https://raw.githubusercontent.com/paulogobetti/scripts/main/.vscode/settings.json -O /home/$USER/settings.json && sudo docker container exec vscode mkdir /config/data/User/ && sudo docker cp /home/$USER/settings.json vscode:/config/data/User/

# Setar IP estático.

# Configurar Git global.
git config --global user.name "Paulo Gobetti"
git config --global user.email "paulogobettig@outlook.com"
git config --global core.editor nano

# Gerar chave SSH.
ssh-keygen -t ed25519 -C "paulogobettig@outlook.com"

# = = = = = =

# Remover arquivos de instalação.
sudo rm /home/$USER/install.sh /home/$USER/sudo.sh /home/$USER/settings.json

# Remover cache deb.

echo "Instalação finalizada com sucesso."
echo "Não se esqueça das chaves SSH e SSL."
echo "Anote sua senha e acesse o VSCode em $LOCAL_IP:8443, Senha: $USER_PASS"
