ARCH := $(shell arch)
ifeq ($(ARCH), x86_64)
	DOCKER_COMPOSE_FILE := docker-compose.x86_64.yaml
else ifeq ($(ARCH), arm64)
	DOCKER_COMPOSE_FILE := docker-compose.arm64.yaml
endif

.PHONY: up
up: 
	docker compose -f $(DOCKER_COMPOSE_FILE) up -d

.PHONY: down
down:
	@docker compose -f $(DOCKER_COMPOSE_FILE) down
	
.PHONY: clean
clean:
	@docker system prune

.PHONY: run 
run:
	@docker exec -it rosdev bash