# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 21:13:30 2015

@author: antalcides
"""
from ForwardEuleruni import*
from LogisticUni import*

problem = Logistic(0.2, 1, 0.1)

T = 40
dt = 0.1
method = ForwardEuler(problem, dt)
method.set_initial_condition(problem.u0, 0)
u, t = method.solve(T)
from scitools.std import plot, hardcopy, xlabel, ylabel, title
plot(t, u)
xlabel('t'); ylabel('u')
title('Logistic growth: alpha=0.2, dt=%g, %d steps' \
    % (dt, len(u)-1))
