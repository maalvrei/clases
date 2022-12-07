''' tabla = [
    [1,2,3],
    [4,5,6],
    [7,8,9]
]

for i in range (len(tabla)):
    for j in range(len(tabla[0])):
        print(tabla[i][j], end = '')
    print()
'''
import pprint
tablero = []
for f in range(10):
    fila = []
    for c in range(10):
        fila.append(0)
    tablero.append(fila)

while True:
    barco_f = input('Dime la fila (intro = Fin): ')
    if barco_f == '':
        break
    barco_f = int(barco_f)
    barco_c = int(input('Dime la columna: '))
    tablero[barco_f][barco_c] = 1

pprint.pprint(tablero)
objetivo_f = int(input('Dime la fila: '))
objetivo_c = int(input('Dime la columna: '))

if tablero[objetivo_f][objetivo_c] == 1:
    print('¡¡¡TOCADO!!!')
else:
    print('¡¡¡AGUA!!!')