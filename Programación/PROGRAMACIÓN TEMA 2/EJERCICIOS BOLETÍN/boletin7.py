"""
Un zoológico en particular determina el precio de la entrada según la edad del visitante. 

Los huéspedes de 2 años de edad y menos se admiten sin cargo. 

Niños entre 3 y 12 años cuestan $14.00. 

Las personas mayores de 65 años o más cuestan $ 18.00. 

La entrada para todos los demás invitados es de $23.00.

Cree un programa que comience leyendo las edades de todos los invitados en un grupo del usuario, con una edad ingresada en cada línea. 

El usuario ingresará una línea en blanco para indicar que no hay más invitados en el grupo. 

Luego, su programa debe mostrar el costo de admisión para el grupo con un mensaje apropiado. 

El costo debe mostrarse con dos decimales.
"""

def edades():
    edadeslist = []
    while True:
        entrada = input('¿Cuáles son las edades de los visitantes?')
        if entrada == '':
            break
        else:
            edadeslist.append(int(entrada))
    return(edadeslist)

def calculo(*edad):
    suma = []
    for e in edad:
        if e <= 2:
            suma.append(0)
        elif e >=3 and e <= 12:
            suma.append(14)
        elif e >= 65:
            suma.append(18)
        else:
            suma.append(23)
    
    return f'El total a pagar es de {sum(suma)}'

print(calculo(*edades()))