.PHONY: windows-setup
windows-setup:
	docker pull container-registry.surrey.ac.uk/shared-containers/robotics-module-2:latest
	docker tag container-registry.surrey.ac.uk/shared-containers/robotics-module-2:latest uos-robotics:latest

.PHONY: mac-setup
mac-setup:
	docker build --no-cache -t ros-melodic-arm64 .
	docker tag ros-melodic-arm64 uos-robotics:latest

.PHONY: run
run: up exec

.PHONY: up
up: 
	@xhost +
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
