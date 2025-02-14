#!/usr/bin/env python
from turtlesim.srv import TeleportAbsolute, Spawn
import rospy
import random
import math


if __name__ == '__main__':
    rospy.init_node('teleport_turtle')
    spawn_client = rospy.ServiceProxy('/spawn', Spawn)
    x_pos, y_pos, theta = 5, 5, 0
    spawn_client(x_pos, y_pos, theta, "turtle3")

    teleport_client = rospy.ServiceProxy('/turtle3/teleport_absolute', TeleportAbsolute)

    loop_rate = rospy.Rate(1)
    while not rospy.is_shutdown():
        x_pos =  random.uniform(1, 10)
        y_pos =  random.uniform(1, 10)
        theta =  random.uniform(0, 2 * math.pi)
    
        teleport_client(x_pos, y_pos, theta)
        loop_rate.sleep()
