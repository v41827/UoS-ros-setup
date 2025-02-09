FROM arm64v8/ros:melodic-ros-base-bionic

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    ros-melodic-turtlesim \
    x11-apps \
    mesa-utils \
    libgl1-mesa-glx \
    libgl1-mesa-dri \
    libglu1-mesa \
    libglx-mesa0 \
    x11-utils \
    && rm -rf /var/lib/apt/lists/*

RUN echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc

CMD ["/bin/bash"]