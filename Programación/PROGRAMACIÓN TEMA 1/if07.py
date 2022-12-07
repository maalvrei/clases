import math
a = float(input('Escribe el valor de la a: '))
b = float(input('Escribe el valor de la b: '))
c = float(input('Escribe el valor de la c: '))
x = ('')
dentroraiz = b*b-4*a*c
if a == 0:
    form = x = (-b/c)
    print(f'La x vale {x}')
else:
    if dentroraiz < 0:
        print ('No tiene solucion')
    else:
         formula1 = -b+math.sqrt(dentroraiz)
         x1=formula1/2*a
         formula2 = -b-math.sqrt(dentroraiz)
         x2 = formula2/2*a
         print(f'La solución es x1 = {x1} y x2 = {x2}')
        