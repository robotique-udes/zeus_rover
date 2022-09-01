cmake_minimum_required(VERSION 3.0.2)
project(zeus_nav)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  roscpp
  rospy
  std_msgs
  sensor_msgs
  pointcloud_to_laserscan
)

#catkin_python_setup()


include_directories(
  ${catkin_INCLUDE_DIRS}
)
