# Dockerized-Python-Web-App-From-Official-Image-to-Custom-Dockerfile

# Dockerized Python Web App

## Project summary
This project demonstrates foundational Docker skills by containerizing a Python Flask web application using a custom Dockerfile.

## Objectives
- Understand image vs container
- Run official Docker images
- Build a custom image from a Dockerfile
- Run and inspect a containerized web app
- Apply Docker build best practices

## Project Evolution
- v1: Basic Flask app containerized with Docker

## v2 Overview

Version 2 introduces a bind-mounted Docker development workflow for the Flask application.

### What changed in v2
- continued using a custom Dockerfile for the Flask application
- mounted the local project directory into the container using a bind mount
- improved development workflow by allowing host-side code updates to be reflected inside the container
- validated runtime behavior with Docker logs, inspect, and container shell access

### v2 Build Command
```bash
docker build -t docker-mini-project:v2 .

## Tech stack
- Docker
- Python 3.12
- Flask

## Project structure
- app.py
- requirements.txt
- Dockerfile
- .dockerignore

## Build command
docker build -t docker-mini-project:v1 .

## Run command
docker run -d -p 5000:5000 --name docker-mini-app docker-mini-project:v1

## Endpoints
- /
- /health

## Key Docker concepts demonstrated
- Dockerfile
- Images
- Containers
- Port publishing
- Logs
- Inspect
- Tagging
- Build context
- Layer caching
- .dockerignore

## Best practices applied
- Used a slim official Python base image
- Pinned image and dependency versions
- Copied requirements first for better Docker cache reuse
- Used .dockerignore to reduce unnecessary build context
- Tagged images with explicit versions

## Outcome
Successfully built and ran a custom Dockerized web application locally and validated container lifecycle, logs, and runtime behavior.

## v4 Overview

Version 4 expands the project into a multi-container application using Docker Compose.

### What changed in v4
- added a Redis service to the application stack
- defined the full application using `docker-compose.yml`
- connected the Flask app and Redis using Compose service networking
- retained persistent file storage with a named volume
- managed the application stack with a single `docker compose up` workflow