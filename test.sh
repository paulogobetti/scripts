#!/usr/bin/env bash

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

