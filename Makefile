.PHONY: setup
setup:
	docker pull container-registry.surrey.ac.uk/shared-containers/robotics-module-2:latest
	docker tag container-registry.surrey.ac.uk/shared-containers/robotics-module-2:latest uos-robotics:latest

.PHONY: run
run: 
	docker run -it --rm --name uos-robotics uos-robotics:latest
