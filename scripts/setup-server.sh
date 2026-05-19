#!/bin/bash

set -e

echo "[INFO] Atualizando pacotes..."
sudo apt update -y
sudo apt upgrade -y

echo "[INFO] Instalando dependências..."
sudo apt install -y \
    docker.io \
    git \
    curl \
    unzip

echo "[INFO] Habilitando Docker..."
sudo systemctl enable docker
sudo systemctl start docker

echo "[INFO] Adicionando usuário ubuntu ao grupo docker..."
sudo usermod -aG docker ubuntu

echo "[INFO] Instalando Docker Compose..."
sudo curl -L \
https://github.com/docker/compose/releases/download/v2.39.1/docker-compose-linux-x86_64 \
-o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

echo "[INFO] Verificando instalações..."

docker --version
docker-compose --version

echo "[INFO] Setup concluído!"