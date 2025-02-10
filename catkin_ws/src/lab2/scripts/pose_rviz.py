#!/usr/bin/env python
import rospy
from geometry_msgs.msg import PoseStamped, Quaternion
msg = PoseStamped()

def callback(data):
    msg.header.frame_id = "map"
    msg.ehader.seq = 0
    msg.header.stamp = rospy.Time.now()

    q = tf.transformations.quaternion_from_euler(0, 0, data.theta)
    msg.pose.orientation = Quaternion(*q)
    msg.pose.position.x = data.x
    msg.pose.position.y = data.y

if __name__ = '__main__':
    rospy.init_node('pose_rviz_python')

