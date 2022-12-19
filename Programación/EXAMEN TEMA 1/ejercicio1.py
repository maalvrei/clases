"""MIGUEL ANGEL ALVAREZ REINA"""

def articulos_y_precios():
    dicc = {}
    while True:
        articulo = input('Dime un artículo (pulsa espacio para parar): ')
        if articulo == '':
            print('Has terminado de introducir artículos.')
            break
        else:
            try:
                precio = float(input('Dime un precio: '))
                dicc[articulo] = precio
            except Exception:
                print('Debe ser una cifra numérica')
                precio = int(input('Dime un precio: '))
                dicc[articulo] = precio
    elementos = dicc.items()
    for k, v in elementos:
        print(f'El producto "{k}" tiene un precio de {v} euros')
    return dicc


articulos_y_precios()