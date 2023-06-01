#!/usr/bin/env bash

# = = = = = = = = = = = = = = V A R I Á V E I S = = = = = = = = = = = = = = #

APPS_APT_INSTALL=( ufw git sudo docker.io docker-compose )

# = = = = = = = = = = = = = = S C R I P T = = = = = = = = = = = = = = #

# Adicionar condicional, se su retornar verdadeiro, continuar scrip, se retornar falso, fechar bash.

su

rm /var/lib/dpkg/lock-frontend; rm /var/cache/apt/archives/lock;

apt update && apt upgrade

apt install sudo ufw git docker.io docker-compose -y

# Verificar range de IP.
# Retornar apenas o IP que foi gerado.
# Editar iptables com IP atual colocando-o como estático.

sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo ufw allow 22

sudo ufw enable

# Instalar imagens Docker.

# docker pull php:8.1.19-apache-bullseye


