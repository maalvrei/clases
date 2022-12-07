pregunta1 = str(input('¿Quieres calcular el área de un círculo o de un triángulo? Respode C para triángulo o T para círculo: '))


if pregunta1 == 'c':
    pideareacir = int(input('Dime el radio del círculo: '))
    print(pideareacir)
    areacir = pideareacir**2*3.14
    print(f'El área del círculo es {areacir}')
elif pregunta1 == 'C':
    pideareacir = int(input('Dime el radio del círculo: '))
    print(pideareacir)
    areacir = pideareacir**2*3.14
    print(f'El área del círculo es {areacir}')
elif pregunta1 == 't':
    pideareatri = int(input('Dime la base del triángulo: '))
    print(pideareatri)
    pideareatri2 = int(input('Dime la altura del triángulo: '))
    print(pideareatri2)
    areatri1 = pideareatri * pideareatri2
    areatri2 = areatri1/2
    print(f'El área del triángulo es {areatri2}')
elif pregunta1 == 'T':
    pideareatri = int(input('Dime la base del triángulo: '))
    print(pideareatri)
    pideareatri2 = int(input('Dime la altura del triángulo: '))
    print(pideareatri2)
    areatri1 = pideareatri * pideareatri2
    areatri2 = areatri1/2
    print(f'El área del triángulo es {areatri2}')