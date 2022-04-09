#!/usr/bin/env bash

sudo apt-get update

sudo apt-get install -y python3-pip

sudo pip3 install vcstool  
sudo pip3 install numpy
sudo pip3 install matplotlib

sudo apt-get install -y qt4-default liboctave-dev

# Install RTIMULib
mkdir ~/software && cd ~/software
git clone https://github.com/RTIMULib/RTIMULib2.git
cd RTIMULib2/Linux
mkdir build && cd build
cmake ..
make -j4
sudo make install

# Install gstreamer
sudo apt-get install -y libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev \
  libgstreamer-plugins-bad1.0-dev libgstrtspserver-1.0-dev gstreamer1.0-plugins-bad

# Install docker
if ! command -v docker &> /dev/null
then
  sudo apt-get install -y apt-transport-https ca-certificates curl gnupg lsb-release
  echo \
    "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
fi

# Setup mapproxy
mkdir ~/mapproxy

# To make ROS melodic compatible with python3
sudo apt-get install python3-catkin-pkg-modules && python3-rospkg-modules
