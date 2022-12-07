'''
Un minorista en particular tiene un 60 por ciento de descuento en una variedad de productos descontinuados.

Al minorista le gustaría ayudar a sus clientes a determinar el precio reducido de la mercancía al tener una tabla de descuentos impresa en el estante que muestre los precios originales y los precios después de que se haya aplicado el descuento. 

Escriba un programa que use un bucle para generar esta tabla, que muestre el precio original, el monto del descuento y el nuevo precio para compras de $4.95, $9.95, $14.95, $19.95 y $24.95. 

Asegúrese de que los montos de descuento y los nuevos precios se redondeen a 2 decimales cuando se muestren.
'''

lista_descuentos = []
lista_precios_finales = []
valores = [4.95 , 9.95 , 14.95 , 19.95 , 24.95]
def descuento(*precios):
    for i in precios:
        descuento = i*0.6
        lista_descuentos.append(descuento)
        precio_final = i - descuento
        lista_precios_finales.append(precio_final)
descuento(*valores)
print(lista_descuentos)
print(lista_precios_finales)