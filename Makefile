.PHONY: setup
setup:
	docker pull container-registry.surrey.ac.uk/shared-containers/robotics-module-2:latest
	docker tag container-registry.surrey.ac.uk/shared-containers/robotics-module-2:latest uos-robotics:latest

.PHONY: up
up: 
	docker-compose up

.PHONY: exec
exec:
	@docker exec -it rosdev bash

.PHONY: down
down:
	docker-compose down