# zeus_nav
Package containing launch and configuration files for autonomous navigation

## Autonomous navigation
The entire autonomous navigation stack can be launched with:
```bash
roslaunch zeus_nav autonomous_navigation.launch
```
**Note**: the control part needs to be running first.

For more information on the sub parts of autonomous naigation, look at the sections below. You will not need to launch them individually if you have already launched `autonomou_navigation.launch`
## move_base
move_base is the default ROS package for autonomous navigation.
#### Usage
1. Launch the rover or gazebo simulation
2. Launch move_base with:
    ```bash
    roslaunch zeus_nav move_base.launch
    ```
You should now see costmaps appearing in RViz and MapViz.

### Sending a goal in RViz:
Click on the `2D Nav Goal` button at the tools pannel top of the window, then click and drag in the viewer to choose where you want the rover to move.

### Sending a goal in MapViz
In the move_base plugin on the left, click on the `2D Nav Goal` button, then click and drag in the viewer to choose where you want the rover to move.

## gps_goal
https://github.com/STEVE-Rover/gps_goal

By default, goals can only be sent to move_base in meters from the origin of the map. This package is used to send a GPS coordinate as a goal. The GPS origin of the map is initialized by the `initialize_origin.py` node in the `swri_transform_util` package which is launched in `control.launch`

### Usage
1. Start `gps_goal`:
    ```bash
    roslaunch gps_goal gps_goal.launch
    ```
2. Send a goal:
    ```bash
    rostopic pub /gps_goal_fix sensor_msgs/NavSatFix "{latitude: 38.42, longitude: -110.79}" -1
    ```

## obstacle_detector
Converts a 3D point cloud into a laser scan and keeps only the points belonging to obstacles (aka no ground points). Two versions are used: a simple versions that simply considers all points within a certain height range as obstacles and another version which estimates the ground normal to do ground segmentation.

### Usage
For a simple obstacle detection feeding the complete pointcloud to the node that transform it into a laserscan. The more complicated version uses an obstacle detector that segments the pointcloud into 2: 1 for the obtsacles and 1 for the ground. The node is then feed the obstacle pointcloud.
```bash
roslaunch zeus_nav obstacle_detector_simple.launch
```
Or
```bash
roslaunch zeus_nav obstacle_detector.launch
```