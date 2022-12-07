# convertir una cadena a otra cadena donde cada caracter es un parentesis abierto si aparece una vez o es cerrado si aparece mas de una vez
cadena = 'Ese Haze qué hace te juro por mis niños que nunca probé la base'
def funcion_parentesis(word):
    lword = word.lower()
    salida = ''
    for i in lword:
        ct = lword.count(i)
        if ct  == 1:
            salida += '('
        else:
            salida += ')'
    return salida

print(funcion_parentesis(cadena))
