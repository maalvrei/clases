n1 = int(input('Dime el primer número: '))
n2 = int(input('Dime el segundo número: '))
n3 = int(input('Dime el tercer número: '))

if n1 == n2 and n2 == n3:
    print('Es el mismo número tres veces')
elif n1 == n2 and n1 != n3:
    print('Has dicho uno de los números dos veces')
elif n1 != n2 and n1 == n3:
    print('Has dicho uno de los números dos veces')
elif n1 != n2 and n2 == n3:
    print('Has dicho uno de los números dos veces')
elif n1 != n2 and n1 != n3:
    print('No has repetido ningún número')