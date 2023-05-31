#!/usr/bin/env bash

# = = = = = = = = = = = = = =	V A R I Á V E I S

APPS_APT_INSTALL=( ufw sudo ssh openssh-client git docker.io docker-compose )
# DOCKER_APPS=( 'php:8.1.19-apache-bullseye' )

# = = = = = = = = = = = = = =	S C R I P T

# Adicionar condicional, se su retornar verdadeiro, continuar scrip, se retornar falso, fechar bash.

# Add aqui

# Instalar dependências.

su

rm /var/lib/dpkg/lock-frontend; rm /var/cache/apt/archives/lock;

apt update && apt-upgrade -y

apt install sudo ufw ssh openssh-client git docker.io docker-compose -y

# Configurar firewall.

sudo ufw default deny incoming

sudo ufw default allow outgoing

sudo ufw allow 22

sudo ufw allow 80

sudo ufw enable

# Verificar range e setar IP estático (usar algum valor que fica no meio do range disponível).

# Imagens Docker.

# docker pull php:8.1.19-apache-bullseye

