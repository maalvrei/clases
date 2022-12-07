import pprint
#pprint para imprimir en bonito
coches = {
    '1234-FRD' : 'Opel Corsa',
    '0987-SDR' : 'Ford Fiesta',
    '1929-PLK' : 'Ford Kuga'
}

coches['7777-HDL'] = 'Mercedes Clase A'

print(coches)
print(list(coches.keys())) #imprime solo las matriculas en lista

pprint.pprint(coches) #con pprint. llamamos a la biblioteca y con .pprint la funcion de esa biblioteca