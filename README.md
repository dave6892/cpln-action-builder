# cpln-action-builder

A Docker-based builder for deploying workloads to Control Plane using configuration templates.

## Overview

This project provides a containerized environment with the Control Plane CLI (`cpln`) and necessary tools for deploying GVCs (Global Virtual Clouds) and workloads to Control Plane infrastructure.

## Features

- Pre-configured Docker image with Control Plane CLI
- Template YAML configurations for GVCs and workloads
- Support for serverless workloads with autoscaling
- Built for ARM64 architecture (linux/arm64)

## Prerequisites

- Docker with buildx support
- Access to a Control Plane organization
- Docker registry credentials (if pushing images)

## Quick Start

### Build the Docker Image

```bash
make build
```

This will build and push the image to Docker Hub with the default settings:
- Platform: `linux/arm64`
- Registry: `docker.io`
- Image: `cpln-action-builder:latest`

### Customize Build Settings

You can override the default settings by modifying the `Makefile` or passing variables:

```bash
make build REGISTRY=your-registry.io IMAGE_NAME=your-image TAG=v1.0.0
```

## Configuration Templates

### GVC Configuration (`cpln/cpln-gvc.yml`)

Defines a Global Virtual Cloud with static placement in AWS us-west-2:

- **GVC_NAME**: Replace with your GVC name
- **ORG_NAME**: Replace with your Control Plane organization name

### Workload Configuration (`cpln/cpln-workload.yml`)

Defines a serverless workload with the following characteristics:

- **WORKLOAD_NAME**: Replace with your workload name
- **IMAGE_NAME_TAG**: Replace with your container image reference
- CPU: 6000m (6 cores)
- Memory: 12288Mi (12GB)
- Port: 8888 (HTTP)
- Autoscaling: 1-1 instances, scale to zero after 300s
- Timeout: 40 seconds

## Included Tools

The Docker image includes:

- **Control Plane CLI** (`cpln`)
- **Node.js & npm**
- **Docker**
- **yq** (v3.3.2) - YAML processor
- **sed** - Stream editor

## Usage

Replace the placeholder values in the configuration files:

1. `ORG_NAME` - Your Control Plane organization
2. `GVC_NAME` - Your Global Virtual Cloud name
3. `WORKLOAD_NAME` - Your workload name
4. `IMAGE_NAME_TAG` - Your container image reference

Then deploy using the Control Plane CLI commands within the Docker container.

## License

This project is provided as-is for use with Control Plane deployments.