# steve_cam
Contains all launch and configuration files related to the cameras.

## camera.launch
Launch file to stream the camera image feed as a ROS image_raw topic and a compressed (JPEG) topic.

## web_video_server
HTTP Streaming of ROS Image Topics in Multiple Formats.

* List of available image topics: `http://localhost:8080/`
* Video stream URL (mjpeg): `http://localhost:8080/stream?topic={ROS_TOPIC}&type=mjpeg&quality=80`
* Snapshot of next image: `http://localhost:8080/snapshot?topic={ROS_TOPIC}&quality=95`
