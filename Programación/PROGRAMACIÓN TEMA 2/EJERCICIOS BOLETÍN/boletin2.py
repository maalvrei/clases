'''
Escriba un programa que determine el nombre de una forma a partir de su número de lados.
 
Lea la cantidad de lados del usuario y luego informe el nombre apropiado como parte de un mensaje significativo. 

Su programa debe admitir formas con entre 3 y 10 lados (incluidos). 

Si se ingresa un número de lados fuera de este rango, su programa debería mostrar un mensaje de error apropiado.
'''

def figuras (lados):
    dic_figuras={
        3 : 'triángulo',
        4 : 'cuadrado',
        5 : 'pentágono',
        6 : 'hexágono',
        7 : 'septágono',
        8 : 'octágono',
        9 : 'enecágono',
        10 : 'decágono'
    }
    if lados < 3 or lados > 10:
        return 'El número de lados ha de estar comprendido entre 3 y 10'
    else:
        return f'Tu figura es un {dic_figuras[nlados]}'

nlados = int(input('Dime cuántos lados tiene tu figura: '))
print(figuras(nlados))