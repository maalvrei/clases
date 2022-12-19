'''Escriba na funcion que reciba coom parámetro una cadena de texto y de vuelva una lista con las vocales que haya en dicha cadena. '''



'''def devuelve__vocales():
    cadena = str(input('Dime una cadena de texto: '))
    vocales = []
    letras = 'aeiou'
    
    for c in cadena.lower():
        if c in letras:
            vocales.append(letras)
            print(vocales)

devuelve__vocales()'''

'''def devuelve_vocales(cadena):
    vocales = ['a','e','i','o','u']
    salida = []
    for letra in cadena:
        if letra.lower in vocales and letra.lower not in salida:
            salida.append(letra)
    return salida

print(devuelve_vocales('hola'))'''


'''Recibe una cadena y devuelve una cadena con los códigos ascii de las letras'''
cad = input('Dime un texto: ')
def txt_ascii(cadena):
    salida = []
    for i in cadena:
        salida.append(str(ord(i)))
    
    return ' '.join(salida)


print(txt_ascii(cad))

def ascii_txt(cadena):
    salida = ''
    cadena = cadena.split(' ')
    for c in cadena:
        salida += chr(int(c))
    return salida

print(ascii_txt(txt_ascii(cad)))
