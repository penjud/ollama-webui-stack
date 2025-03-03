#!/bin/bash

# Start the entire Ollama + OpenWebUI + SearXNG stack
echo "Starting Ollama + OpenWebUI + SearXNG stack..."

# Navigate to the project directory (adjust if needed)
cd "$(dirname "$0")/.."

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
  echo "Docker is not running. Please start Docker and try again."
  exit 1
fi

# Create data directories if they don't exist
mkdir -p data
mkdir -p ollama-data
mkdir -p searxng-data

# Start the services with docker-compose
docker-compose up -d

echo "Stack started successfully!"
echo "- Ollama is available at: http://localhost:11434"
echo "- OpenWebUI is available at: http://localhost:3000"
echo "- SearXNG is available at: http://localhost:8080"
