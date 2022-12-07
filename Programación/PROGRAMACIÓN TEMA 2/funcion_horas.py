"""
Hacer una función que reciba una hora en formato hh:mm:ss
Debe devolver la cantidad de segundos de dicha hora
"""
entrada = input('Dime una hora en formato hh:mm:ss : ')
def segundos(hora):
    lista = hora.split(':')
    h = int(lista[0])
    m = int(lista[1])
    s = int(lista[2])
    if h >= 24 or m > 59 or s > 59:
        return '¡Eso no puede ser!'
    else: 
        return h*60*60 + m*60 + s

print(segundos(entrada))

"""
list1 = inicio.split(':')
    h1 = int(list1[0])
    m1 = int(list1[1])
    s1 = int(list1[2])
    list2 = fin.split(':')
    h2 = int(list2[0])
    m2 = int(list2[1])
    s2 = int(list2[2])
    s11 = h1*60*60 + m1*60 + s1
    s22 = h2*60*60 + m2*60 + s2
    if s11 > s22:
        s = s11 - s22
        return (f'{s // 60} , {s%60}')
"""