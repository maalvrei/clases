#Como entrada, pedir un número al usuario
#Como salida, imprimir lo siguiente: "El doble de <20> son <40>", "El cuadrado de <20> son <400>"
entrada = input('Dime un número: ')
entero = int(entrada)
doble = 2 * entero
cuadrado = entero * entero
print('El doble de' , entrada , 'es' , doble)
print('El cuadrado de' , entrada , 'es' , cuadrado)

#Otra forma con la cadena f, mas recomendable, ya que con f podemos añadir el valor de una variable en una cadena concreta
mensaje = f'El doble de {entero} es {doble}'
print(mensaje)