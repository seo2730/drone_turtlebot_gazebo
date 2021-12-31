#!/usr/bin/env python
# -*- coding: UTF-8 -*-
import olympe
import time
import roslib; roslib.load_manifest('drone_turtlebot_gazebo')
import rospy
from std_msgs.msg import String
from olympe.messages.ardrone3.Piloting import TakeOff, Landing

DRONE_IP = "192.168.42.1"


def main():
    drone = olympe.Drone(DRONE_IP)
    drone.connect()
    assert drone(TakeOff()).wait().success()
    pub  = rospy.Publisher('chatter', String, queue_size=10)
    rospy.init_node('talker', anonymous=True)
    hello_str = "hello world %s"
    pub.publish(hello_str)
    #print("Take off")
    time.sleep(10)
    assert drone(Landing()).wait().success()
    #print("Landing")
    drone.disconnect()


if __name__ == "__main__":
    main()
