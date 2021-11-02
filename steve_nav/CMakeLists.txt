cmake_minimum_required(VERSION 3.0.2)
project(steve_nav)

find_package(catkin REQUIRED COMPONENTS
  message_generation
  roscpp
  rospy
  std_msgs
  sensor_msgs
  pointcloud_to_laserscan
)

add_message_files(
  FILES
  list_gps_goals.msg
)

#catkin_python_setup()

generate_messages(
  DEPENDENCIES
  sensor_msgs
)

catkin_package(CATKIN_DEPENDS message_runtime)

include_directories(
  ${catkin_INCLUDE_DIRS}
)
