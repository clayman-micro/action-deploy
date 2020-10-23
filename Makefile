.PHONY: build clean clean-test clean-pyc clean-build
NAME	:= ghcr.io/clayman-micro/action-deploy
VERSION ?= latest

build:
	docker build -t ${NAME} .
	docker tag ${NAME} ${NAME}:$(VERSION)

publish:
	docker login -u $(DOCKER_USER) -p $(DOCKER_PASS)
	docker push ${NAME}
