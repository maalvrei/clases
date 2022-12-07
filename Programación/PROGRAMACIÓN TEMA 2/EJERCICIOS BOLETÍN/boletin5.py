'''
En este ejercicio, creará un programa que calcule el promedio de una colección de valores ingresados por el usuario. 

El usuario ingresará 0 como valor centinela para indicar que no se proporcionarán más valores. 

Su programa debería mostrar un mensaje de error apropiado si el primer valor ingresado por el usuario es 0.
'''
valores = []
def promedio (*numeros):
    cont_num = len(numeros)
    sumavalores = sum(numeros)
    promedio_valores = sumavalores/(cont_num - 1)
    return promedio_valores
while True:
    entrada = int(input('Dime un número: '))
    valores.append(entrada)
    if valores[0] == 0:
        print('El primer número no puede ser 0')
        break
    else:
        if entrada > 0:
            valores.append(entrada)
        else:
            if entrada == 0:
                print('Los valores paran aquí')
                print(f'El promedio de tus valores es {(promedio(*valores))}')
                break
            else:
                valores.append(entrada)