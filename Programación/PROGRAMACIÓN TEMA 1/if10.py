num=int(input('Dime una cifra en centímetros: '))
km = num // 100_000
restokm = num % 100_000
m = restokm // 100
restom = restokm % 100
mensaje = f'Nuestro número {num} es \n {km} kilómetros \n {m} metros \n {restom} centímetros'
print(mensaje)