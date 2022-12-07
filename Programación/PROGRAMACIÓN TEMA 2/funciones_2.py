''' def suma(a , b):
    return a + b

n1 = int(input('Dime un número'))
n2 = int(input('Dime otro número'))
rdo  = suma(n1 , n2)
print(rdo) '''

def suma_muchos(*args):
    total = 0
    for i in args:
        total += i
    return total

print(suma_muchos(1,2,3,4,5,6,7,8,9,10))