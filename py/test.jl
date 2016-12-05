g = 9.81; v0 = 30
dt = 0.00001
ym = v0**2/(2*g)
tm = (2*v0)/g
def y(t):
    return v0*t - 0.5*g*t**2
def table():
    data = [] # store [t, y] pairs in a nested list
    t = 0
    while y(t) >= -0.001:
        data.append([t, y(t)])
        t += dt
    return data
data = table()
np.savetxt('ball.txt',data)
