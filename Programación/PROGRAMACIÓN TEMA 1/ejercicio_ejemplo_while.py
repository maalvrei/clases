# Hacer un procedimiento que cuente el nº de vocales de cada una en una cadena

cadena = 'aeiouAEIOU'
vocales = ['a' , 'e' , 'i' , 'o' , 'u']
cuenta_a = 0
cuenta_e = 0
cuenta_i = 0
cuenta_o = 0
cuenta_u = 0
for c in cadena.lower():
    if c == vocales[0]:
        cuenta_a += 1
    elif c == vocales[1]:
        cuenta_e += 1
    elif c == vocales[2]:
        cuenta_i += 1
    elif c == vocales[3]:
        cuenta_o += 1
    elif c == vocales[4]:
        cuenta_u+= 1
mensaje = f'Tu frase tiene {cuenta_a} vocales a, {cuenta_e} vocales e, {cuenta_i} vocales i, {cuenta_o} vocales o y {cuenta_u} vocales u'
print(mensaje)