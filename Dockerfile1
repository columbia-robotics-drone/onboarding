##### HOW TO USE
# Install Docker
# Make sure you have ~5 GB of space free on your computer
# Create 'Dockerfile' in a new folder
# Run the following command in your terminal in the folder with the Dockerfile
# docker build -t aero_drone .
# Sit back, and watch Ubuntu install with all the tools you'll need
# run with:
# docker run -i -t aero_drone /bin/bash

# FROM ubuntu:14.04 
FROM ros:indigo-ros-base
MAINTAINER Vinay Mehta

# Sysadmin setup
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    openssh-server iputils-ping net-tools \
    software-properties-common 
RUN mkdir /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
CMD ["/usr/sbin/sshd", "-D"]

# install ros tutorials packages
RUN apt-get -y update \ 
    && apt-get install -y \
    ros-indigo-ros-tutorials vim \
    ros-indigo-common-tutorials \
    && rm -rf /var/lib/apt/lists/

# install PX4 toolchain
RUN  apt-get update \
    && apt-get install -y python-argparse git-core wget zip \
    python-empy qtcreator build-essential genromfs
RUN apt-get install -y python-dev \
    && apt-get install -y python-pip \
    && pip install --upgrade numpy \
    && pip install pandas jinja2 \
    && pip install pyserial
RUN add-apt-repository ppa:openjdk-r/ppa -y \ 
    && apt-get -y update \
    && apt-get install -y ant openjdk-8-jdk openjdk-8-jre

# install DroneKit
RUN pip install dronekit \
    && pip install dronekit-sitl

# install MAVProxy
RUN apt-get update && apt-get install -y \
    python-opencv python-wxgtk2.8 \
    python-matplotlib python-pygame \
    python-lxml
RUN pip install MAVProxy
RUN echo "export PATH=$PATH:$HOME/.local/bin" >> /etc/profile
