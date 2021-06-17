# steve_rover

## Installation
**Tested with ROS Melodic running on Ubuntu 18.04.**
1. Install [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu)

2. If you don't already have one, create a catkin workspace by following [this guide](http://wiki.ros.org/catkin/Tutorials/create_a_workspace)

3. Clone this repo in `~catkin_ws/src/`

4. Download dependencies with: 
    ```bash
    rosdep install --from-paths src --ignore-src -r -y
    ```

5. Go to the root of the workspace and execute `catkin_make`

## Launching the Gazebo simulation
To launch the gazebo simulation, execute this command
```bash
roslaunch steve_gazebo steve_mars.launch
```
To view the robot and sensor data in RViz:
```bash
roslaunch steve_viz rviz.launch
```
To view only the rover model without gazebo:
```bash
roslaunch steve_viz model.launch
```