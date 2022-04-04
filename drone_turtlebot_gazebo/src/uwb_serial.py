#!/usr/bin/env python
import rospy
from std_msgs.msg import UInt32
from std_msgs.msg import UInt32MultiArray
import serial 

ser = serial.Serial(port="/dev/ttyACM0",baudrate=115200)

def pub_distance():
    pub_anchors = rospy.Publisher('anchors',UInt32MultiArray, queue_size=100)
    rospy.init_node('pub_distance',anonymous=True)
    rate = rospy.Rate(100)

    anchors = UInt32MultiArray()
    anchors.data = []

    while not rospy.is_shutdown():        
        text = ser.readline()
        anchors.data = list(map(int,text.split()))
        print(list(map(int,text.split())))
        #rospy.loginfo(anchors)
        pub_anchors.publish(anchors)
        rate.sleep()



if __name__=='__main__':
    try:
        pub_distance()

    except rospy.ROSInterruptException:
        pass