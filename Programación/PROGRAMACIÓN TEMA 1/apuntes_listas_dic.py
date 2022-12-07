import pprint
#en py podemos meter cualquier cosa en una lista, incluso otra lista 
mi_lista=[1,2,3,4,'hola',True,['a','b','c',]]
#otra manera de meter cosas en una lista
mi_lista.append('otro')
#cada append sólo introduce un elemento
mi_lista.extend([7,8,9])
#extend sirve para añadir elementos iterables, como otra lista, una tupla...
#las listas añaden elementos siempre al final, para añadir un elemento en otra posicion:
mi_lista.insert(5,'nuevo dato')
#donde 5 es la posicion del valor siguiente a donde queremos introducir el elemento
#los numeros y los valores booleanos no llevan comillas, el texto si porque se llaman  literales
mi_lista=mi_lista + ['k', 'l', 'm'] + [1,4,7]
#las listas se pueden sumar
#el .pop te devuelve el ultimo valor y lo elimina de la lista
x = mi_lista.pop()
#para devolver el valor del pop, solo tenemos q hacer append de la variable que hemos usado para ello, en este caso X
#para leer un elemento de una lista sin eliminarlo, podemos crear un lector por ejemplo:
lector=mi_lista[5] #y si imprimimos lector nos dará la posicion 5 de la lista
print(x)
print(mi_lista)

############### tuplas ################
#las tuplas llevan parentesis

mitupla=(1,2,3,4,1,1,1) #una tupla vacia
#mitupla.count() cuenta cuantas veces se repite un elemento en una lista, para saber el total de elementos usamos len
largo=len(mitupla)
elem=mitupla.count(1)
#para hacer un lector de la tupla:
lectortupla=mitupla[3]
print('largo: ',largo)
print('elem: ', elem)
print(lectortupla)

#las tuplas pueden no llevar parentesis
#para hacer una tupla de un solo elemento hay que poner una coma solamente despues del elemento unico que queremos añadir

tupla1=(1,) #la coma hace que se interprete como una tupla de un solo elemento

#para crear una lista podemos usar tambien el comando list() al cual le podemos pasar hasta una tupla pa hacerla lista, por ejemplo, para imprimir la tupla en forma de lista:

print(list(mitupla))

########### diccionarios ############

dicc={
    1:1,
    2:4,
    3:9,
    4:16,
    5:25
} #con llaves!

print(dicc[4]) #con esto, imprimimos el elemento cuya clave es la 4, y hay que decirle el nombre de la clave, no la posicion

#para añadir un elemento al diccionario:

dicc[6]=36
print(dicc) #y ya nos sale con el nuevo elemento

#otra forma, con la funcion dict()

#dicc=dict() esta la utilizamos cuando vayamos a llenar el diccionario con unos valores que nos vienen dados de otro sitio

#otro tipo de diccionarios, teniendo en cuenta q esto lo suyo es hacerlo como un bucle:

persona1={
    'nombre':'paco',
    'dni':'494545444d'
}
persona2={
    'nombre':'juan',
    'dni':'494545744d'
}
personas={
    1: persona1,
    2: persona2}

pprint.pprint(personas) #aqui aparece pprint dos veces pero no confundir, primero indicamos el nombre de la biblioteca y despues el nombre de la funcion, en este caso coinciden ambos nombres pero no tiene que ser asi!
