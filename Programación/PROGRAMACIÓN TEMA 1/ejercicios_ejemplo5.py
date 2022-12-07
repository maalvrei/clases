#Escribir un programa que pregunte por consola el precio de un producto en euros con dos decimales y muestre por pantalla el número de euros y el número de céntimos del precio introducido.

precio=input('¿Cuánto vale el producto? Usa dos decimales')
coma=precio.find('.')
decimales=precio[coma:]
entero=precio[:coma]
frasefinal='El producto vale ' + entero + ' euros con ' + decimales + ' centimos'
print(frasefinal)