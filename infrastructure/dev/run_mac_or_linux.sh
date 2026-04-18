#!/bin/bash

set -e

echo "Iniciando setup do ambiente de desenvolvimento..."

# Verifica se as pastas já existem
if [ -d "backend-code" ] && [ -d "frontend-code" ]; then
    echo "✅ Pastas já existem. Pulando clone..."
else
    echo "Clonando repositórios..."
    
    # Clone do backend
    if [ ! -d "backend-code" ]; then
        git clone -b test/pr https://github.com/RefactoresLabs/backend-lostfinder.git backend-code
        echo "Backend clonado"
    fi
    
    # Clone do frontend
    if [ ! -d "frontend-code" ]; then
        git clone -b test/pr https://github.com/RefactoresLabs/frontend-lostfinder.git frontend-code
        echo "Frontend clonado"
    fi
fi

echo "Subindo containers..."
docker compose build --no-cache
docker compose up -d

echo "Ambiente pronto!"
echo ""
echo "Containers rodando:"
docker ps