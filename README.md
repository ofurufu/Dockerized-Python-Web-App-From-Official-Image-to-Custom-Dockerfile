# Dockerized Python Web Application  
### From Single-Container Build to Multi-Container Production-Style Stack

A production-minded Docker project that demonstrates the evolution of a Python Flask application from a basic single-container deployment into a multi-container application stack using Docker Compose, Redis, persistent Docker volumes, optimized image builds, and CI-based image delivery

This project was built as part of my hands-on DevOps learning journey to strengthen practical skills in containerization, service orchestration, image optimization, runtime hardening, and Docker-based CI/CD workflows.

---

## Project Overview

This repository showcases the progressive development of a Dockerized Python web application through multiple implementation stages, beginning with a simple Flask container and advancing into a more production-style application stack.

The final version includes:

- a **Python Flask web application**
- a **Redis backend service**
- **Docker Compose** orchestration
- **persistent application storage** using Docker volumes
- **multi-stage Docker image build**
- **non-root container runtime**
- **Gunicorn-based application startup**
- **GitHub Actions automation** for Docker image validation, build, tagging, and publishing

The goal of this project is not just to run a container locally, but to demonstrate how a Docker-based application can mature into a more realistic DevOps portfolio project.

---

## Why This Project Matters

Docker is a foundational technology in modern DevOps and cloud engineering. This project demonstrates practical ability to:

- build and run custom Docker images
- containerize a Python application with a repeatable Dockerfile
- work with bind mounts and named volumes
- manage data persistence across container recreation
- orchestrate multi-container applications with Docker Compose
- connect application services using internal container networking
- improve runtime quality with multi-stage builds and non-root execution
- automate Docker image delivery with GitHub Actions

For recruiters and hiring managers, this project reflects both technical growth and production-minded engineering habits.

---

## Tech Stack

- **Docker**
- **Docker Compose**
- **Python 3.12**
- **Flask**
- **Redis**
- **Gunicorn**
- **GitHub Actions**
- **Docker Hub**

---

## Final Architecture

The final implementation includes the following services and components:

- **web** — Python Flask application served with Gunicorn
- **redis** — Redis service used for application visit counting
- **app_data volume** — Docker-managed named volume for persistent file storage
- **Docker Compose** — multi-container orchestration and service networking
- **GitHub Actions pipeline** — automated image build, validation, tagging, and publishing

---

## Project Evolution

### v1 — Basic Dockerized Flask Application
The project began with a simple Flask application containerized using a custom Dockerfile.

**Highlights**
- built a custom Docker image
- ran the app as a single container
- practiced Docker CLI lifecycle operations
- exposed the application through published ports

---

### v2 — Bind-Mounted Development Workflow
Introduced bind mounts to support a faster local development workflow.

**Highlights**
- mounted the local source code into the container
- improved host-container file sharing during development
- validated application behavior using Docker logs and inspection commands

---

### v3 — Persistent Storage with Docker Volumes
Added persistent storage using a Docker-managed named volume.

**Highlights**
- implemented file write and read endpoints
- mounted a named volume into the application container
- validated that application data survives container recreation

---

### v4 — Multi-Container Stack with Docker Compose
Expanded the application into a multi-service stack using Docker Compose.

**Highlights**
- added Redis as a backend service
- defined the application stack in `docker-compose.yml`
- connected services using Compose networking
- retained persistent file storage with a named volume

---

### v5 — Production-Minded Optimization and Hardening
Upgraded the application image and runtime behavior to better reflect production-style container practices.

**Highlights**
- introduced a multi-stage Dockerfile
- switched from Flask development server to Gunicorn
- ran the application as a non-root user
- removed development-oriented bind mounts from runtime
- added restart behavior in Compose

---

### Final CI/CD Enhancement
Integrated GitHub Actions to automate Docker image delivery.

**Highlights**
- validated Docker build configuration in CI
- built Docker images automatically on pull requests
- pushed tagged images to Docker Hub on `main`
- used Buildx cache optimization for faster rebuilds

---

## Key Features

- Custom Dockerfile-based image build
- Multi-container application with Docker Compose
- Persistent application storage using named volumes
- Redis-backed visit counter
- Production-minded Gunicorn runtime
- Non-root container execution
- Multi-stage image optimization
- GitHub Actions Docker CI/CD workflow
- Docker Hub image publishing

---

## CI/CD Automation

This project includes a GitHub Actions workflow that:

- builds the Docker image on every pull request
- validates Docker build configuration in CI
- generates automated image tags and labels
- pushes tagged images to Docker Hub on `main`
- uses GitHub Actions cache to speed up rebuilds
- supports future extensions such as SBOM, provenance, and policy checks

---

## Repository Structure

```text
dockerized-python-web-application/
├── .github/
│   └── workflows/
│       └── docker-ci.yml
├── app.py
├── requirements.txt
├── Dockerfile
├── docker-compose.yml
├── .dockerignore
└── README.md
