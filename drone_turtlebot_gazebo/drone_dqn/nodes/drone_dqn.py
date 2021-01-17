#!/usr/bin/env python
import rospy

from keras.models import Sequential, load_model
from keras.optimizers import RMSprop
from keras.layers import Dense, Dropout, Activation

class ReinforceAgent():
    def __init__(self,state_size,action_size):



        self.model = self.buildModel()
        self.target_model = self.buildModel()

    def buildModel(self):
        model = Sequential()


        return model    
