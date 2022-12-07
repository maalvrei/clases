import math
a = float(input('Escribe el valor de la a: '))
b = float(input('Escribe el valor de la b: '))
c = float(input('Escribe el valor de la c: '))

if a == 0:
    if b == 0:
        print('No tiene solución')
    else:
        xa0 = -c/b
        print(f'Sólo tiene una solución, {xa0}')
else:
    dentroraiz = b*b-4*a*c
    if dentroraiz <=0:
        print('No tiene solución')
    else:
        formula1 = -b+math.sqrt(dentroraiz)
        x1 = formula1/2*a
        formula2 = -b-math.sqrt(dentroraiz)
        x2 = formula2/2*a
        print(f'La x1 es {x1} y la x2 es {x2}')
