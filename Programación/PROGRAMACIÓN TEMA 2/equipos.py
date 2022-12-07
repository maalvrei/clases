import random
import pprint

alumnos = ['Javi' , 'Jose' , 'Miguel' , 'A.Muñoz' , 'Ana' , 'A.Sánchez' , 'Luciano' , 'Juan' , 'Dani' , 'Pablo' , 'Pedro' , 'P. González' , 'Carlos' , 'Adrián']

def crea_equipos(gente , miembros):
    if len(gente) < miembros:
        return gente

    if miembros == 0:
        return []

    random.shuffle(gente)

    numgrupos = len(gente)//miembros

    listas = []

    for i in range (numgrupos):

        lista = []

        for j in range (miembros):
            lista.append(gente.pop())

        listas.append(lista)

    for p in range(len(gente)): 
        listas[p].append(gente[p])

    return listas

pprint.pprint(crea_equipos(alumnos , 2))