# UoS-ros-setup
ROS setup for University of Surrey's CVRML programme.


## Docker Setup
If you want the vanilla University of Surrey's docker image, you can pull it from the University of Surrey's container registry. 
```bash
docker pull container-registry.surrey.ac.uk/shared-containers/robotics-module-2:latest
docker tag container-registry.surrey.ac.uk/shared-containers/robotics-module-2:latest uos-robotics:latest
```
Run the docker image with Makefile.


If you want an opinionated, personalized setup, you can use the Dockerfile in this repository.
```bash
```
