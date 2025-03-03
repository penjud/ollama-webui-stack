#!/bin/bash

# Update the Docker images for the stack
echo "Updating Ollama + OpenWebUI + SearXNG stack..."

# Navigate to the project directory
cd "$(dirname "$0")/.."

# Pull the latest images
echo "Pulling latest Docker images..."
docker-compose pull

# Restart the services
echo "Restarting services with new images..."
docker-compose down
docker-compose up -d

# Clean up old images
echo "Cleaning up old images..."
docker image prune -f

echo "Update completed successfully!"
echo "- Ollama is available at: http://localhost:11434"
echo "- OpenWebUI is available at: http://localhost:3000" 
echo "- SearXNG is available at: http://localhost:8080"
