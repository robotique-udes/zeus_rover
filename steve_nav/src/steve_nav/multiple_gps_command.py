#!/usr/bin/env python3

import rospy

from sensor_msgs.msg import NavSatFix
from steve_nav.msg import list_gps_goals
from std_msgs.msg import Bool



class MultipleGpsGoals():

    def __init__(self):

        rospy.Subscriber('list_gps_goals', list_gps_goals, self.sendMultipleGPSGoals)
        rospy.Subscriber('reach_destination', Bool, self.reachedDestination)
        self.pub = rospy.Publisher('gps_goal', NavSatFix, queue_size=10)

        rospy.init_node('multiple_gps_command', anonymous=True)
        

    def sendMultipleGPSGoals(self, data):
        print('Holla')
        
    def reachedDestination(self, reachDestination):
        pass



if __name__ == '__main__':
    #gps_goal.ros_main()

    MultipleGpsGoals()
    rospy.spin()


