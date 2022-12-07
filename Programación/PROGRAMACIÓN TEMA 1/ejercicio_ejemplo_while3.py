# Hacer un procedimiento que cuente el nº de vocales de cada una en una cadena
cadena = 'Esto es una cadena de texto'
vocales = {
    'a' : 0,
    'e' : 0,
    'i' : 0,
    'o' : 0,
    'u' : 0
}
letras = 'aeiou'
for c in cadena.lower():
    if c in letras:
        vocales[c] += 1
print(vocales)