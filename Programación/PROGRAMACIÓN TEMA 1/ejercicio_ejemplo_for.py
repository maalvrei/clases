# de una lista de palabras, encontrar la más larga e imprimirla

palabras = ['Hola', 'adios', 'waticonteya', 'zumito', 'propaganda']
indice_max = -1
max_len = 0
for i in range(len(palabras)):
    longi = len(palabras[i])
    if longi > max_len:
        indice_max = i
        max_len = longi
print(palabras[indice_max])