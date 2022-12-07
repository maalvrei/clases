n1=int(input('Escribe el dividendo'))
n2=int(input('Escribe el divisor'))
if n2 == 0:
    print('No se puede hacer la división')
else:
    co=n1//n2
    rest=n1%n2
    if rest == 0:
        print(f'El resultado es entero, el cociente es {co}')
    else:
        print(f'El resultado no es entero, el cociente es {co} y el resto es {rest}')