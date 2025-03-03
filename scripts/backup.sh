#!/bin/bash

# Backup script for Ollama + OpenWebUI + SearXNG stack
# Usage: ./backup.sh [backup_directory]

# Navigate to the project directory
cd "$(dirname "$0")/.."

# Default backup directory
BACKUP_DIR="${1:-./backups}"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_PATH="${BACKUP_DIR}/backup_${TIMESTAMP}"

# Create backup directory
mkdir -p "$BACKUP_PATH"

echo "Creating backup in $BACKUP_PATH..."

# Backup data directories
echo "Backing up OpenWebUI data..."
if [ -d "./data" ]; then
  tar -czf "${BACKUP_PATH}/openwebui_data.tar.gz" -C ./ data
fi

echo "Backing up Ollama data..."
if [ -d "./ollama-data" ]; then
  tar -czf "${BACKUP_PATH}/ollama_data.tar.gz" -C ./ ollama-data
fi

echo "Backing up SearXNG data..."
if [ -d "./searxng-data" ]; then
  tar -czf "${BACKUP_PATH}/searxng_data.tar.gz" -C ./ searxng-data
fi

# Backup docker-compose configuration
echo "Backing up configuration files..."
cp docker-compose.yml "${BACKUP_PATH}/"
if [ -f ".env" ]; then
  cp .env "${BACKUP_PATH}/"
fi

echo "Backup completed successfully at ${BACKUP_PATH}"
