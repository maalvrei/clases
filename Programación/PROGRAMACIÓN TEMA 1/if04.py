#Escribe un programa que pida dos números enteros y que a continuación indique si el número mayor es múltiplo del menor.

n1 = int(input('Escribe un número: '))
n2 = int(input('Escribe otro número: '))
div1 = n1%n2
div2 = n2%n1
if n1 == n2:
    print('¡Un mismo número siempre es múltiplo de si mismo!')
else:
    if n1 > n2:
        if div1 == 0:
            print(f'El número mayor, en este caso {n1}, es múltiplo de {n2}')
        else:
            print(f'El número mayor, en este caso {n1}, no es múltiplo de {n2} ')
    else:
        if div2 == 0:
            print(f'El número mayor, en este caso {n2}, es múltiplo de {n1}')
        else:
            print(f'El número mayor, en este caso {n2}, no es múltiplo de {n1}')
