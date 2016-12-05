# -*- coding: cp1252 -*-
#Samuel Rodas 12103, Eduardo Calderon, Javier Flores
#Este programa contiene las funciones a utilizar en el programa principal.
#21/05/12

#se importa el modulo visual (Vpython)
from visual import *

#se define la función menu
def menu():
    """ La funcion menu despliega las opciones que el usuario puede elegir y le indica cuando ingreso una opcion no valida.
    No necesita ningun argumento de entrada. Lo que regresa es la opcion que el usuario eligio"""
    #se imprime el numero para el usuario
    print ""
    print "Menu Principal"
    print "1. Simulador de caida libre"
    print "2. Simulador de proyeccion horizontal"
    print "3. Simulador de tiro parabolico 1"
    print "4. Simulador de tiro parabolico 2"
    print "5. Simulador de tiro vertical"
    print "6. Salir"
    print ""
    #se le pregunta que opción desea al usuario
    op=raw_input("Ingrese el numero de la opcion que desea: ")
    #se condiona que solo regrese el dato si esta entre las opciones
    while op not in "123456":
        #si no se encuentra se le indica al usuario
        print "OPCIÓN INVALIDA, INGRESELA NUEVAMENTE"
        op=raw_input("Ingrese el número de la opcion que desea: ")
    else:
        #se regresa el dato que ecogio el usuario
        return op


#se define la funcion ingresa
def Ingresar():
    """ La función Ingresar le pide al usuario que ingrese la altura y le indica cuando no es un dato valido el que ingreso.
    No necesita nngun argumento de entrada.Lo que regresa es la altura que el usuario indico"""
    #se asigna el valor de la variable seguir
    seguir=True
    #se le pide al usuario que ingresa la altura
    posinicial=raw_input("Ingrese la altura desde donde se va dejar caer (en metros): ")
   #se condiona para que solo permite ingresar numero positivos 
    while seguir==True:
        try:
            posinicial=float(posinicial)
            if posinicial>0:
                posinicial=posinicial+2
                return posinicial
            else:
                #se le indica al usuario cuando ingreso un dato invalido y se le vuelve a pedir que lo ingrese
                print "LA ALTURA NO PUEDE SER NEGATIVA, INGRESELO NUEVAMENTE"
                posinicial=raw_input("Ingrese la altura desde donde se va dejar caer (en metros): ")
        except:
            #se le indica al usuario cuando ingreso un dato invalido y se le vuelve a pedir que lo ingrese
            print "DATO NO VALIDO, INGRESELO NUEVAMENTE"
            posinicial=raw_input("Ingrese la altura desde donde se va dejar caer (en metros): ")

    
#se define la funcion vf    
def vf(gravedad, tiempo):
    """ La función vf realiza una operación matematica para encontrar la velocidad final de un cuerpo en caida libre.
    Necesita de argumentos la gravedad y el tiempo. Lo que regresa es la velocidad final"""
    #se realiza un multiplicacion y el valor se le asigna a la variable vf
    vf=gravedad*tiempo
    #se regresa vf
    return vf

#se define la funcion edificio
def edificio(altura):
    """ La función edificio por medio de un cubo modificado se crea una estructura similar al un edificio.
    Se pide la altura del edificio. Lo que se regresa son todas las propiedades del edificio"""
    #se le asigna los valores a edificio (dimensiones, color, posición)
    edificio=box(size=((altura/4),altura,(altura/4)), pos=(-(altura/4),(altura/2),0), color=color.red)
    #se regresa edificio
    return edificio

#se define la funcion edificio
def edificio1(altura):
    """ La función edificio1 se crea por medio de un cubo modificado se crea una estructura similar al un edificio.
    Se pide la altura del edificio. Lo que se regresa son todas las propiedades del edificio"""
    #se le asigna los valores a edificio (dimensiones, color, posición)
    edificio1=box(size=((altura/4),altura,(altura/4)), pos=(-(altura/4),(altura/2),0), color=color.red)
    #se regresa edificio
    return edificio1

#se define la funcion piso
def piso(tamano):
    """ La función piso por se crea por medio de un cubo modificado, se crea una estructura similar al un al suelo.
    Se pide las dimensiones del suelo. Lo que se regresa son todas las propiedades del suelo"""
    #se le asigna los valores a piso (dimensiones, color, posición)
    piso=box(pos=(0,-1,0),size=(tamano*2,2,tamano*2), color=color.white)
    #se regresa tdpiso
    return piso
    
#se define la funcion piso
def piso1(tamano):
    """ La función piso por se crea por medio de un cubo modificado, se crea una estructura similar al un al suelo.
    Se pide las dimensiones del suelo. Lo que se regresa son todas las propiedades del suelo"""
    #se le asigna los valores a piso (dimensiones, color, posición)
    piso=box(pos=(0,-1,0),size=(tamano*5,2,tamano*5), color=color.white)
    #se regresa piso
    return piso

#se define la funcion piso
def piso2(tamano):
    """ La función piso por se crea por medio de un cubo modificado, se crea una estructura similar al un al suelo.
    Se pide las dimensiones del suelo. Lo que se regresa son todas las propiedades del suelo"""
    #se le asigna los valores a piso (dimensiones, color, posición)
    piso=box(pos=(3*(tamano/2),-1,0),size=(tamano*3,2,tamano*3), color=color.white)
    #se regresa piso
    return piso

#se define la funcion piso
def piso3(tamano):
    piso=box(pos=(tamano/2,-1,0),size=(tamano,2,tamano), color=color.white)
    """ La función piso por se crea por medio de un cubo modificado, se crea una estructura similar al un al suelo.
    Se pide las dimensiones del suelo. Lo que se regresa son todas las propiedades del suelo"""
    #se le asigna los valores a piso (dimensiones, color, posición)
    piso=box(pos=(0,-1,0),size=(tamano,2,tamano), color=color.white)
    #se regresa piso
    return piso

#se define la funcion pelota
def pelota(tamano):
    """La función pelota crea como su nombre lo dice una esfera.
    Se pide las dimensiones de la pelota. Lo que regresa son todas las propiedades de la esfera"""
    #se le asigna los valores a pelota(dimensiones, color, posicion)
    pelota=sphere(pos=(0,tamano,0),radius=tamano/50, color=color.blue)
    #se regresa pelota
    return pelota

#se define la funcion pelota1
def pelota1(tamano):
    """La función pelota1 crea como su nombre lo dice una esfera.
    Se pide las dimensiones de la pelota. Lo que regresa son todas las propiedades de la esfera"""
    #se le asigna los valores a pelota(dimensiones, color, posicion)
    pelota1=sphere(pos=(-tamano/4,tamano+(tamano/50),0),radius=tamano/50, color=color.blue)
    #se regresa pelota
    return pelota1

#se define la funcion pelota2
def pelota2(tamano):
    """La función pelota3 crea como su nombre lo dice una esfera.
    Se pide las dimensiones de la pelota. Lo que regresa son todas las propiedades de la esfera"""
    #se le asigna los valores a pelota(dimensiones, color, posicion)
    pelota2=sphere(pos=(0,tamano/20,0),radius=tamano/50, color=color.blue)
    #se regresa pelota
    return pelota2

#se define la funcion pelota3
def pelota3(tamano):
    """La función pelota3 crea como su nombre lo dice una esfera.
    Se pide las dimensiones de la pelota. Lo que regresa son todas las propiedades de la esfera"""
    #se le asigna los valores a pelota(dimensiones, color, posicion)
    pelota2=sphere(pos=(0,tamano/20,0),radius=tamano/50, color=color.blue)
    #se regresa pelota
    return pelota2

#se define la funcion pantalla
def pantalla(tamano):
    """ La función pantalla crea las dimensiones y la vista de la ventana de Vpython.
    Pide las dimensiones de la ventana y a partir de eso se coloca desde donde se va ha ver
    el simulador. Regresa todas las propiedades de la ventana"""
    #se le asigna los valores a scene(dimensiones, posicion de camara, efectos 3D, posicion)
    scene = display(title="Simulador de caida libre", width=1000, height=1000, x=0, y=0,
                center=(0,tamano/2,100), range=(tamano, tamano, tamano), stereo = 'redcyan')
    return scene

#se define la funcion pantalla1
def pantalla1(tamano):
    """ La función pantalla crea las dimensiones y la vista de la ventana de Vpython.
    Pide las dimensiones de la ventana y a partir de eso se coloca desde donde se va ha ver
    el simulador. Regresa todas las propiedades de la ventana"""
    #se le asigna los valores a scene(dimensiones, posicion de camara, efectos 3D, posicion)
    scene = display(title="Simulador de Proyección Horizontal", width=1000, height=1000, x=0, y=0,
                center=(0,tamano/2,100), range=(tamano*2, tamano*2, tamano*2), stereo = 'redcyan')
    #se regresa scene
    return scene

#se define la funcion pantalla2
def pantalla2(tamano):
    """ La función pantalla crea las dimensiones y la vista de la ventana de Vpython.
    Pide las dimensiones de la ventana y a partir de eso se coloca desde donde se va ha ver
    el simulador. Regresa todas las propiedades de la ventana"""
    #se le asigna los valores a scene(dimensiones, posicion de camara, efectos 3D, posicion)
    scene = display(title="Simulador de Tiro Parabolico 1", width=1000, height=1000, x=0, y=0,
                center=(tamano/4,tamano/2,tamano*3), range=(tamano, tamano, tamano), stereo = 'redcyan')
    #se regresa scene
    return scene

#se define la funcion pantalla3
def pantalla3():
    """ La función pantalla crea las dimensiones y la vista de la ventana de Vpython.
    Regresa todas las propiedades de la ventana"""
    #se le asigna los valores a scene(dimensiones, posicion de camara, efectos 3D, posicion)
    scene = display(title="Simulador de Tiro Parabolico 2", width=1000, height=1000, autocenter=1, stereo = 'redcyan')
    #se regresa scene
    return scene

#se define la funcion pantalla4
def pantalla4(tamano):
    """ La función pantalla crea las dimensiones y la vista de la ventana de Vpython.
    Pide las dimensiones de la ventana y a partir de eso se coloca desde donde se va ha ver
    el simulador. Regresa todas las propiedades de la ventana"""
    #se le asigna los valores a scene(dimensiones, posicion de camara, efectos 3D, posicion)
    scene = display(title="Simulador de Tiro Vertical", width=1000, height=1000, x=0, y=0,
                center=(0,tamano/2,tamano), range=(tamano, tamano, tamano), stereo = 'redcyan')
    #se regresa scene
    return scene

#se define la funcion IngVelocidad
def IngVelocidad():
    """ La función le pregunta al usuario la velocida inicial. Lo indica al usuario cuando el dato es erroneo
    Regresa la velocidad que ingreso el usuario convertida a variable tipo float"""
    #se le pide al usuario que ingrese la velocidad inicial
    vel=raw_input("Ingrese la velocidad inicial (m/s): ")
    #se asigna el valor de error
    error=True
    #se condione para que solo se pueden ingresar valores numericos positvios
    while error==True:
        #se intenta convertir la variable vel
        try:
            vel=float(vel)
            #se condiona que sea positivo
            if vel>0:
                #se regresa el valor de vel
                return vel
            else:
                #se le indica al usuario que su dato es incorrecto y se le vuelve a pedir
                print "LA VELOCIDAD NO PUEDE SER NEGATIVA, INGRESE NUEVAMENTE LA VELOCIDAD INICIAL"
                vel=raw_input("Ingrese la velocidad inicial: ")
        except:
            #se le indica al usuario que su dato es incorrecto y se le vuelve a pedir
            print "NO ES UN DATO VALIDO, INGRESELO NUEVAMENTE"
            vel=raw_input("Ingrese la velocidad inicial (m/s): ")

#se define la funcion desplazamientox
def desplazamientox(tiempo,velocidad):
    """La función realiza una multiplicación para encontrat el desplazamiento horizontal de un objeto
    La función pide como argumentos el tiempo y la velocidad. Regresa el desplazamiento horizontal."""
    #se realiza un operacion para encontrar el el desplzamiento horizaontal
    x=tiempo*velocidad
    #se regresa el valor de x
    return x

#se define la función alturamax
def alturamax(gravedad, veli):
    """ La función realiza una operación para enocontrar la altura maxima de un objeto.
    La función pide como objeto la gravedad y la velocidad inicial. Regresa la altura maxima"""
    #se realiza varias operacione para encontrar la altura maxima   
    maxima=(veli/2)*(veli/gravedad)
    #se regresa el valor de maxima
    return maxima

#se define la fucnion angulo
def angulo():
    """ La función le pregunta al usuario el angulo. Lo indica al usuario cuando el dato es erroneo (no se encuentra en el rango o no es dato numerico)
    Regresa el angulo que ingreso el usuario convertida a variable tipo float"""
    #se le pide al usuario el angulo
    angulo=raw_input("Ingrese la inclinacion (angulo entre 0 y 90 grados): ")
    #se asigna el valor de error
    error=True
    #se condiona para que solo sea un dato numerico y que este dentro del rango de 0 y 90 grados
    while error==True:
        try:
            #se intenta convertir 
            angulo=float(angulo)
            #se condiona para que solo sea un angulo entre 0 y 90
            if angulo>0 and angulo<91:
                #se regresa el valor de angulo
                return angulo
            else:
                #se le indica al usuario que ingreso un dato incorrecto y que lo vuelva a ingresar
                print "EL ANGULO NO PUEDE SER SER MENOR A 0 O MAYOR A 90, INGRESE NUEVAMENTE LA VELOCIDAD INICIAL"
                vel=raw_input("Ingrese la velocidad inicial: ")
        except:
            print "NO ES UN DATO VALIDO, INGRESELO NUEVAMENTE"
            angulo=raw_input("Ingrese la inclinación (angulo entre 0 y 90 grados): ")


#La definición de velocidad funciona de la misma manera que
#la definición del ángulo
def velocidad(x):
    """ La función velocidad regresa la velocidad inicial como una variable tipo float.
    Pide de argumento el el dato a revisar y convertir. Regresa el valor como un float"""
    while type(x)!=float:
        try:
            x=float(x)

            if type(x)==float:
                return x

            else:
                pass

        except:
            print "Ingrese un valor válido para la fuerza"
            print
            x=raw_input("¿Cuál es la velocidad inicial del objeto? (m/s): ")

#La definición de gravedad funciona de la misma manera que
#la definición del ángulo
def gravedad(x):
    """ La función gravedad regresa la gravedad como una variable tipo float.
    Pide de argumento el el dato a revisar y convertir. Regresa el valor como un float"""
    while type(x)!=float:
        try:
            x=float(x)

            if type(x)==float:
                return -x

            else:
                pass

        except:
            print "Ingrese un valor valido para la gravedad"
            print
            x=raw_input("¿Cuál es la aceleracion de la gravedad?: m/s")

