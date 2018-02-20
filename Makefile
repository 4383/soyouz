.PHONY: help
.DEFAULT_GOAL := help

define PRINT_HELP_PYSCRIPT
import re, sys

for line in sys.stdin:
	match = re.match(r'^([a-zA-Z_-]+):.*?## (.*)$$', line)
	if match:
		target, help = match.groups()
		print("%-20s %s" % (target, help))
endef
export PRINT_HELP_PYSCRIPT
BROWSER := python -c "$$BROWSER_PYSCRIPT"
PROJECT_NAME := $(shell basename $(shell pwd))
TAG=dirty

help:
	@python -c "$$PRINT_HELP_PYSCRIPT" < $(MAKEFILE_LIST)

build: ## build soyouz
	echo ${PROJECT_NAME}
	cd ${PROJECT_NAME}; docker build ${CACHE} -t ${PROJECT_NAME} .

run: build ## build and launch soyouz
	docker run --rm -it soyouz /bin/bash
