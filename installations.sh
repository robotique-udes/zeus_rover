#!/usr/bin/env bash

sudo apt update

# Install gstreamer
sudo apt-get install libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev libgstrtspserver-1.0-dev gstreamer1.0-plugins-bad

# Install docker
sudo apt-get install docker-ce docker-ce-cli containerd.io

# Setup mapproxy
mkdir ~/mapproxy
