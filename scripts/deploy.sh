#!/bin/bash

set -e

PROJECT_DIR="/home/ubuntu/opsawsteste/docker/compose"

echo "[INFO] Entrando no projeto..."
cd $PROJECT_DIR

echo "[INFO] Atualizando repositório..."
git pull origin main

echo "[INFO] Derrubando containers antigos..."
docker compose down

echo "[INFO] Rebuildando imagens..."
docker compose build --no-cache

echo "[INFO] Subindo containers..."
docker compose up -d

echo "[INFO] Limpando imagens antigas..."
docker image prune -f

echo "[INFO] Deploy concluído!"