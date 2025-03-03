#!/bin/bash

# Cleanup script for Ollama + OpenWebUI + SearXNG stack
echo "Cleanup utility for Ollama + OpenWebUI + SearXNG stack"
echo "This script helps clean up resources when needed."
echo ""

# Navigate to the project directory
cd "$(dirname "$0")/.."

# Check if the stack is running and stop it if it is
if docker-compose ps | grep -q "Up"; then
  echo "Stopping running containers..."
  docker-compose down
fi

cleanup_options() {
  echo "Please select cleanup option:"
  echo "1) Remove only containers (preserves data)"
  echo "2) Remove containers and images (preserves data)"
  echo "3) Remove containers, images, and volumes (CAUTION: ALL DATA WILL BE LOST)"
  echo "4) Exit without cleanup"
  echo ""
  read -p "Enter option (1-4): " option
  
  case $option in
    1)
      echo "Removing containers..."
      docker-compose rm -f
      ;;
    2)
      echo "Removing containers and images..."
      docker-compose rm -f
      docker rmi -f ghcr.io/open-webui/open-webui:main ollama/ollama:latest searxng/searxng:latest
      docker image prune -f
      ;;
    3)
      echo "WARNING: This will delete ALL data including models and conversations."
      read -p "Are you absolutely sure? (yes/no): " confirm
      if [ "$confirm" = "yes" ]; then
        echo "Removing containers, images, and volumes..."
        docker-compose down -v
        docker volume rm $(docker volume ls -q | grep -E 'ollama-webui-stack_ollama|ollama-webui-stack_open-webui')
        docker rmi -f ghcr.io/open-webui/open-webui:main ollama/ollama:latest searxng/searxng:latest
        docker image prune -f
        
        echo "Cleaning up data directories..."
        rm -rf ./data ./ollama-data ./searxng-data
        mkdir -p data ollama-data searxng-data
      else
        echo "Operation cancelled."
      fi
      ;;
    4)
      echo "Exiting without cleanup."
      exit 0
      ;;
    *)
      echo "Invalid option, please try again."
      cleanup_options
      ;;
  esac
}

cleanup_options
echo "Cleanup completed."
