'''
Comúnmente se dice que un año humano equivale a 7 años caninos. 

Sin embargo, esta simple conversión no reconoce que los perros alcanzan la edad adulta en aproximadamente dos años. 

Como resultado, algunas personas creen que es mejor contar cada uno de los dos primeros años humanos como 10,5 años caninos y luego contar cada año humano adicional como 4 años caninos.

Escriba un programa que implemente la conversión de años humanos a años caninos descrita en el párrafo anterior. 

Asegúrese de que su programa funcione correctamente para conversiones de menos de dos años humanos y para conversiones de dos o más años humanos. 

Su programa debería mostrar un mensaje de error apropiado si el usuario ingresa un número negativo.
'''
nenter = int(input('Dime qué edad tiene tu perro: '))
def edadperro(años):
    if años <=2:
        return años * 10.5
    if años > 2:
        num = años - 2
        return num *7 + 2 * 10.5
print(f'Tu perro tiene {edadperro(nenter)} años')