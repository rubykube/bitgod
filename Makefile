VERSION ?= $(shell cat VERSION)
NAME    ?= bitgod
IMAGE   ?= ashanaakh/$(NAME):$(VERSION)

.PHONY: default build run push

default: build run

build:
	@echo '> Building "$(NAME)" docker image...'
	@docker build -t $(IMAGE) .

run:
	@echo '> Starting "$(NAME)" container...'
	@docker run -it --rm $(IMAGE) bash

push:
	docker push $(IMAGE)
