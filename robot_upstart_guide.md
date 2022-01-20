# zeus_upstart
This package is to setup the launchfile that will be called at start up.<br>
To launch a launch file on startup, the `robot_upstart` package is used. Use install script to create service : http://docs.ros.org/en/jade/api/robot_upstart/html/install.html

## Create service
```bash
rosrun robot_upstart install --master http://{ip}:11311 --job zeus_bringup {package_name}/launch/{launch_file}
```
Robot_upstart will then ask you to run another command. Before doing this, you will need to make changes to `usr/sbin/zeus_bringup-start`. Comment the following line: 
```
#export ROS_HOSTNAME=$(hostname)
```
Add the following line underneath with the correct IP address:
```
export ROS_IP={ip}
```
You can now run this command:
```bash
sudo systemctl daemon-reload && sudo systemctl start zeus_bringup
```

## Remove service
```bash
rosrun robot_upstart uninstall zeus_bringup
```

## Modify the service
When you modify the launch file you also need to modify the service for the changes to take effect. To do so, uninstall and then reinstall the service.