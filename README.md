# steve_rover

## Installation
**Tested with ROS Melodic running on Ubuntu 18.04.**
1. Install [ROS Melodic](http://wiki.ros.org/melodic/Installation/Ubuntu)

2. If you don't already have one, create a catkin workspace by following [this guide](http://wiki.ros.org/catkin/Tutorials/create_a_workspace)

3. Add your catkin_ws source to your `.bashrc` file.
    ```bash
    echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
    ```

4. Clone this repo in `~catkin_ws/src/`. It is recommended that you clone it in SSH instead of HTTPS since you don't to enter a user and password every time you commit. [Connecting to GitHub with SSH](https://docs.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh)

5. Install non-ros packages: 
    ```bash
    cd ~catkin_ws/src/steve_rover
    ./installation_dev.sh  # Or ./installation_jetson.sh if you are installing this on a Jetson
    ```

6. Clone the other repos using vcstool. (**Note**: there are two dependency lists, one in SSH and the other in HTTPS. For development, SSH is recommended):
    ```bash
    cd ~catkin_ws/src/
    vcs import < steve_rover/dependencies_ssh.repos
    ```
    All of the dependent repos should now be cloned on the right branches

    * If you need to pull all of the repos at once:
        ```bash
        cd ~catkin_ws/src/
        vcs pull
        ```

    * If you have added a repo and need to add it to the list of dependencies, first clone it, then:
        ```bash
        cd ~catkin_ws/src/
        vcs export > steve_rover/dependencies_ssh.repos
        ```
        **Important**: When modifying the dependency list, make sure that the HTTPS AND SSH lists are identical except for the url prefixes.
        **Important**: This repo should not be in the list since it is already cloned when importing.

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

8. Go to the root of the workspace and execute `catkin_make` to compile the packages.
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
