def encadenar(separador, *args):
    lista = list(args)
    return separador.join(lista)

print(encadenar('_' , 'hola' , 'hola'))
