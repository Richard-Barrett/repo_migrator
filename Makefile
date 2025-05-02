.PHONY: help test lint format install clean hooks

PYTHON := python3
PIP := pip3

ifeq ($(OS),Windows_NT)
	PYTHON := python
	PIP := pip
endif

help: ## Show this help menu
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-16s\033[0m %s\n", $$1, $$2}'

install: ## Install the package locally in editable mode
	@echo "💡 Creating virtualenv if it doesn't exist..."
	@test -d venv || $(PYTHON) -m venv venv
	. venv/bin/activate && $(PIP) install -e . && $(PIP) install -r requirements-dev.txt

install-dev: ## Install dev dependencies only
	$(PIP) install -r requirements-dev.txt

test: ## Run tests using pytest
	$(PYTHON) -m pytest

lint: ## Run pylint on source files
	$(PYTHON) -m pylint repo_migrator

format: ## Run black code formatter
	$(PYTHON) -m black repo_migrator tests

hooks: ## Install and run pre-commit hooks
	pre-commit install
	pre-commit run --all-files

clean: ## Remove Python cache and build files
	rm -rf __pycache__ .pytest_cache *.egg-info build dist
