"""MIGUEL ANGEL ALVAREZ REINA"""

def numero_mes(nombre_mes):
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

    try:
        return f'El mes {nombre_mes.lower()} tiene {dic_meses[nombre_mes.capitalize()]} días'
    except Exception:
        return 'El mes indicado no existe'


entrada = input('Dime un mes y te diré cuántos días tiene: ')
print(numero_mes(entrada))