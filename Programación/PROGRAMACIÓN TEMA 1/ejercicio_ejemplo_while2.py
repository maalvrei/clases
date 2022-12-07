# Hacer un procedimiento que cuente el nº de vocales de cada una en una cadena

cadena = 'aeiouAEIOU'

cuenta_a = 0
cuenta_e = 0
cuenta_i = 0
cuenta_o = 0
cuenta_u = 0

for c in cadena.lower():
    if c == 'a':
        cuenta_a += 1
    elif c == 'e':
        cuenta_e += 1
    elif c == 'i':
        cuenta_i += 1
    elif c == 'o':
        cuenta_o += 1
    elif c == 'u':
        cuenta_u+= 1
mensaje = f'Tu frase tiene {cuenta_a} vocales a, {cuenta_e} vocales e, {cuenta_i} vocales i, {cuenta_o} vocales o y {cuenta_u} vocales u'
print(mensaje)