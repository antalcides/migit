# -*- coding: utf-8 -*-
"""
Created on Tue Oct 13 00:32:13 2015

@author: antalcides
"""

import math
#from __future__ import print_function
def fib_formula(n):
    golden_ratio = (1 + math.sqrt(5)) / 2
    val = (golden_ratio**n - (1 - golden_ratio)**n) / math.sqrt(5)
    return int(round(val))
print(fib_formula(10))