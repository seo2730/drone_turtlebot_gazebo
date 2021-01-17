#!/usr/bin/env python
import rospy


class Env():
    def __init__(self, action_size):
        self.goal_roll = 0
        self.goal_pitch = 0
        self.gola_yaw = 0