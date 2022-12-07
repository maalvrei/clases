entrada = int(input('Dime un año y te diré si es bisiesto: '))
if entrada % 100==0 and entrada %400 == 0:
    print('El año es bisiesto')
elif entrada %100 == 0:
    print('El año no es bisiesto')
elif entrada % 4 == 0:
    print('El año es bisiesto')
else:
    print('El año no es bisiesto')