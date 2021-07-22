# steve_nav
Package containing launch and configuration files for autonomous navigation

## move_base
move_base is the default ROS package for autonomous navigation.
Launch with:
```bash
roslaunch steve_nav move_base.launch
```
You should now see costmaps appearing in RViz and MapViz.

### Sending a goal in RViz:
Click on the `2D Nav Goal` button at the tools pannel top of the window, then click and drag in the viewer to choose where you want the rover to move.

### Sending a goal in MapViz
In the move_base plugin on the left, click on the `2D Nav Goal` button, then click and drag in the viewer to choose where you want the rover to move.

## obstacle_detector
Converts a 3D point cloud into a laser scan. All points within a certain height are considered obstacles while the others are not.