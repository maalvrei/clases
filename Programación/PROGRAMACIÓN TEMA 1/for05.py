n1 = int(input('Dame un número entero: '))
n2 = int(input('Dame otro número entero que sea igual o mayor: '))

if n2 < n1:
    print('No podemos hacer nada con eso')
else:
    for i in range (n1, n2+1):
        if i % 2 == 0:
            print(f'El número {i} es par')
        else:
            print(f'El número {i} es impar')