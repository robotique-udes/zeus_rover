# Multimaster setup
1. Set a static IP for your computer
2. Open `~/.bashrc` and add the following lines:
    ```bash
    export ROS_MASTER_URI=http://{ip_addres}:11311
    export ROS_IP={ip_address}
    ```
3. Launch the multimaster nodes
    ```bash
    roslaunch steve_control multimaster.launch
    ```
You can now discover other ROS masters in your network that are currently running the multimaster nodes. To verify: `rostopic list`