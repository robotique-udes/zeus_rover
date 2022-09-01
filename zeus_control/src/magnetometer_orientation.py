#!/usr/bin/env python

import rospy
from math import atan2, pi
from sensor_msgs.msg import MagneticField, Imu
from tf.transformations import quaternion_from_euler

class MagnetometerOrientation:
    def __init__(self):
        rospy.init_node('magnetometer_orientation')
        rospy.loginfo("Starting the motor_velocity_controller node")
        self.magnetic_declination = rospy.get_param("~magnetic_declination", 0)
        self.imu_pub = rospy.Publisher("mag_orientation", Imu, queue_size=1)
        rospy.Subscriber('imu/mag', MagneticField, self.magCB)

    def magCB(self, msg):
        theta = wrap_angle_pi(atan2(msg.magnetic_field.y, msg.magnetic_field.x) - self.magnetic_declination)
        q = quaternion_from_euler(0.0, 0.0, theta)
        
        imu_msg = Imu()
        imu_msg.header = msg.header
        imu_msg.orientation.x = q[0]
        imu_msg.orientation.y = q[1]
        imu_msg.orientation.z = q[2]
        imu_msg.orientation.w = q[3]

        self.imu_pub.publish(imu_msg)


def wrap_angle_pi(angle):
    return (angle + pi) % (2 * pi) - pi


if __name__ == "__main__":
    magnetometer_orientation = MagnetometerOrientation()
    rospy.loginfo("Magnetometer orientation")
    rospy.spin()