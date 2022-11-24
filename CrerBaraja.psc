Funcion crearBaraja(lista)
	Definir i, cuenta Como Entero
	i=0
	cuenta=1
	para i<-0 hasta 51 con paso 1 Hacer
		lista[i]=cuenta
		cuenta=cuenta + 1
		Si cuenta=14 Entonces
			cuenta=1
		FinSi
	FinPara
FinFuncion

Funcion mezclarBaraja(lista)
	Definir posAzar1, posAzar2 Como Entero
	posAzar1=0
	posAzar2=0
	memoria=0
	i=0
	para i<-0 hasta 199 Con Paso 1 Hacer
		posAzar1=azar(52)
		posAzar2=azar(52)
		Mientras posAzar2=posAzar1 Hacer
			posAzar2=azar(52)
		FinMientras
		memoria=lista[posAzar2]
		lista[posAzar1]=memoria
	FinPara
FinFuncion

	Funcion resultado<-tomarCarta(lista, posicion Por Referencia)
		Definir resultado Como Entero
		resultado <- lista[posicion]
		si resultado>10 Entonces
			resultado<-10
		FinSi
		Si resultado=1 Entonces
			Escribir "Sacaste un As, cuanto quieres que valga 1 o 10?"
			Leer resultado
			Mientras resultado<>1 y resultado<>10 Hacer
				Escribir "valor no valido, reingrese"
				leer resultado
			FinMientras
		FinSi
		posicion<-posicion+1
FinFuncion
	
Funcion tiradaJugador(lista,posicion Por Referencia, puntuacion Por Referencia)
	Definir respuesta como cadena 
	respuesta=""
	Definir plantado Como Logico
	plantado=Falso
	Mientras puntuacion<22 y plantado=Falso Hacer
		puntuacion=puntuacion+tomarCarta(lista,posicion)
		Escribir "tu puntuacion es " puntuacion
		si puntuacion<22 Entonces
			Escribir "Te plantas? (S/N)"
			leer respuesta
			Mientras respuesta<>"S" y respuesta<>"N" Hacer
				Escribir "Incorrecto, reingresa (S/N)"
				leer respuesta
			FinMientras
			si respuesta="S" Entonces
				plantado=Verdadero
			SiNo
				plantado=Falso
			FinSi
		FinSi
	FinMientras
	Si puntuacion>21 Entonces
		Escribir "Perdiste la Mano"
	SiNo
		Escribir "Es turno del Crupier"
	FinSi
FinFuncion

Funcion resultado<-tomarCartaCrupier(lista,posicion Por Referencia, puntosJugador Por Referencia, puntosCrupier Por Referencia)
	definir resultado Como Entero
	resultado=lista[posicion]
	Si resultado>10 Entonces
		resultado=10
	FinSi
	Si resultado=1 Entonces
		Escribir "es un AS"
		Si resultado+10>21 Entonces
			resultado=1
			Escribir "el crupier elige valor 1"
		SiNo
			resultado=10
			Escribir "El crupier elige un valor 10"
		FinSi
	FinSi
FinFuncion

Funcion tiradaCrupier(lista,posicion Por Referencia, puntosJugador Por Referencia, puntosCrupier Por Referencia)
	Definir respuesta como cadena
	respuesta=""
	definir plantado Como Logico
	plantado=Falso
	Mientras puntosCrupier<puntosJugador Hacer
		puntosCrupier = puntosCrupier+tomarCartaCrupier(lista,posicion,puntosJugador,puntosCrupier)
		Escribir "la puntuacion acumulada es " puntosCrupier
		Esperar 1 Segundos
	FinMientras
	
	Si puntosCrupier>=puntosJugador y puntosCrupier<22 Entonces
		Escribir "Has Perdido"
	SiNo
		Escribir "Has Ganado"
	FinSi
	
FinFuncion


Algoritmo CrerBaraja
	definir baraja, i, cartas, puntos como Entero;
	Dimension baraja[52];
	i=0
	cartas=0
	puntos=0
	//Iniciar la baraja
	Para i<-0 hasta 51 Con Paso 1 Hacer
		baraja[i]=0
	FinPara
	
	crearBaraja(baraja)
	mezclarBaraja(baraja)
	tiradaJugador(baraja,cartas,puntos)
	Si puntos<22 Entonces
		tiradaCrupier(baraja,cartas,puntos,puntosCrupier)
	FinSi
	
FinAlgoritmo
