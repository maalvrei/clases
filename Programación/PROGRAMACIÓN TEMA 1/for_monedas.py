import pprint
monedas = [500 , 200 , 100 , 50 , 20 , 10 , 5 , 2 , 1]
numero = 42_987
cantidad = numero
desglose ={}
for m in monedas:
    desglose [m] = numero // m
    numero = numero % m
pprint.pprint(desglose)
print(f'La cantidad {cantidad} se desglosa en: ')
for k,v in desglose.items():
    if v > 0:
        print(f'{v} de {k}')
claves = list(desglose.keys())