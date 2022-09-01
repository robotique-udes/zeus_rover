# zeus_viz
This package is for launching different visualization tools such as RViz and MapViz.

## RViz
To launch RViz:
```bash
roslauch zeus_viz rviz.launch
```

To launch RViz only to visualize the robot model:
```bash
roslaunch zeus_viz model_viewer.launch
```

## MapViz
**Important**: in order to have Google Maps satelite images working in MapViz, you first need to start the mapproxy docker container:
```bash
cd ~/catkin_ws/src/zeus_rover/zeus_viz/src
./start_mapproxy.sh
```
This only needs to be done once per boot. You can test that is working by going to this address in your browser: `http://127.0.0.1:8080/demo/`

To launch MapViz:
```bash
roslaunch zeus_viz mapviz.launch
```

To change the origin coordinate, change the value of `local_xy_origin` to the name of a location in the list. You can add as many locations to the list as you want.

### Offline support
To download the Google Maps satellite images you need to be connected to the internet. However, downloaded images are cached in `~/mapproxy/cached_data` and are available offline.