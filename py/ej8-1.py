import matplotlib.pyplot as plt
l = [3,3,3,2,1,4,4,5,5,5,5,5,5,5,5,5]
 #plt.hist(l,normed=True)
 plt.hist(l, bins=range(1,7), align='left', rwidth=1, normed=True)
fig.savefig('test.png')
