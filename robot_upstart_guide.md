# zeus_upstart
This package is to setup the launchfile that will be called at start up.<br>
To launch a launch file on startup, the `robot_upstart` package is used. Use install script to create service : http://docs.ros.org/en/jade/api/robot_upstart/html/install.html


## Create service
```bash
rosrun robot_upstart install --master http://{ip}:11311 --job zeus_bringup {launch_file}
```
In `usr/sbin/zeus_bringup-start`, comment this line: 
```
#export ROS_HOSTNAME=$(hostname)
```
and add the following line underneath with the correct IP address.
```
export ROS_IP={ip}
```

## Remove service
```bash
rosrun robot_upstart uninstall zeus_bringup
```

## Modify the service
When you modify the launch file you also need to modify the service for the changes to take effect. To do so, uninstall and then reinstall the service.