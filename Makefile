.PHONY: help
.DEFAULT_GOAL := help

DOCKER_CMD  = docker run --rm
MOUNT_POINT = /go/src/github.com/squarescale/contact
MOUNT_FLAGS = -v "$(PWD)":"$(MOUNT_POINT)" -w "$(MOUNT_POINT)"
DOCKER_ENV = -e GOOS=linux -e GOARCH=amd64
GOLANG_IMAGE = golang:1.8
DOCKER = $(DOCKER_CMD) $(MOUNT_FLAGS) $(DOCKER_ENV) $(GOLANG_IMAGE)
OUTPUT = contact

help: ## This help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

_build: _deps
	go build -v -o $(OUTPUT)

_deps:
	go get ./...

build: ## Generate contact output
	@$(DOCKER) bash -c "make _build"

build-image: build ## Generate docker image
	docker build -t squarescale/contact .

run-image: ## Run docker image
	@$(DOCKER_CMD) squarescale/contact

clean: ## Clean repository
	rm -f contact

lint: ## Lint Dockerfile
	docker run --rm -it --privileged -v $$PWD:/root/ projectatomic/dockerfile-lint dockerfile_lint
	docker run --rm -i sjourdan/hadolint < Dockerfile
