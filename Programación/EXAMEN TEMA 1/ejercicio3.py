"""MIGUEL ANGEL ALVAREZ REINA"""

def cifras():
    lista_numeros = []
    while True:
        try:
            entrada_cifras = input('Dime números enteros (pulsa espacio para terminar): ')
            if entrada_cifras == '':
                if lista_numeros == []:
                    print('Debes introducir mínimo un número entero')
                else:
                    print('Ya has terminado de introducir valores')
                    break
            else:
                lista_numeros.append(int(entrada_cifras))
        except ValueError:
            print('Debe ser un entero')
    return lista_numeros

def cifras_calculos():
    numeros = cifras()
    lista_pares = []
    lista_impares = []
    for n in numeros:
        if n % 2 == 0:
            lista_pares.append(n)
        else:
            lista_impares.append(n)
    
    return f'Los números pares son {lista_pares} y su suma es {sum(lista_pares)}\nLos números impares son {lista_impares} y su suma es {sum(lista_impares)}'

def main():
    return cifras_calculos()

print(main())