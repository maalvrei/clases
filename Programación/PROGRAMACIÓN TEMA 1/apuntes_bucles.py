#los bucles son estructuras de repeticion, los hay establecidos por un contador que sabemos las vueltas que va a dar, y aquellos ejecutados por una condición, que mientras la condición se cumpla seguirán repitiéndose
#for= contador, sabemos cuantas vueltas va a dar
#while= no sabemos cuantas vueltas va a dar, hasta que se cumpla la condicion o hasta que se deje de cumplir

#for varible (la variable de control del bucle) (inicio, fin, salto)
import pprint

for j in range(0,50,2):
    print(f'La j vale {j}')

#otra forma de hacer un bucle, así podemos llenar una lista con for

lista=[]
for i in range(20):
    lista.append(f'Elemento {i}')
pprint.pprint(lista)

#recorrer esta lista

"""for lista in range(20):
    print(lista)
"""

#pero asi no es! es:

largo = len(lista)
for i in range(largo):
    print(lista[i])


#con esto podemos recorrer cada lista, tupla o diccionario más fácil
for x in lista:
    print(x)