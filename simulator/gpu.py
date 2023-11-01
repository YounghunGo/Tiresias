from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import util

'''
TODO: add cpu and network load support in class _Node
'''
class _GPU(object):
    def __init__(self, node_id, gpu_id):
        self.id = gpu_id
        self.node_id = node_id
        #self.switch_id = switch_id
        self.using = False

    def release(self):
        self.using = False
        # todo: consider GPU mem and core information 
        
    