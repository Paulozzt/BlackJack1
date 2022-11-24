import random
from random import randrange
from time import sleep

#Creo una funcion para crear una baraja de Cartas
def crearbaraja(lista):
	i = 0
	cuenta = 1
	for i in range(52):
		lista[i] = cuenta
		cuenta = cuenta+1
		if cuenta == 14:
			cuenta = 1


#Creo una funcion para mezclar la baraja antes del juego
def mezclarbaraja(lista):
	posazar1 = 0
	posazar2 = 0
	memoria = 0
	i = 0
	for i in range(199):
		posazar1 = random.randrange(0,51)
		posazar2 = random.randrange(0,51)
		while posazar2 == posazar1:
			posazar2 = random.randrange(0,51)
			memoria = lista[posazar2]
			lista[posazar1] = memoria



#Creo una funcion para tomar una carta
def tomarcarta(lista, posicion):
	resultado = lista[posicion]
	if resultado>10:
		resultado = 10
	if resultado==1:
		print("Sacaste un As, cuanto quieres que valga 1 o 10?")
		resultado = int(input())
		while resultado!=1 and resultado!=10:
			print("valor no valido, reingrese")
			resultado = int(input())
			posicion = posicion + 1
		return resultado

#Creo una funcion de JUGAR para el Jugador
def tiradajugador(lista, posicion, puntuacion):
	respuesta = str()
	respuesta = " "
	plantado = bool()
	plantado = False
	while puntuacion<22 and plantado==False:
		puntuacion = puntuacion+tomarcarta(lista, posicion)
		print("tu puntuacion es ", puntuacion)
		if puntuacion<22:
			print("Te plantas? (S/N)")
			respuesta = input()
			while respuesta!="S" and respuesta!="N":
				print("Incorrecto, reingresa (S/N)")
				respuesta = input()
			if respuesta=="S":
				plantado = True
			else:
				plantado = False
	if puntuacion>21:
		print("Perdiste la Mano")
	else:
		print("Es turno del Crupier")


#Se repiten las funciones pero del lado del crupier, o sea la maquina
def tomarcartacrupier(lista, posicion, puntosjugador, puntoscrupier):

	resultado = int()
	resultado = lista[posicion]
	if resultado>10:
		resultado = 10
	if resultado==1:
		print("es un AS")
		if resultado+10>21:
			resultado = 1
			print("el crupier elige valor 1")
		else:
			resultado = 10
			print("El crupier elige un valor 10")
	return resultado

def tiradacrupier(lista, posicion, puntosjugador, puntoscrupier):

	respuesta = str()
	respuesta = ""
	plantado = bool()
	plantado = False
	while puntoscrupier<puntosjugador:
		puntoscrupier += puntoscrupier+tomarcartacrupier(lista,posicion,puntosjugador,puntoscrupier)
		print("la puntuacion acumulada es ", puntoscrupier)
		sleep(1)

	if puntoscrupier >= puntosjugador and puntoscrupier<22:
		print("Has Perdido")
	else:
		print("Has Ganado")

if __name__ == '__main__':

	baraja = [int() for ind0 in range(52)]
	i = 0
	cartas = 0
	puntos = 0
	puntoscrupier=0

	# Iniciar la baraja
	for i in range(52):
		baraja[i] = 0
	crearbaraja(baraja)
	mezclarbaraja(baraja)
	tiradajugador(baraja,cartas,puntos)
	if puntos<22:
		tiradacrupier(baraja,cartas,puntos, puntoscrupier)