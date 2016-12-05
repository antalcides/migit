# ICM00794-Fundamentos de Computación - FCNM-ESPOL
# 3ra Evaluación 2009. Tema 2. Billetes de cajero automático
# Propuesta en forma de programa. edelros@espol.edu.ec.
cantidad=int(input('Cantidad solicitada: '))
#Procedimiento
# division entera o cociente //
billete50=cantidad//50
saldo=cantidad-50*(billete50)
billete20=saldo//20
saldo=saldo-20*(billete20)
billete10=saldo//10
saldo=saldo-10*(billete10)
billete05=saldo//5
billete01=saldo-5*(billete05)
# Salida
print ('de 50:',billete50)
print ('de 20:',billete20)
print ('de 10:',billete10)
print ('de 05:',billete05)
print ('de 01:',billete01)
