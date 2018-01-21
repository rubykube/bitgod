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
	@docker run -p 19332:19332 -d $(IMAGE)

push:
	docker push $(IMAGE)

deploy:
	@helm install chart/$(NAME) --name $(NAME) --set "image.tag=$(VERSION)"
