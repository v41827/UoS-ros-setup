cmake_minimum_required(VERSION 3.0.2)
project(lab2)

add_compile_options(-std=c++11)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  turtlesim
  tf
)

catkin_package()

include_directories(
  ${catkin_INCLUDE_DIRS}
)

# pose_listener
add_executable(pose_listener src/pose_listener.cpp)
add_dependencies(pose_listener ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(pose_listener ${catkin_LIBRARIES})

# pose_publisher
add_executable(pose_publisher src/pose_publisher.cpp)
add_dependencies(pose_publisher ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS})
target_link_libraries(pose_publisher ${catkin_LIBRARIES})
