''' 
La duración de un mes varía de 28 a 31 días. 

En este ejercicio, creará un programa que lea el nombre de un mes del usuario como una cadena. 

Entonces su programa debería mostrar el número de días en ese mes. 

Muestre "28 o 29 días" para febrero para que se aborden los años bisiestos.
'''

def meses_y_días(mes):
    dic_meses = {
        'Enero' : 31,
        'Febrero' : '28 o 29',
        'Marzo' : 31,
        'Abril' : 30,
        'Mayo' : 31,
        'Junio' : 30,
        'Julio' : 31,
        'Agosto' : 31,
        'Septiembre' : 30,
        'Octubre' : 31,
        'Noviembre' : 30,
        'Diciembre' : 31
    }
    return dic_meses[mes]

entermes = input('Dime un mes y te diré cuántos días tiene: ')
print(f'El mes {entermes} tiene {meses_y_días(entermes.capitalize())} días')