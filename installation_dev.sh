#!/usr/bin/env bash

sudo apt update

sudo apt install python3-pip -y

sudo pip3 install vcstool

# Install gstreamer
sudo apt install libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev libgstrtspserver-1.0-dev gstreamer1.0-plugins-bad -y

# Install docker
sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release -y
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
sudo apt install docker-ce docker-ce-cli containerd.io -y

# Setup mapproxy
mkdir ~/mapproxy
