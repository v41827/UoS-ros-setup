.PHONY: build
build:
	docker build -t ros-melodic-arm64 .
	docker tag ros-melodic-arm64 uos-robotics:latest

.PHONY: up
up: 
	docker compose up -d

.PHONY: exec
exec:
	@docker exec -it rosdev bash

.PHONY: down
down:
	docker compose down
	
.PHONY: clean
clean:
	docker system prune
