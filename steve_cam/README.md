# steve_cam
Contains all launch and configuration files related to the cameras.

## camera.launch
Launch file to stream the camera image feed as a ROS image_raw topic and a compressed (JPEG) topic.

### Usage
1. Change the camera setings in `launch/camera.launch`
2. `roslauch steve_camera camera.launch`

## web_video_server
HTTP Streaming of ROS Image Topics in Multiple Formats.

### Usage
1. `roslaunch steve_cam web_video_server.launch`
2.  Use one of the following options
    * List of available image topics: `http://{ip_adress}:8080/`
    * Video stream URL (mjpeg): `http://{ip_adress}:8080/stream?topic={ROS_TOPIC}&type=mjpeg&quality=80`
    * Video stream URL (h.264): `http://{ip_adress}:8080/stream?topic={ROS_TOPIC}&type=h264&bitrate=1000`
    * Snapshot of next image: `http://{ip_adress}:8080/snapshot?topic={ROS_TOPIC}&quality=95`

## ros_rtsp
H.264 RTSP stream.

### Usage
1. Change the stream settings in `config/stream_setup.yaml`
2. `roslaunch steve_cam rtsp_stream.launch`
3. View the stream with
    ```bash
    gst-launch-1.0 -v rtspsrc location=rtsp://<server_ip>:8554/camera drop-on-latency=true use-pipeline-clock=true do-retransmission=false latency=0 protocols=GST_RTSP_LOWER_TRANS_UDP ! rtph264depay ! h264parse ! avdec_h264 ! autovideosink sync=true
    ```
