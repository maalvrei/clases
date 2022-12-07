#los tipos de datos son el formato que tienen los datos que vamos a manejar, x ejemplo hexadecimal es uno

#bin convierte a binario y hex a hexadecimal son funciones de conversión, float convierte cadena a numero
#EJERCICIO
#entrada cadena= 'Esto es un experimento con cadenas' a salida 'Esto es un EXPERIMENTO con cadenas'
#vamos a romperlo en partes para modificar una y unirlas


cadena = 'Esto es un experimento con cadenas'
palabra = 'experimento'
longitud = len(palabra)
pto1 = cadena.find(palabra)
pto2 = pto1 + longitud
print(pto1)
print(pto2)

parte1 = cadena[:pto1]
parte2 = palabra.upper()
parte3 = cadena[pto2:]

resultado = parte1 + parte2 + parte3

print(resultado)

trozo = cadena.split("es")
print(trozo)