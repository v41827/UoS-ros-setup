#!/usr/bin/env python
import rospy
from turtlesim.srv import TeleportAbsolute, Spawn
from geometry_msgs.msg import Twist
from std_srvs.srv import Empty

def callback(data, pub):
    mirrored_cmd = Twist()
    mirrored_cmd.linear.x = -data.linear.x
    mirrored_cmd.angular.z = -data.angular.z
    pub.publish(mirrored_cmd)

if __name__ == '__main__':
    try:
        rospy.init_node('heart_turtle')
        
        spawn_client = rospy.ServiceProxy('/spawn', Spawn)
        spawn_client(5.5, 1.5, -40, "turtle2")
        
        teleport = rospy.ServiceProxy('/turtle1/teleport_absolute', TeleportAbsolute)
        teleport(5.5, 1.5, 40)
        
        pub_turtle1 = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
        pub_turtle2 = rospy.Publisher('/turtle2/cmd_vel', Twist, queue_size=10)
        sub = rospy.Subscriber('/turtle1/cmd_vel', Twist, callback, pub_turtle2)
        # wait for subscriber to fully setup
        rospy.sleep(1)

        # clear the canvas
        rospy.wait_for_service('clear')
        clear = rospy.ServiceProxy('clear', Empty)
        clear()
                
        rate = rospy.Rate(1)
        cmd = Twist()
        t = 0
        while not rospy.is_shutdown():
            if t < 15:
                cmd.linear.x = 0.5
                cmd.angular.z = 0.0
            elif t < 19.5:
                cmd.linear.x = 1.5
                cmd.angular.z = -0.75
            else:
                cmd.linear.x = 0
                cmd.angular.z = 1.0
                
            pub_turtle1.publish(cmd)
            t += 1            
            rate.sleep()
    
    except rospy.ROSInterruptException:
        pass
