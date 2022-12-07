import math


num = int(input('Introduce un número mayor que 0: '))
lista = []
if num < 0:
    print('El número ha de ser mayor que cero')
elif num == 0:
    print('El factorial de cero es 1')
else:
    for i in range(num):
        lista.append(num-i)

fac = math.prod(lista)
print(f'El factorial de {num} es {fac}')