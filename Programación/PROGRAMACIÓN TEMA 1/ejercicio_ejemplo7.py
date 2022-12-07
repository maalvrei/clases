nota = int(input('Dime tu nota en el exámen'))
if nota < 5:
    print('Tienes un suspenso')
elif nota < 7:
    print('Tienes un aprobado')
elif nota < 9:
    print('Tienes un notable')
elif nota < 10:
    print('Tienes un sobresaliente')
    
#otra manera

nota2 = int(input('Dime tu nota: '))
resultado=''
if nota2 < 5:
    resultado = 'SUSPENSO'
else:
    if nota2 < 7:
        resultado = 'APROBADO'
    else:
        if nota2 <9:
            resultado = 'NOTABLE'
        else:
            resultado = 'SOBRESALIENTE'
print(resultado)