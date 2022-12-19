"""MIGUEL ANGEL ALVAREZ REINA"""

def numero_palabras():
    nombre_archivo = 'archivo.txt'
    ruta_base = 'C:\\Users\\Tarde\\Desktop\\'
    datos = ruta_base + nombre_archivo
    with open(datos, 'r') as a:
        parrafos = a.readline()
    if parrafos == '':
        return 'El archivo está vacío'
    else:
        parrafos = parrafos.strip()
        parrafos = parrafos.split(' ')
        return f'Ese archivo contiene {(len(parrafos))} palabras'


print(numero_palabras())