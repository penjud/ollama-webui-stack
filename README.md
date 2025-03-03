# Ollama + OpenWebUI + SearXNG Stack

This repository contains a Docker Compose setup for running Ollama (LLM server), OpenWebUI (UI for interacting with LLMs), and SearXNG (privacy-focused search engine) together.

## Features

- 🚀 One-click deployment of the entire AI stack
- 🧠 Run open-source language models locally
- 🌐 Beautiful web interface for chatting with models
- 🔍 Integrated search capabilities
- 🎮 NVIDIA GPU acceleration support
- 💾 Persistent storage for all components
- 🔄 Easy update and backup scripts

## Prerequisites

- Docker and Docker Compose
- NVIDIA Docker runtime (for GPU acceleration)
- Git

## Quick Start

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/ollama-webui-stack.git
   cd ollama-webui-stack
   ```

2. Start the stack:
   ```bash
   ./scripts/start-stack.sh
   ```

3. Access the interfaces:
   - OpenWebUI: http://localhost:3000
   - SearXNG: http://localhost:8080
   - Ollama API: http://localhost:11434

## Configuration

Copy the example environment file and modify as needed:

```bash
cp .env.example .env
```

Edit the `.env` file to configure:
- Ports
- Base URLs
- GPU settings

## Directory Structure

```
ollama-webui-stack/
├── docker-compose.yml     # Main configuration file
├── .env.example           # Example environment variables
├── .gitignore             # Git ignore file
├── README.md              # This file
├── data/                  # OpenWebUI data directory
├── ollama-data/           # Ollama data directory
├── searxng-data/          # SearXNG configuration directory
└── scripts/               # Utility scripts
    ├── backup.sh          # Backup script
    ├── run-ollama-docker.sh # Run Ollama standalone
    ├── start-stack.sh     # Start the entire stack
    └── update.sh          # Update Docker images
```

## Usage

### Starting the Stack

```bash
./scripts/start-stack.sh
```

### Updating the Stack

```bash
./scripts/update.sh
```

### Backing Up Data

```bash
./scripts/backup.sh [backup_directory]
```

## Models

To download and use models with Ollama:

1. Access OpenWebUI at http://localhost:3000
2. Navigate to the Models section
3. Choose from available models to download

Popular models include:
- llama3
- mistral
- phi
- gemma

## Troubleshooting

### GPU Issues

If you're having GPU issues:
1. Ensure NVIDIA drivers are properly installed
2. Verify NVIDIA Docker runtime is configured
3. Check Docker logs: `docker-compose logs ollama`

### Connection Issues

If components can't connect to each other:
1. Check that all containers are running: `docker-compose ps`
2. Inspect logs: `docker-compose logs`
3. Verify network configuration in docker-compose.yml

## Maintenance

### Stopping the Stack

```bash
docker-compose down
```

### Checking Logs

```bash
docker-compose logs -f
```

## License

This project is distributed under the MIT License. See the LICENSE file for more information.

## Acknowledgements

- [Ollama](https://github.com/ollama/ollama)
- [OpenWebUI](https://github.com/open-webui/open-webui)
- [SearXNG](https://github.com/searxng/searxng)
