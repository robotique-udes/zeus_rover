# Jetson Xavier NX setup
**Tested with ROS Melodic running on Ubuntu 18.04 with jetpack 4.6 and L4T r32.6.1.**

This guide will show you how to set up the Jetson Xavier NX for the Zeus rover with Ubuntu 18.04 and ROS Melodic.
## Software setup

1. [Follow these instructions](https://developer.nvidia.com/embedded/learn/get-started-jetson-xavier-nx-devkit) to install the image on the microSD card. On first boot, choose "automatic login" for simplicity of use.
2. Install ROS Melodic by following [these instructions](http://wiki.ros.org/melodic/Installation/Ubuntu)
3. [Setup a VNC server](https://developer.nvidia.com/embedded/learn/tutorials/vnc-setup) for easy access without a monitor. Once the server is configured, it will be possible to connect to it by using a VNC client such as [Remmnia](https://remmina.org/) with the Jetson's IP address.
4. (optional, but useful for testing) Create a wifi hotspot so that any computer can easily connect to the Jetson. Note, this means the Jetson will not be able to connect to another wifi hotspot, but it will make debugging easier as you won't need to connect to a network in order to SSH or VNC into the Jetson.

    a. Click on the wifi icon on the right side of the status bar and click on `edit connections` at the bottom of the menu.

    b. In the `Network Connections` window, click on the `+` icon to add a new connection.

    c. Choose the wifi connection type then create. A new window will appear. Change the connection name to `zeus_hotspot`

    d. In the Wi-Fi tab, enter `zeus` in the SSID field and choose "Hotspot" in the "Mode" field.

    e. In the General tab, check the "All users may connect to this network" box and give the connection priority a high number so that it always creates a hotspot instead of connecting to another network.

    f. In the Wi-Fi security tab, choose a security key to connect to the hotspot.

    g. In the IPv4 tab, add the addess `10.0.0.1` with the netmask `24`. This will be the IP address of the Jetson when it is in hotspot mode.

    h. Finally, to activate the hotspot, save and close the window, then click on the Wi-Fi icon in the status bar -> Create New Wi-Fi Network -> in the connection field, choose `zeus_hotspot` then create.

    i. To deactivate the hotspot, simply click on disconnect.

5. Compiling ROS packages that require opencv as an include directory will return an error on a Jetson because it is not installed at the same place it usually is on other systems. To fix this, run this line: 
    ```bash
    sudo ln -s /usr/include/opencv4/opencv2/ /usr/include/opencv
    ```
    source: https://answers.ros.org/question/199279/installation-from-source-fails-because-of-cv_bridge-include-dir/

6. Disable the `nvgetty` service to avoid problems with the UART port.
    ```bash
    systemctl stop nvgetty
    systemctl disable nvgetty
    ```
    Reboot to apply the changes

7. Installing Zed SDK on jetson

    a. Download sdk for jetpack 4.6 (Here: https://www.stereolabs.com/developers/release/)
    b. 
    ```bash
    chmod +x ./Downloads/ZED_SDK_XXX.run 
    ./ZED_SDK_XXX.run
    ```

8. Add these lines to `~/.bashrc` with the correct IP address
    ```
    export ROS_IP=<ip>
    export ROS_MASTER_URI=http://<ip>:11311
    ```

## Wiring
This is the pinout of the GPIO on a Jetson Xavier NX. Pin 1 is the one closest to the IO ports. Source: https://www.jetsonhacks.com/nvidia-jetson-xavier-nx-gpio-header-pinout/
![Jetson Xavier NX GPIO pinout](images/Jetson_Xavier_NX_GPIO_Pinout.png?raw=true "Jetson Xavier NX GPIO pinout")
### IMU
| IMU pin      | Jetson pin    |
| -----------  | -----------   |
| VCC (3.3v)   | 1             |
| GND          | 6             |
| SCL/SCLK     | 28 (I2C Bus 1)|
| SDA/SDI      | 27 (I2C Bus 1)|

### Emlid Reach module
| Module pin | Jetson pin |
| -----------| -----------|
| 5V         | 2          |
| GND        | 9          |
| TX         | 10         |
| RX         | 8          |


## Conclusion
Now that the Jetson setup is complete, go back to the main README and follow the rest of the installation instructions.