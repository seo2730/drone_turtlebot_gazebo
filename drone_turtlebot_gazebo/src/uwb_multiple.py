#!/usr/bin/env python
import rospy
from std_msgs.msg import UInt32
from std_msgs.msg import UInt32MultiArray
import serial 

ser = serial.Serial(port="/dev/ttyACM0",baudrate=115200)

def pub_distance():
    # pub_tb3a = rospy.Publisher('/tb3a/distances',UInt32MultiArray, queue_size=100)
    # pub_tb3b = rospy.Publisher('/tb3b/distances',UInt32MultiArray, queue_size=100)
    # pub_tb3c = rospy.Publisher('/tb3c/distances',UInt32MultiArray, queue_size=100)
    # pub_tb3d = rospy.Publisher('/tb3d/distances',UInt32MultiArray, queue_size=100)
    # pub_tb3e = rospy.Publisher('/tb3e/distances',UInt32MultiArray, queue_size=100)

    pub_distances = rospy.Publisher('distances',UInt32MultiArray, queue_size=100)


    rospy.init_node('pub_distance',anonymous=True)
    rate = rospy.Rate(1000)

    # tb3a_distances = UInt32MultiArray()
    # tb3a_distances.data = []

    # tb3b_distances = UInt32MultiArray()
    # tb3b_distances.data = []

    # tb3c_distances = UInt32MultiArray()
    # tb3c_distances.data = []

    # tb3d_distances = UInt32MultiArray()
    # tb3d_distances.data = []

    # tb3e_distances = UInt32MultiArray()
    # tb3e_distances.data = []

    all_distances =  UInt32MultiArray()
    all_distances.data = []

    while not rospy.is_shutdown():        
        text = ser.readline()
        distnaces = list(map(int,text.split()))
        # tb3a_distances.data = distnaces[0:4]
        # tb3b_distances.data = distnaces[4:8]
        # tb3c_distances.data = distnaces[8:11]
        # tb3d_distances.data = distnaces[12:16]
        # tb3e_distances.data = distnaces[16:20]
        all_distances.data = distnaces
        print(text)
        #rospy.loginfo(anchors)
        # pub_tb3a.publish(tb3a_distances)
        # pub_tb3b.publish(tb3b_distances)
        # pub_tb3c.publish(tb3c_distances)
        # pub_tb3d.publish(tb3d_distances)
        # pub_tb3e.publish(tb3e_distances)
        pub_distances.publish(all_distances)
        rate.sleep()



if __name__=='__main__':
    try:
        pub_distance()

    except rospy.ROSInterruptException:
        pass