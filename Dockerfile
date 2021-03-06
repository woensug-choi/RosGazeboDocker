FROM dorowu/ubuntu-desktop-lxde-vnc:bionic-lxqt
LABEL maintainer "woensug.choi@gmail.com"

ENV DEBIAN_FRONTEND noninteractive
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

# Setup your sources list and keys
RUN apt-get update && apt-get install -q -y \
    dirmngr \
    gnupg2 \
    lsb-release \
    && rm -rf /var/lib/apt/lists/*
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

# Install ROS Melodic
RUN apt update
RUN apt-get install -y ros-melodic-desktop-full
RUN apt-get install -y python-rosdep
RUN rosdep init && rosdep update

# Install some essentials
RUN apt-get install -y git wget curl nano mercurial python-pip ssh htop
RUN apt-get install -y python-rosinstall python-rosinstall-generator python-wstool build-essential
RUN service ssh start

# Setup the shell
RUN /bin/bash -c "echo 'export HOME=/home/ubuntu' >> /root/.bashrc"
RUN /bin/bash -c "echo 'source /opt/ros/melodic/setup.bash' >> /root/.bashrc"
RUN cp /root/.bashrc /home/ubuntu/.bashrc
RUN /bin/bash -c "source /home/ubuntu/.bashrc"

# Install Catkin
RUN apt-get install -y ros-melodic-catkin python-catkin-tools

# Copy some starter models
#RUN mkdir -p /home/ubuntu/.gazebo/
#COPY models /home/ubuntu/.gazebo/models


# Setup workshop directory
#RUN mkdir -p ROAST
#COPY lib/curiosity_mars_rover_description ROAST/
