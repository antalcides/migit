using PyCall
@pyimport matplotlib.pyplot as plt
l = [3,3,3,2,1,4,4,5,5,5,5,5,5,5,5,5]
nbins=10
 #plt.hist(l,normed=True)
h =plt.hist(l)
plt.plot(h)
savefig('test.png')
