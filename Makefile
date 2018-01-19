VERSION ?= $(shell cat VERSION)
NAME    ?= bitgod
IMAGE   ?= heliostech/$(NAME):$(VERSION)

.PHONY: default build run push

default: build run

build:
	@echo '> Building "$(NAME)" docker image...'
	@docker build -t $(IMAGE) .

run:
	@echo '> Starting "$(NAME)" container...'
	@docker run -d $(IMAGE)

push:
	docker push $(IMAGE)
