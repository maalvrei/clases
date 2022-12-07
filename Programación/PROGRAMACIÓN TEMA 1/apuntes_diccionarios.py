#son una coleccion de elementos en forma clave valor clave valor

d = {
    'uno': 'primero',
    'dos': 'segundo'
}
print(d['uno'])
#esto es un diccionario
#añadir elementos al diccionario:

d['tres'] = 'tercero'

#acceder a un elemento concreto de un diccionario

print(d['uno'])

#saber qué keys o valores tenemos en el diccionario 

print(list(d.keys()))

#como eliminar una entrada de un diccionario: del(d['tres'])

