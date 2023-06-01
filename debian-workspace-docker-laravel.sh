#!/usr/bin/env bash

# VARIÁVEIS
# Definir variáveis para apps.
APPS_APT_INSTALL=( ufw sudo ssh openssh-client git docker.io docker-compose )
DOCKER_APPS=( 'php:8.1.19-apache-bullseye', 'linuxserver/code-server:latest' )
VSCODE_LIBS=(libc6 libstdc++6 python-minimal ca-certificates tar openssh-server bash curl wget)
LARAVEL_EXAMPLE_APP="$(curl -s "https://laravel.build/example-app?with=mysql,redis" | bash)"

# Capturar IP local.
HOST_IP="$(hostname -I | cut -f1 -d' ')"

# = = = = = = = = = = = = = = = = = = = = = = = = = = =

# DEPENDÊNCIAS
# Elevar privilégio e instalar dependências.
su

# Remover arquivos lock para evitar que o script seja interrompido.
rm /var/lib/dpkg/lock-frontend; rm /var/cache/apt/archives/lock;

apt update && apt upgrade -y
apt install sudo curl ufw ssh openssh-client git docker.io docker-compose apt-utils php-xml libc6 libstdc++6 python-minimal ca-certificates tar openssh-server bash wget -y

# = = = = = = = = = = = = = = = = = = = = = = = = = = =

# FIREWALL
# Configurar regras de firewall.
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22 && sudo ufw allow 80 && sudo ufw allow 8443

# Habilitar firewall.
sudo ufw enable

# = = = = = = = = = = = = = = = = = = = = = = = = = = =

# PERMISSÕES
# Inserir usuário aos grupos necessários.
sudo usermod -aG docker $USER
sudo usermod -aG sudo $USER

# = = = = = = = = = = = = = = = = = = = = = = = = = = =

# SSL
# Gerar SSL auto-assinado.

# = = = = = = = = = = = = = = = = = = = = = = = = = = =

# DOCKER CONFIG
# Configurar Docker e Workspace.
# Habilitar Docker na inicialização do sistema.
systemctl enable docker

# Instalar VSCode Server.
docker run --name vscode -p 8443:8443 -v $HOME/.git:/.git -e DEFAULT_WORKSPACE=/.git linuxserver/code-server:latest

# Alterar propriedade do diretório.
sudo chown $USER:$USER $HOME/.git -R

# Alterar permissões do diretório.
sudo chmod 777 $HOME/.git -R

# Substituir settings.json, pegando raw do GitHub.

# = = = = = = = = = = = = = = = = = = = = = = = = = = =

# FIM

echo "Instalação finalizada com sucesso. Reinicie o dispositivo para que todas as modificações entrem em vigor."

