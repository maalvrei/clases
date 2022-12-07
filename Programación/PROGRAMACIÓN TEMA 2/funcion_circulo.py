import math
def area(radio):
    return radio * radio * math.pi

def vol_cilindro(altura):
    return area(entradio) * altura
entradio = int(input('Dime un radio: '))
entaltura = int(input('Dime la altura: '))

v = vol_cilindro(entaltura)

print(v)