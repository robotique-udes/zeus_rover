#!/usr/bin/env python

import rospy
from visualization_msgs.msg import Marker, MarkerArray
from steve_viz.msg import CoordinateArray

rospy.init_node("coordinate_visualizer", anonymous = True)
rospy.loginfo("coordinate_visualizer started")

markers_pub = rospy.Publisher("coordinate_visualizer/markers", MarkerArray, queue_size=1)

def coordinatesCB(msg):
    markers_msg = MarkerArray()
    for i, coord in enumerate(msg.coordinates):
        marker = Marker()
        marker.header.stamp = rospy.Time.now()
        marker.header.frame_id = "wgs84"
        marker.ns = "coordinates"
        marker.id = i
        marker.type = 2
        marker.action = 0
        marker.pose.position.x = coord.longitude
        marker.pose.position.y = coord.latitude
        marker.pose.orientation.w = 1
        marker.scale.x = 1
        marker.scale.y = 1
        marker.scale.z = 1
        marker.color.r = 1
        marker.color.a = 1
        markers_msg.markers.append(marker)
    markers_pub.publish(markers_msg)

rospy.Subscriber("coordinate_visualizer/coordinates", CoordinateArray, callback=coordinatesCB, queue_size=1)
rospy.spin()

