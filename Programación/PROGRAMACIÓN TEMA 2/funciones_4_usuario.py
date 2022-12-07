def encadenar(separador, *args): # aquí el asterisco lo que indica es que args es una sentencia de valores 
    return separador.join(args)
palabras = []
while True:
    entrada = input('Dime una palabra: ')
    if entrada == '':
        break
    else:
        palabras.append(entrada)
sep = input('Dime un separador: ')
print(encadenar(sep,*palabras)) #poniendo aqui el * lo que hacemos es desempaquetar la tupla o la lista