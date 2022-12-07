renta = int(input('¿Cuál es tu renta anual?:'))

tramo1 = renta < 10000
tramo2 = renta >= 10000 and renta < 20000
tramo3 = renta >= 20000 and renta < 35000
tramo4 = renta >= 35000 and renta < 60000
tramo5 = renta >= 60000

if tramo1:
    print('Tienes que pagar un 5 por ciento de impuestos')
elif tramo2:
    print('Tienes que pagar un 15 por ciento de impuestos')
elif tramo3:
    print('Tienes que pagar un 20 por ciento de impuestos')
elif tramo4:
    print('Tienes que pagar un 30 por ciento de impuestos')
elif tramo5:
    print('Tienes que pagar un 45 por ciento de impuestos')