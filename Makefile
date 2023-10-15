SHELL = /bin/bash
BUILD_PLATFORM = linux/arm64
REGISTRY = docker.io
IMAGE_NAME = cpln-action-builder
TAG = latest

default: run

build: Dockerfile
	@echo "Building docker image: $(IMAGE_NAME):$(TAG)"
	@docker buildx build \
		--platform $(BUILD_PLATFORM) \
		--tag $(REGISTRY)/$(IMAGE_NAME):$(TAG) \
		--file Dockerfile \
		--push \
		.
