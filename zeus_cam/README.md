# zeus_cam
Contains all launch and configuration files related to the cameras.

## camera.launch
Launch file to stream the camera image feed as a ROS image_raw topic and a compressed (JPEG) topic.

### Usage
1. Change the camera setings in `launch/camera.launch`
2. `roslaunch zeus_cam camera.launch`

## web_video_server
HTTP Streaming of ROS Image Topics in Multiple Formats.

### Usage
1. `roslaunch zeus_cam web_video_server.launch`
2.  Use one of the following options and replace `{ip_adress}` by `localhost` if you are running it on the same machine or the ip of the remote machine. Also change `{ROS_TOPIC}` by the right image topic.
    * List of available image topics: `http://{ip_adress}:8080/`
    * Video stream URL (mjpeg): `http://{ip_adress}:8080/stream?topic={ROS_TOPIC}&type=mjpeg&quality=80`
    * Video stream URL (h.264): `http://{ip_adress}:8080/stream?topic={ROS_TOPIC}&type=h264&bitrate=1000`
    * Snapshot of next image: `http://{ip_adress}:8080/snapshot?topic={ROS_TOPIC}&quality=95`

## ros_rtsp
H.264 RTSP stream.

### Usage
1. Change the stream settings in `config/stream_setup.yaml`
2. `roslaunch zeus_cam rtsp_stream.launch`
3. View the stream with the following command and replace `<server_ip>` by `localhost` if you are running it on the same machine or the ip of the remote machine.
    ```bash
    gst-launch-1.0 -v rtspsrc location=rtsp://<server_ip>:8554/camera drop-on-latency=true use-pipeline-clock=true do-retransmission=false latency=0 protocols=GST_RTSP_LOWER_TRANS_UDP ! rtph264depay ! h264parse ! avdec_h264 ! autovideosink sync=true
    ```


## camera_calibration
This is a tool to calibrate a camera by using a [checkerboard pattern](http://wiki.ros.org/camera_calibration/Tutorials/MonocularCalibration?action=AttachFile&do=view&target=check-108.pdf).

### Usage
1. Print the checkerboard pattern and attach it to a rigid surface like a cardboard.
2. In `camera_calibration.launch` change the size and square arguments to the amount of intersecting corners on the width and height (the number of squares - 1) and the length of a square in meters.
3. Launch the camera (see camera.launch section)
4. Move the checkerboard around until enough data is collected
5. Press on `calibrate` and wait.
6. Press on save.
7. Extract `ost.yaml` from `/tmp/calibrationdata.tar.gz` and rename it to whatever you like.
8. The file can now be used as the camera info for `camera.launch`

## aruco_detect
Used to detect the pose of aruco tags
### Usage
1. `roslaunch zeus_cam aruco_detect.launch`
2. Look at the output image topic to see detected tags
3. (Optional) In Gazebo, import the models named `urc_aruco_X` to test in simulation

## ZED
1. To reconfigure dynamically parameters from the zed, run :`rosrun rqt_reconfigure rqt_reconfigure`
2. To show camera feed `rosrun rqt_image_view rqt_image_view` or `rqt_image_view`