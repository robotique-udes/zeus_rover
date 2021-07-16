# steve_rover

## Installation
**Tested with ROS Melodic running on Ubuntu 18.04.**
1. Install [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu)

2. If you don't already have one, create a catkin workspace by following [this guide](http://wiki.ros.org/catkin/Tutorials/create_a_workspace)

3. Add your catkin_ws source to your `.bashrc` file.
    ```bash
    echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
    ```

4. Install vcstool: `sudo pip install vcstool`<br>
    This is a tool that will make it easier to work with multiple repos. 

5. Clone this repo in `~catkin_ws/src/`. It is recommended that you clone it in SSH instead of HTTPS since you don't to enter a user and password every time you commit. [Connecting to GitHub with SSH](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

6. Install non-ros packages:
    ```bash
    cd ~catkin_ws/src/steve_rover
    ./installations.sh
    ```

7. Install the official ROS package dependencies with rosdep: 
    ```bash
    rosdep install --from-paths src --ignore-src -r -y
    ```
    **Note**: you may need to install rosdep first.<br>
    Command to install rosdep:
    ```bash
    sudo apt-get install python-rosdep
    ```
    Initialize rosdep once after the installation:
    ```bash
    sudo rosdep init
    rosdep update
    ```
    If you need to add and official ROS package as a dependency, you must add it to the `package.xml` of the relevant package.

    7.1 Downloading *pointcloud_to_laserscan* package for obstacle detection
    ```bash
    sudo apt-get install ros-melodic-pointcloud-to-laserscan
    ```

8. To clone the other repos using vcstool. (**Note**: the repos will be cloned in SSH):
    ```bash
    cd ~catkin_ws/src/
    vcs import < steve_rover/dependencies.repos
    ```
    All of the dependent repos should now be cloned on the right branches

9. Go to the root of the workspace and execute `catkin_make` to compile the packages.

10. If you need to pull all of the repos at once:
    ```bash
    cd ~catkin_ws/src/
    vcs pull
    ```

11. If you have added a repo and need to add it to the list of dependencies, first clone it, then:
    ```bash
    cd ~catkin_ws/src/
    vcs export > steve_rover/dependencies.repos
    ```
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
To control the rover with a gamepad:
```bash
roslaunch steve_control teleop_gamepad.launch
```
