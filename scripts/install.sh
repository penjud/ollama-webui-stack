#!/bin/bash

# Installation script for Ollama + OpenWebUI + SearXNG stack
echo "Installing Ollama + OpenWebUI + SearXNG stack..."

# Navigate to the project directory
cd "$(dirname "$0")/.."

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker first."
    echo "Visit https://docs.docker.com/get-docker/ for installation instructions."
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose is not installed. Please install Docker Compose first."
    echo "Visit https://docs.docker.com/compose/install/ for installation instructions."
    exit 1
fi

# Create necessary directories
echo "Creating data directories..."
mkdir -p data
mkdir -p ollama-data
mkdir -p searxng-data

# Create environment file if it doesn't exist
if [ ! -f .env ]; then
    echo "Creating .env file from example..."
    cp .env.example .env
fi

# Make scripts executable
echo "Making scripts executable..."
chmod +x scripts/*.sh

echo "Installation completed successfully!"
echo "You can now start the stack with: ./scripts/start-stack.sh"
