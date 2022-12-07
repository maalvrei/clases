"""
8.- Suma de números
--------------------
Escriba un programa que solicite al usuario que ingrese 5 números, separados por comas. 

Calcule la suma de los 5 números y muestre los números ingresados y la suma al usuario.
"""
entrada = input('Dime cinco números separados por coma: ')

def numeritos(cadena):
    cadena = cadena.split(',')
    n = []
    for i in range(len(cadena)):
        n.append((int(cadena[i])))
    
    return f'Los números que has introducido son: \n{cadena} \nY la suma de todos ellos es {sum(n)}'

print(numeritos(entrada))