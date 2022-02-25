# Emlid Reach GPS receiver
There are two GPS receivers. One of them will be used on the rover, and another will be used at the base station to give corrections to the rover receiver to increase position accuracy.

Emlid Reach documentation: https://github.com/emlid/reach-docs/tree/old-docs

## LED patterns
The module app can be accessed when the green LED is blinking along with another color. It can take multiple minutes before it is fully booted.

If the light blinks white and magenta, you will not have acces to the web app. You will need to take the GPS outside until it starts blinking green instead og magenta

## First setup
1. Download the Reach app on your smartphone
2. Plugin the receiver with the micro-usb cable and wait for the LED to turn on.
3. Connect to the Reach wifi hotspot on your smartphone. The password is `emlidreach`
4. Go into the app and connect to the receiver.
5. Make the receiver connect to you wifi to access internet and download the latest firmware.
6. Once the update is done, click on "Reboot and go to the app" and wait until the reboot is complete. When the LED alternates from blue to green, that means it is ready to connect.

### Steps for the rover GPS
1. Go to `settings -> Position streaming 1`, choose serial, then click on the pencil icon to edit and choose `UART`, `Baud rate: 115200` and `Format: NMEA`
2. You can deactivate the second position streaming since we will not be using it.
3. TODO: use TCP for incoming corrections

### Steps for the base GPS
1. TODO: Change the correction output to TCP
2. Turn off the position streaming.

## Setting up the base mode
Every time you want to use the base GPS for corrections, you will need to set it up. To do so, go to "Base mode" and start the configuration. It will collect data for a default time of 2 minutes (can be changed). The base GPS must not move during this process and during it's use.

## Using the GPS in the field
When not in the presence of the network you used to setup the module, you must power it the pins left of the USB connectors. Otherwise, it will not boot from USB power. Once booted, the LED will flash green and white continuously, indicating that it is in hotspot mode. For some reason, I was not able to connect to it with the ReachView 3 app, but it is still possible to access it via a web browser with the address `192.168.42.1`.

## Network setup
The best way to get the corrections from the base to the rover is via TCP.
TODO: make a graph of the network

### Base GPS network setup
1. Connect the gps to a linux computer with a usb cable. If the module is underpowered from the usb cable alone, you can also use the 5V and GND pins. On the computer, you should see that the module is connected as a *ethernet over usb* connection.
2. In your network settings, set your IP address to `192.168.2.1` using the method `Shared to other computers`
3. Restart your network adapter and try pinging the module at the address `192.168.2.15`. It is not possible to change this address. You should also be able to access the webapp at that same address.
4. To allow computers on the rover network (`192.168.1.XX`) to access the base gps network (`192.168.2.XX`), you should set the default gateway of your rover network interface to the address of your base gps network interface.

### Rover GPS network setup
TODO:

## Wiring with the Jetson Xavier NX
![reach-connectors](https://github.com/emlid/reach-docs/blob/old-docs/docs/img/electrical-specs/reach-connectors.png?raw=true)
| Module pin | Jetson pin |
| -----------| -----------|
| 5V         | 2          |
| GND        | 9          |
| TX         | 10         |
| RX         | 8          |

**Note**: you will need to give the permissions to use the port every time you boot the Jetson: `sudo chmod 666 /dev/ttyXXX` with `XXX` replaced by the correct port name.


## Firmware reflashing
If the Reach module stops working, you can reset it by reflashing the firmware
https://docs.emlid.com/reachrs2/reach-panel/firmware-reflashing/#reach-firmware-flash-tool-installation
