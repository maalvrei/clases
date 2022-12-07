#Escribe un programa que pida dos números enteros, el segundo ha de ser mayor o igual que el primero. A continuación, el programa debe mostrar como resultado la suma de todos los enteros comprendidos entre el primero y el segundo incluidos ambos.

n1 = int(input('Dime un número entero: '))
n2 = int(input('Dime otro número entero mayor al anterior: '))
n3 = n2 - n1
lista = []

if n1 >= n2:
    print('El segundo número ha de ser mayor que el primero')
else:
    for i in range (n3+1):
        lista.append(n1 + i)

sumatorio = sum(lista)
print(f'Los números que hay entre {n1} y {n2} son:\n{lista}\nY la suma de ellos es: {sumatorio} ')