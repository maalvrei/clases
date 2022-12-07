#split
cadena = 'esta es una tarde*# estupenda para aprender python'
print(cadena)

palabras = cadena.split()
print(palabras)

#join
unidas = '-.-'.join(palabras)
print(unidas)

#find
posicion = cadena.find('#')
print(posicion)
print(cadena[:posicion - 1])
print(cadena[posicion + 2:])