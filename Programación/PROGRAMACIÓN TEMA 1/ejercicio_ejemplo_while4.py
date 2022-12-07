# Hacer un procedimiento que cuente el nº de vocales de cada una en una cadena
cadena = 'Esto es una cadena de texto'
vocales = {}
letras = 'aeiou'
for c in letras:
    vocales[c] = cadena.lower().count(c)
print(vocales)