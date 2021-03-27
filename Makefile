.PHONY: default deps base build stop compile-epub

export SERVICE_NAME := cyoa-epub

HISTORY_FILE := ~/.bash_history.$(SERVICE_NAME)

# Required for the `deps` task
SHELL := $(shell which bash)

DOCKER := $(shell command -v docker)
COMPOSE := $(shell command -v docker-compose)

COMPOSE_ENV := $(COMPOSE) -f build/docker-compose.yml
COMPOSE_CMD := $(COMPOSE_ENV) run --rm $(SERVICE_NAME)

deps:
ifndef DOCKER
	@echo "Docker is not available. Please install docker"
	@exit 1
endif
ifndef COMPOSE
	@echo "docker-compose is not available. Please install docker-compose"
	@exit 1
endif
	@touch $(HISTORY_FILE)

base: deps
	$(COMPOSE) -f build/docker-compose.yml build

build: base
	$(COMPOSE_ENV) build

stop:
	$(COMPOSE_ENV) stop
	$(COMPOSE_ENV) rm -f -v

shell: build
	$(COMPOSE_CMD) /bin/bash

compile-epub: build
	# UTF-8 assumed
	$(COMPOSE_CMD) -f markdown --toc -o cyoa-experiment.epub title.txt input.md
