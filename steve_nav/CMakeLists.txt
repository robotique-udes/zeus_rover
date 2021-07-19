cmake_minimum_required(VERSION 3.0.2)
project(steve_nav)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  pointcloud_to_laserscan
)

catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
)
