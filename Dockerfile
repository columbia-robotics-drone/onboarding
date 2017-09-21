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
FROM px4io/px4-dev-ros
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

# install MAVProxy
RUN apt-get update && apt-get install -y \
    python-opencv python-wxgtk3.0 \
    python-matplotlib python-pygame \
    python-lxml
