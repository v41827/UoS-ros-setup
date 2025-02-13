# Dev Container Setup
## Windows 🪟
No custom Dockerfile is provided for Windows. However, you can pull an image from the University of Surrey's container registry by following the steps below:
1. Make sure you have the GlobalProtect VPN client installed and connected to the University of Surrey's network. See [here](uos_vpn_setup.pdf) for more information.

2. Run the following command to pull the image from the University of Surrey's container registry and tag it as `uos-ros-setup:latest`.
    ```bash
    docker pull container-registry.surrey.ac.uk/shared-containers/robotics-module-2:latest
    docker tag container-registry.surrey.ac.uk/shared-containers/robotics-module-2:latest uos-robotics:latest
    ```
    Alternatively, if you don't want to setup the VPN, you can pull from OSRF's official image:
    ```bash
    docker pull osrf/ros:melodic-desktop-full
    ```
## Apple Sillicon 🍎
The `Dockerfile` in this repository uses `arm64v8/ros:melodic-ros-base-bionic` as the base image and contains the noVNC setup for GUI applications. It's integrated with the `devcontainer.json` file for easy setup.
