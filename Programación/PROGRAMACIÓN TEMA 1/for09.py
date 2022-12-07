cantnum = int(input('¿Cuántos números vas a introducir?: '))
listaneg = []
listapos = []
for i in range (cantnum):
    mensaje = float(input(f'Introduce el número {i+1}: '))
    print(mensaje)
    if mensaje < 0:
        listaneg.append(mensaje)
    elif mensaje >= 0:
        listapos.append(mensaje)
cnn = len(listaneg)
print(f'Has introducido {cnn} números negativos')
