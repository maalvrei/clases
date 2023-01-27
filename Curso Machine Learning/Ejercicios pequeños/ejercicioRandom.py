import random


resultado = []
while len(resultado) <6 :
    n = random.randint( 1 , 49 )
    if n not in resultado:
        resultado.append(n)

print(resultado)

import matplotlib.pyplot as plt

notas = [1,2,3,4,5,6,7,8,9]
plt.plot(notas)
plt.show()