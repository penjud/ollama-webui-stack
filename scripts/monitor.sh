#!/bin/bash

# Monitor health and resource usage of the Ollama + OpenWebUI + SearXNG stack
echo "Monitoring Ollama + OpenWebUI + SearXNG stack..."

# Navigate to the project directory
cd "$(dirname "$0")/.."

# Check if the stack is running
if ! docker-compose ps | grep -q "Up"; then
  echo "Error: The stack does not appear to be running."
  echo "Start it first with: ./scripts/start-stack.sh"
  exit 1
fi

# Display container status
echo "=== Container Status ==="
docker-compose ps
echo ""

# Display resource usage
echo "=== Resource Usage ==="
docker stats --no-stream $(docker-compose ps -q)
echo ""

# Check Ollama API health
echo "=== Ollama API Health ==="
if curl -s http://localhost:11434/api/version > /dev/null; then
  echo "Ollama API is responsive."
  echo "API version: $(curl -s http://localhost:11434/api/version | jq -r '.version')"
else
  echo "Warning: Ollama API is not responding."
fi
echo ""

# Check OpenWebUI health
echo "=== OpenWebUI Health ==="
if curl -s http://localhost:3000 > /dev/null; then
  echo "OpenWebUI is responsive."
else
  echo "Warning: OpenWebUI is not responding."
fi
echo ""

# Check SearXNG health
echo "=== SearXNG Health ==="
if curl -s http://localhost:8080 > /dev/null; then
  echo "SearXNG is responsive."
else
  echo "Warning: SearXNG is not responding."
fi
echo ""

# List models (if Ollama is responsive)
if curl -s http://localhost:11434/api/tags > /dev/null; then
  echo "=== Available Models ==="
  curl -s http://localhost:11434/api/tags | jq -r '.models[] | .name + " (" + .size + ")"'
fi
