FROM arm64v8/ros:melodic-ros-base-bionic

ENV DEBIAN_FRONTEND=noninteractive

# Install VNC, XFCE4, and required packages
RUN apt-get update && apt-get install -y \
    ros-melodic-turtlesim \
    ros-melodic-rqt \
    ros-melodic-tf \
    ros-melodic-rviz \
    xfce4 \
    xfce4-goodies \
    tigervnc-standalone-server\
    novnc \
    net-tools \
    supervisor \
    dbus-x11 \
    python-pip \
    websockify \
    # Add OpenGL and Qt dependencies
    libgl1-mesa-dri \
    libgl1-mesa-glx \
    mesa-utils \
    libqt5core5a \
    libqt5gui5 \
    libqt5widgets5 \
    # Add accessibility packages
    at-spi2-core \
    libatk-adaptor \
    && rm -rf /var/lib/apt/lists/*

# Set up VNC password
RUN mkdir -p /root/.vnc && \
    echo "password" | vncpasswd -f > /root/.vnc/passwd && \
    chmod 600 /root/.vnc/passwd

# Set up runtime directories
RUN mkdir -p /tmp/runtime-root && \
    chmod 700 /tmp/runtime-root && \
    chown root:root /tmp/runtime-root

# Create xstartup file
RUN mkdir -p /root/.vnc && \
    echo '#!/bin/bash\nunset SESSION_MANAGER\nunset DBUS_SESSION_BUS_ADDRESS\nexport XKL_XMODMAP_DISABLE=1\n[ -x /etc/vnc/xstartup ] && exec /etc/vnc/xstartup\n[ -r $HOME/.Xresources ] && xrdb $HOME/.Xresources\n# Start dbus\ndbus-launch --exit-with-session\n# Start accessibility services\n/usr/lib/at-spi2-core/at-spi-bus-launcher --launch-immediately &\nvncconfig -iconic &\nstartxfce4 &' > /root/.vnc/xstartup && \
    chmod +x /root/.vnc/xstartup

# Add supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Set up ROS environment
RUN echo "source /opt/ros/melodic/setup.bash" >> /root/.bashrc

# Create required directories
RUN mkdir -p /tmp/.X11-unix && \
    chmod 1777 /tmp/.X11-unix

# Create log directory for supervisor
RUN mkdir -p /var/log/supervisor

# Set environment variables
ENV HOME=/root \
    DISPLAY=:1 \
    USER=root \
    XDG_RUNTIME_DIR=/tmp/runtime-root \
    QT_X11_NO_MITSHM=1

EXPOSE 5901
EXPOSE 6080

CMD ["/usr/bin/supervisord"]