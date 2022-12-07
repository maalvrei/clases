# break, cuando ocurre algo dentro del bucle y se sale del bucle

# continue, para crear un bucle que no queremos que tenga en cuenta una condicion:

x = 0
mensaje ='Esto es un experimento'
while x < len(mensaje) -1:
    x += 1
    if mensaje[x] == 'e':
        continue
    print(mensaje[x])

# exit, igual que break pero no sale solo del bucle si no que termina el programa