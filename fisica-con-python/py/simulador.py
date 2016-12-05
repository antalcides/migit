# -*- coding: cp1252 -*-
#Samuel Rodas 12103, Eduardo Calderon, Javier Flores
#Este programa contiene las intruciiones para los simuladores de los problemas de fisica
#21/05/12

#se importa los modulos que se van a utilizar
from visual import *
import funciones
import math
from visual.graph import *

#se asigna el valor de seguir
seguir=True
#se imprime el titulo
print "Simulador de problemas de fisicas"
print "---------------------------------------"

#se condiona para que el programa se repita hasta que el usuario elija la opcion 6
while seguir==True:
    #se invoca la funcion menu
    op=funciones.menu()

    #si la opcion que elijio el usuario es 1
    if op=="1":
        #se imprime el titulo del simulador
        print ""
        print "Menu de Caida libre"
        print "------------------------"
        #se invocan las funciones necesarias para armar el escenario de la simulacion
        posinicial=funciones.Ingresar()
        scene = funciones.pantalla(posinicial)
        pelota=funciones.pelota(posinicial)
        piso=funciones.piso(posinicial)
        edificio=funciones.edificio(posinicial)

        #se asigna el valor de las variables necesarias en el proceso
        gravedad=9.8
        segundos=0
        dt=0.01
        fin=False
        
        #se coloca un label con la informacion de donde en que posicion se encuentra la pelota
        tiempo=label(pos=(0,posinicial,0), text=str(posinicial-pelota.radius))
        #se condiona para que la pelota continue en caida hasta que este en la posicion 0
        while not fin:
            #se coloca las veces que se va a repetir el proceso en un 1 segundo
            rate(100)
            #se vuelve invisible el label
            tiempo.visible=False
            #se elimina el label
            del tiempo
            #se suma los segundos
            segundos+=dt
            #se crea la formula para crear la caida libre
            altura=posinicial-(0.5*gravedad*(segundos)**2)
            #se le indica la nueva posicion de la pelota
            pelota.pos=vector(0,altura,0)
            #se muestra una label con la altura en que se encuentra la pelota
            tiempo=label(pos=(posinicial/3,posinicial/2,0), text="Altura: "+str(altura-pelota.radius)+" m")
            #se condiona para cuando este sobre el suelo deje de caer
            if altura-(posinicial/50)<=0:
                tiempo.visible=False
                del tiempo
                fin=True

        #se muestra etiquetas con la cantidad desegundos que se tardo y la velocidad al momento del impacto
        etiqueta=label(pos=(posinicial/3,posinicial,0), text="Tiempo: " + str(segundos)+ " m/s")
        vf=funciones.vf(gravedad, segundos)
        etiqueta1=label(pos=(posinicial/2,altura,0),text="Velocidad al momento del impacto: "+str(vf)+ " m/s")
        
    #se le indica que hacer al programa si el usuario elijio la opcion 2
    elif op=="2":
        #se imprime el titulo del simulador
        print ""
        print "Menu de Proyección Horizontal "
        print "--------------------------------"
        #se invoca las funciones que se van a utlizar
        posinicial=funciones.Ingresar()
        velocidad=funciones.IngVelocidad()
        scene = funciones.pantalla1(posinicial)
        pelota1=funciones.pelota2(posinicial)
        piso=funciones.piso1(posinicial*4)
        edificio=funciones.edificio1(posinicial)

        
        #se asignan el valor de las variables
        gravedad=9.8
        segundos=0
        dt=0.01
        fin=False
        #se muestra la posición de la pelota
        tiempo=label(pos=(0,posinicial,0), text=str(posinicial-pelota1.radius))
        #se condiona para que se repita el proceso 
        while not fin:
            #se le indica cuantas veces realizar el proceso
            rate(100)
            #se le indica que la label llamada tiempo sea invisible para luego eliminarla
            tiempo.visible=False
            #se elimina el label llamado tiempo
            del tiempo
            #se suman los segundos que pasan
            segundos+=dt
            #se le indica que altura es la formula de movimiento en el eje y
            altura=posinicial-(0.5*gravedad*(segundos)**2)
            #se le indiac que avance es la formula de movimiento en el eje x
            avance=velocidad*segundos
            #se le indica la posicion de la pelota
            pelota1.pos=vector(avance,altura,0)
            #se muestra un label con la altuta de la pelota
            tiempo=label(pos=(-posinicial,posinicial/2,0), text="Altura: "+str(altura-pelota1.radius)+" m")
            #se condiona que cuando este en la posicion cero deje de moverse
            if altura-(posinicial/50)<=0:
                tiempo.visible=False
                del tiempo
                fin=True
        #se muestra el label con el tiempo que esta en movimiento        
        etiqueta=label(pos=(posinicial/3,posinicial,0), text="Tiempo: " + str(segundos)+ " seg")
        #se invoca la funcion vf
        vf=funciones.vf(gravedad, segundos)
        #se muestra el label con la velocida al momento del impacto
        etiqueta1=label(pos=(posinicial,-altura*3,0),text="Velocidad al momento del impacto: "+str(vf)+ " m/s")
        #se invoca la funcion desplazamiento
        dh=funciones.desplazamientox(segundos, velocidad)
        #se muestra el label con el desplzamiento horizontal
        etiqueta2=label(pos=(-posinicial,-altura*3,0),text="Desplazamiento horizontal: " + str(dh) + " m")

    #se le indica que hacer al programa cuando el usuario elije la opcion tres
    elif op=="3":
        #se imprime el titulo del simulador
        print ""
        print "Menu de Tiro Parabolico 1"
        print "--------------------------"
        #se invocan las funciones que se van a utilizar
        velocidad=funciones.IngVelocidad()
        posinicial=velocidad*4
        angulo=funciones.angulo()
        scene = funciones.pantalla2(velocidad*3)
        pelota1=funciones.pelota2(velocidad*3)
        piso=funciones.piso2(velocidad*3)

        #se asigna el valor de las varibales
        gravedad=9.8
        segundos=0
        dt=0.01
        #se convierte los angulos de grados a radianes
        angulo=angulo*(pi/180)

        #se asigna el valor de las velocidades en los dos ejes por medio de la formulas
        velocidady=velocidad*sin(angulo)
        velocidadx=velocidad*cos(angulo)

        #se condiona para que se repita hasta que este en la posicion 0
        fin=False
        tiempo=label(pos=(0,posinicial,0), text=str(posinicial-pelota1.radius))
        while not fin:
            #se indica las veces que se va a repetir por segundo el proceso
            rate(100)
            #se esconde a label llamado tiempo para luego eliminarlo
            tiempo.visible=False
            #se elimina el label llamado tiempo
            del tiempo
            #se suman los segundos
            segundos+=dt
            #se asigna el valor de altura por medio de una formula
            altura=posinicial/50+velocidady*segundos-0.5*gravedad*segundos**2
            #se asigna el valor de avance por medio de una formula
            avance=velocidadx*segundos
            #se indica la posicion de la pelota
            pelota1.pos=vector(avance,altura,0)
            #se muestra un label con la altura de la pelota
            tiempo=label(pos=(posinicial/3,posinicial/2,0), text="Altura: "+str(altura-pelota1.radius)+" m")

            #se condiona para que se detenga cuando este en la posicio 0
            if altura-(posinicial/50)<=0:
                tiempo.visible=False
                del tiempo
                fin=True
        #se muestra el label con el tiempo de vuelo
        etiqueta=label(pos=(posinicial/3,-posinicial,0), text="Tiempo: " + str(segundos)+ " seg")
        #se invoca la fucnion vf
        vf=funciones.vf(gravedad, segundos)
        #se muetra un label con el desplzamiento horizontal
        etiqueta1=label(pos=(posinicial/3,posinicial,0), text="Desplazamiento horizontal: " + str(avance)+ " m")

    #se le indica que hacer al programa si el usuario elije la opcion cuatro
    elif op=="4":
        #Se pide al usuario ingresar el ángulo del proyectil
        ang=funciones.angulo()
        scene=funciones.pantalla3()
        print

        #Se pide al usuario ingresar la velocidad del proyectil
        vel=funciones.velocidad(raw_input("¿Cuál es la velocidad inicial del objeto?: "))
        print

        #Se pide al usuario ingresar la gravedad a la cual se quiere trabajar
        grav=funciones.gravedad(raw_input("¿Cuál es la aceleración de la gravedad?: "))
        print

        #El programa calcula la velocidad en "y" del proyectil
        vely=vel*math.sin(math.radians(ang))

        #El programa calcula la velocidad en "x" del proyectil
        velx=vel*math.cos(math.radians(ang))

        #El programa calcula el tiempo que pasa el proyectil en el aire
        tiempo=2*(-vely/grav)

        #El programa calcula la altura máxima del proyectil
        altura=vely*(tiempo/2)+(0.5*grav*((tiempo/2)**2))

        #El programa calcula el alcance máximo del proyectil
        alcance=velx*tiempo

        #Se asigna el valor del tiempo, de la altura y del alcance a otra variable
        #y dicha variable se convierte a un str, para que a la hora de poner un
        #label podamos controlar la cantidad de decimales que se muestran
        ti=tiempo
        ti=str(ti)
        al=altura
        al=str(al)
        alc=alcance
        alc=str(alc)


        #El programa devuelve los valores de todos los valores calculados
        #con el fin de informar al usuario de dichos valores
        print "La velocidad inicial en el eje y es: ", vely
        print "La velocidad inicial en el eje x es: ", velx
        print "El tiempo que se tarda el proyectil en volver a descender es: ",tiempo
        print "La altura máxima que alcanza el proyectil es: ", altura
        print "El alcanze el proyectil es: ", alcance

        #Se hacen unas variables vx y vy con un fin estético. Al poner los labels en
        #la pantalla es necesario agregarles una altura y un corrimiento para que no
        #queden sobre el gráfico. Para que estos valores de corrimiento no sean
        #estáticos, se hacen estas variables, para que cambien dependiendo de los valores
        #ingresados por el usuario
        vx=alcance/7
        vy=altura/2

        #Las variable shaft se crea también con un fin estético. Debido a que el grosor
        #de los cilindros depende de su longitud, estos serían demasiado gruesos si los
        #valores ingresados por el usuario son demasiado grandes. Por lo que la variable
        #shaft sirve para regular el grosor de los cilindros.
        shaft=alcance/(alcance+altura)

        #El autocenter sirve para que aunque la gráfica se vaya moviendo, esta siga
        #centrada
        
        
        #Hace que todas los gráficos se muestren

        #Se hacen los labels, que contienen la información del alcance, altura y
        #tiempo
        label(pos=(alcance-vx,-vx,0) , text="Alcance: "+alc[0:6]+"m")
        label(pos=(vy*3,altura+vy,0), text="Altura: "+al[0:6]+"m")
        label(pos=(alcance-vx,altura+vy,0), text="Tiempo: "+ti[0:6]+"s")

        #Se definen dos flechas de distintos colores, que son las que van a variar
        #dependiendo de la velocidad en "x" y "y" el proyectil
        flechay=arrow(pos=vector(0,0,0), axis=vector(0,0,0),color=color.red)
        flechax=arrow(pos=vector(0,0,0), axis=vector(0,0,0),color=color.blue)

        #Se hace un contador, que servirá como el tiempo transcurrido por el proyectil
        t=0
        #Mientras esta variable no sea exactamente igual al tiempo real de vuelo del
        #proyectil, la variable t seguirá contando
        while t<tiempo:
            t=t+0.01
            #El rate sirve para restringir al programa la cantidad de operaciones
            #que realize por segundo
            rate(300)

            #Se hacen dos variables de las velocidades "x" y "y" para ir variando
            #la longitud de las flechas que representan las velocidades
            velocidady=vely+(grav*t)
            velocidadx=velx

            #Se hacen dos variables de la posición en "x" y "y" que tiene el proyectil
            #dependiendo del tiempo
            posicionx=velx*t
            posiciony=vely*t+(0.5*grav*t**2)

            #Se varía la posición y longitud de las flechas que representan la
            #la velocidad del proyectil en cada eje
            flechay.pos=(posicionx,posiciony,0)
            flechax.pos=(posicionx,posiciony,0)
            flechay.axis=(0,velocidady,0)
            flechax.axis=(velocidadx,0,0)

            #Se varía la posición de los cilindros que representan un eje de coordenadas
            #"x" y "y"
            a=cylinder(pos=(posicionx,0,0), radius=shaft)
            b=cylinder(pos=(0,posiciony,0), radius=shaft)

            #Se varía la posición de un cilindro que demuestra el camino que recorre
            #el proyectil
            c=cylinder(pos=(posicionx,posiciony,0),radius=shaft)

    #se le indica que hacer al programa si el usuario elije la opcion cinco
    elif op=="5":
        #se imprime el titulo del simulador
        print ""
        print "Menu de Tito Vertical"
        print "--------------------------"
        #se invocan las funciones que van a utilizar
        velocidad=funciones.IngVelocidad()
        posinicial=velocidad*4
        scene = funciones.pantalla4(posinicial)
        pelota1=funciones.pelota3(posinicial)
        piso=funciones.piso3(posinicial)

        #se asigna el valor de las variables
        gravedad=9.8
        segundos=0
        angulo=90
        dt=0.01
        angulo=angulo*(pi/180)

        #se asigna el valor de las velocidades en x y y por medio de la formula
        velocidady=velocidad*sin(angulo)
        velocidadx=velocidad*cos(angulo)
        #se asigna el valor de fin
        fin=False
        #se muestra un label con la posicion de la pelota
        tiempo=label(pos=(0,posinicial,0), text=str(posinicial-pelota1.radius))
        #se condiona que se repita el proceso hasta que sea la posicion 0
        while not fin:
            #se asigna las veces que se va a repetir el proceso por segundo
            rate(100)
            #se hace invisble el label llamado tiempo para luego eliminarlo
            tiempo.visible=False
            #se elimina el label tiempo
            del tiempo
            #se suma los segundos
            segundos+=dt
            #se asigna el valor de  alura y avance por medio de una formula
            altura=posinicial/50+velocidady*segundos-0.5*gravedad*segundos**2
            avance=velocidadx*segundos

            #se indica la posicion de la pelota
            pelota1.pos=vector(avance,altura,0)
            #se muestra la altura de la pelota
            tiempo=label(pos=(posinicial/3,posinicial/2,0), text="Altura: "+str(altura-pelota1.radius)+" m")

            
            if altura-(posinicial/50)<=0:
                tiempo.visible=False
                del tiempo
                fin=True

        #se muestras los label con el tiempo y la altura maxima    
        etiqueta=label(pos=(posinicial/3,posinicial,0), text="Tiempo: " + str(segundos)+ " seg")
        maxima=funciones.alturamax(gravedad, velocidad)
        etiqueta2=label(pos=(-posinicial,posinicial,0), text="Altura Maxima: " + str(maxima)+ " m")

    elif op=="6":
        #se asigna las caracteristicas de la ventana
        scene=display(title="FIN", stereo = 'redcyan',width=1000, height=1000)
        #se muestra un texto que indica el fin del programa
        text(text='Fin del programa',
        align='center', depth=-03, color=color.blue, axis=(1,0,-0.5))
        ball = sphere(pos=(0,4,0), color=color.green)
        print "FIN"
        break
        
