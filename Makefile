SHELL := /bin/bash

.PHONY: help setup lint

help:
	@echo "Alvos:"
	@echo "  setup  - Executa a configuração completa do ambiente"
	@echo "  lint   - Executa linters locais (se instalados)"

setup:
	chmod +x scripts/*.sh
	./scripts/setup.sh

lint:
	shellcheck scripts/*.sh
	markdownlint "**/*.md"
