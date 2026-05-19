#!/bin/bash

apt update -y

apt install -y docker.io git

systemctl enable docker
systemctl start docker

curl -L "https://github.com/docker/compose/releases/download/v2.39.1/docker-compose-linux-x86_64" \
-o /usr/local/bin/docker-compose

chmod +x /usr/local/bin/docker-compose

cd /home/ubuntu

git clone https://github.com/RefactoresLabs/devops-core-lostfinder.git

cd opsawsteste/docker/compose

docker compose up -d