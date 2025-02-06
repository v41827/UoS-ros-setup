# UoS-ros-setup 🤖
ROS setup for University of Surrey's CVRML programme.


## Docker Setup
Make sure you have the GlobalProtect VPN client installed and connected to the University of Surrey's network. See [here](uos_vpn_setup.pdf) for more information.

If you want the vanilla University of Surrey's docker image, run 
```bash
make setup
```
This pulls the image from the University of Surrey's container registry and retag it as `uos-ros-setup:latest`.If you want an opinionated, personalized setup, feel free to use the Dockerfile in this repository.
