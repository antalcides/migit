import random
import time

random.seed(time.time())

r=1
#print "o raio e", r
aleatorio1=random.uniform (-1,1) 
#print "o valor aleatorio para x e",aleatorio1
aleatorio2=random.uniform (-1,1) 
#print "o valor aleatorio para y",aleatorio2

s=aleatorio1*aleatorio1+aleatorio2*aleatorio2
if s<r**2:
    print "esta dentro"
    
if s>r**2:
    print "esta fora"

if s==r**2:
    print "esta em cima"
