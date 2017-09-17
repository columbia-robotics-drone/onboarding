# FROM ubuntu:14.04 
FROM ros:indigo-ros-base
MAINTAINER Vinay Mehta
# install ros tutorials packages
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update \ 
    && apt-get install -y \
    ros-indigo-ros-tutorials vim \
    ros-indigo-common-tutorials software-properties-common \
    && rm -rf /var/lib/apt/lists/

RUN apt-get -y update && apt-get install -y software-properties-common

# install PX4 toolchain
RUN apt-get remove modemmanager
RUN add-apt-repository ppa:george-edison55/cmake-3.x -y \  
    && apt-get update \
    && apt-get install -y python-argparse git-core wget zip \
    python-empy qtcreator cmake build-essential genromfs
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
    python-dev python-opencv python-wxgtk2.8 \
    python-pip python-matplotlib python-pygame \
    python-lxml
RUN pip install MAVProxy
RUN echo "export PATH=$PATH:$HOME/.local/bin" >> /etc/profile
