def valid_braces(cadena):
    if len(cadena)%2 !=0:
        return False
    parejas = {
        ')' : '(',
        '}' : '{',
        ']' : '['
    }
    pila = []
    
    valores = list(parejas.values())
    claves = list(parejas.keys())
    
    for s in cadena:
        if s in valores:
            pila.append(s)
        else:
            if pila == []:
                return False
            ultimo = pila.pop()
            if ultimo != parejas[s]:
                return False
    if len(pila) == 0:
        return True
    else:
        return False

print(valid_braces('())({[[[[()]]]]}'))