# Emlid Reach GPS receiver
There are two GPS receivers. One of them will be used on the rover, and another will be used at the base station to give corrections to the rover receiver to increase position accuracy.
## First setup (for both receivers)
1. Download the Reach app on your smartphone
2. Plugin the receiver with the micro-usb cable and wait for the LED to turn on.
3. Connect to the Reach wifi hotspot on your smartphone. The password is `emlidreach`
4. Go into the app and connect to the receiver.
5. Make the receiver connect to you wifi to access internet and download the latest firmware.
6. Once the update is done, click on "Reboot and go to the app" and wait until the reboot is complete. When the LED alternates from blue to green, that means it is ready to connect.
7. Go to `settings -> Position streaming 1`, choose serial, then click on the pencil icon to edit and choose `USB to PC`, `Baud rate: 38400` and `Format: NMEA`
