cantnum = int(input('¿Cuántos números vas a introducir?: '))
lista =[]
for i in range (cantnum):
    mensaje = float(input(f'Introduce el número {i+1}: '))
    print(mensaje)
    lista.append(mensaje)
print(f'Los números introducidos son:\n{lista}')
sumatorio = sum(lista)
print(f'La suma de todos esos números es {sumatorio}')

