import string
def alphabet(text):
    text = text.lower()
    abc = string.ascii_lowercase
    salida = []
    for s in text:
        idx = abc.find(s)
        if idx > -1:
            salida.append(str(idx + 1))
    return ' '.join(salida)

print(alphabet('abcdefgh'))