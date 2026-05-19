#!/bin/bash

set -e

BACKUP_DIR="/home/ubuntu/backups"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

mkdir -p $BACKUP_DIR

echo "[INFO] Criando backup..."

tar -czvf \
$BACKUP_DIR/lostfinder-backup-$DATE.tar.gz \
/home/ubuntu/opsawsteste

echo "[INFO] Backup criado em:"
echo "$BACKUP_DIR/lostfinder-backup-$DATE.tar.gz"