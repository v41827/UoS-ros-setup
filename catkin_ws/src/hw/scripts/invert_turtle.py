#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist

def callback(msg):
    new_msg = Twist()

    new_msg.linear.x = -msg.linear.x
    new_msg.linear.y = -msg.linear.y
    new_msg.linear.z = -msg.linear.z
    new_msg.angular.x = -msg.angular.x
    new_msg.angular.y = -msg.angular.y
    new_msg.angular.z = -msg.angular.z

    publisher.publish(new_msg)

if __name__ == '__main__':
    rospy.init_node('invert_turtle')
    rospy.Subscriber('/turtle1/cmd_vel', Twist, callback, queue_size=1)
    global publisher
    publisher = rospy.Publisher('/turtle2/cmd_vel', Twist, queue_size=10)
    rospy.spin()
