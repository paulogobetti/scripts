#!/usr/bin/env bash

# = = = = = = = = = = = = = =	V A R I Á V E I S

APPS_APT_INSTALL=( ufw sudo ssh openssh-client git docker.io docker-compose )
# DOCKER_APPS=( 'php:8.1.19-apache-bullseye' )

VSCODE_LIBS=(libc6 libstdc++6 python-minimal ca-certificates tar openssh-server bash curl wget) 

# = = = = = = = = = = = = = =	S C R I P T

# Adicionar condicional, se su retornar verdadeiro, continuar scrip, se retornar falso, fechar bash.

# Add aqui

# = = = = = = = = = = = = = =	DEPENDÊNCIAS

su
rm /var/lib/dpkg/lock-frontend; rm /var/cache/apt/archives/lock;
apt update && apt upgrade -y
apt install sudo curl ufw ssh openssh-client git docker.io docker-compose apt-utils php-xml libc6 libstdc++6 python-minimal ca-certificates tar openssh-server bash wget -y

# = = = = = = = = = = = = = =	FIREWALL

sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22
sudo ufw allow 80
sudo ufw allow 8443
sudo ufw enable

# Verificar range e setar IP estático (usar algum valor que fica no meio do range disponível).

# Definir usuário padrão no mesmo grupo do Docker.
sudo usermod -aG docker $USER
sudo usermod -aG sudo $USER

# Gerar SSL

# Habilitar Docker na inicialização do sistema.
systemctl enable docker

#docker run --name vscode -p 8443:8443 -v /home/$USER/.git:/.git linuxserver/code-server:latest

docker run --name vscode -p 8443:8443 -v $HOME/.git:/.git -e DEFAULT_WORKSPACE=/.git linuxserver/code-server:latest
#docker run --name vscode -p 8443:8443 -v $HOME/.git:/.git -e DEFAULT_WORKSPACE=/.git -d linuxserver/code-server:latest

# sudo chmod 777 .git

# sudo chown $USER:$USER $HOME/.git -R

sudo chmod 777 $HOME/.git -R

# Editar settings.json, pegando direto do GitHub.

echo "Ok.";







# curl -s "https://laravel.build/example-app?with=mysql,redis" | bash

# docker pull php:8.1.19-apache-bullseye

# docker pull linuxserver/code-server:latest
