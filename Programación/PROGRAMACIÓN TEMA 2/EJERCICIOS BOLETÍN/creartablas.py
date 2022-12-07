def pinta_tabla():
    filas = 10
    cols = 10
    tabla = [
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9],
        [1,2,3,4,5,6,7,8,9]
    ]
    for f in tabla:
        for c in f:
            print(f'{c}\t', end = '')
        print()
pinta_tabla()