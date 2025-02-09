# UoS-ros-setup 🤖
ROS setup for University of Surrey's CVRML programme.


## Docker Setup

### Windows
Make sure you have the GlobalProtect VPN client installed and connected to the University of Surrey's network. See [here](uos_vpn_setup.pdf) for more information.

If you want the vanilla University of Surrey's docker image, run 
```bash
make windows-setup
```
This pulls the image from the University of Surrey's container registry and retag it as `uos-ros-setup:latest`. Alternatively, if you don't want to setup the VPN, you can pull from OSRF's official image:
```bash
docker pull osrf/ros:melodic-desktop-full
```

**Be mindful that both of these images are amd64 images.** 
If you're using M1 Macs, Docker uses QEMU to emulate the amd64 architecture on your machine. This can cause some unintended side effects so I highly advise the custom built image provided in this repository.

### Mac with M1 Chip
The arm

## Testing the GUI
To test the GUI, run the following command:
```bash
rosrun turtlesim turtlesim_node
```
