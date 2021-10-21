#!/usr/bin/env bash

sudo apt update

sudo apt install python3-pip vcstool -y

# Install gstreamer
sudo apt install libgstreamer-plugins-base1.0-dev libgstreamer-plugins-good1.0-dev libgstreamer-plugins-bad1.0-dev libgstrtspserver-1.0-dev gstreamer1.0-plugins-bad -y
