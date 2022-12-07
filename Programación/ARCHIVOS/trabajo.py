import pprint
import csv
from datetime import datetime


rutabase = 'C:\\Users\\Tarde\\Downloads\\'
datos = rutabase + 'cust_orders_prods.csv'

def leer2(fichero):

    filas = []
    with open(fichero, 'r') as csv_file:
        csvreader = csv.reader(csv_file)
        for f in csvreader:
            filas.append(f)
    return filas

def leer(fichero): 
    filas = []
    with open(fichero, 'r') as csv_file:
        csvreader = csv.DictReader(csv_file)
        filas = list(csvreader)
    return filas

def total_quantity(filas): 

    total = 0
    for i in filas:
        total += int((i['quantity'])) 
    return(total)

def clientes(filas,total):

    dicc = {}
    for i in filas:
        cliente = i['customer_name']
        if cliente not in dicc:
            dicc[cliente] = int((i['quantity']))#si no existe crea cliente: cantidad
        else:
            dicc[cliente] += int((i['quantity']))#si ya existe, deja la misma CLAVE pero reemplaza el VALOR, sumando la cantidad.

    elementos = dicc.items()

    for k,v in elementos:
        print(f'El cliente {(k)} ha hecho {(v)} compras, que suponen el {(round(v/total*100 , 2))} del total')

def productos(filas,total): 

    dicc = {}
    for i in filas:
        if i['product_name'] not in dicc:
            dicc[i['product_name']] = int((i['quantity']))
        else:
            dicc[i['product_name']] += int((i['quantity']))

    elementos = dicc.items()

    lista_resultados = []
    for k,v in elementos:
        resultados = [(k),(v),(v/total*100)]
        lista_resultados.append(resultados)
    
    l = []
    for lp in lista_resultados:
        l.append(lp[2])
    l_ordenada = sorted(l, reverse=True)
    lista_productos = []
    for lp in l_ordenada:
        if len(lista_productos) != 5:
            lista_productos.append(lp)
    pprint.pprint(l_ordenada)
    for i in lista_resultados:
        if i[2] in lista_productos:
            print(f'El {i[0]} es uno de los 5 productos más vendidos, con {i[1]} ventas, que suponen el {round(i[2]) , 2}% del total')

def vendedores():
    lista_vendedores = []
    lista_vendedores_y_cantidad = []
    total_datos = leer2(datos)
    total_datos.remove(total_datos[0])
    for i in total_datos:
        if i[1] not in lista_vendedores:
            lista_vendedores.append(i[1])
    for i in total_datos:
        if i[1] not in lista_vendedores_y_cantidad:
            lista_vendedores_y_cantidad.append(i[1])
            lista_vendedores_y_cantidad.append(i[3])
        else:
            lista_vendedores_y_cantidad.append(i[3])
    l_cantidades = []
    l_final = []
    l_total = []
    for e in lista_vendedores_y_cantidad:
        if e in lista_vendedores:
            if sum(l_cantidades) != 0:
                l_final.append(str(sum(l_cantidades)))
                l_total.append(sum(l_cantidades))
            l_final.append(e)
            l_cantidades = []
        else:
            l_cantidades.append(int(e))
    l_final.append(str(sum(l_cantidades)))
    l_total.append(sum(l_cantidades))
    total = sum(l_total)
    l = []
    l2 = []
    for h in l_final:
        l.append(h)
        if len(l) == 2:
                l.append((int(l[1]) / total)*100)
                l2.append(l)
                l = []
    for e in l2:
        print(f'El vendedor {e[0]} ha hecho {e[1]} ventas, que suponen el {round(e[2] , 2)}% del total')
    
    return l2

def ingresos_mensuales(datos):
    dicc = {}
    for i in datos:
        mes = i['order_date']
        m = datetime.strptime(mes, '%Y-%m-%d')
        m = m.month
        if mes not in dicc:
            dicc[m] = int(i['quantity']) * int(i['unit_price'])#si no existe crea cliente: cantidad
        else:
            dicc[m] += int(i['quantity']) * int(i['unit_price'])#si ya existe, deja la misma CLAVE pero reemplaza el VALOR, sumando la cantida
    elementos = dicc.items()
    for k,v in elementos:
        if k == 1:
            print(f'El mes de enero se facturó un total de {v} u.m.')
        if k == 2:
            print(f'El mes de febrero se facturó un total de {v} u.m.')
        if k == 3:
            print(f'El mes de marzo se facturó un total de {v} u.m.')
        if k == 4:
            print(f'El mes de abril se facturó un total de {v} u.m.')
        if k == 5:
            print(f'El mes de mayo se facturó un total de {v} u.m.')
        if k == 6:
            print(f'El mes de junio se facturó un total de {v} u.m.')
        if k == 7:
            print(f'El mes de julio se facturó un total de {v} u.m.')
        if k == 8:
            print(f'El mes de agosto se facturó un total de {v} u.m.')
        if k == 9:
            print(f'El mes de septiembre se facturó un total de {v} u.m.')
        if k == 10:
            print(f'El mes de octubre se facturó un total de {v} u.m.')
        if k == 11:
            print(f'El mes de noviembre se facturó un total de {v} u.m.')
        if k == 12:
            print(f'El mes de diciembre se facturó un total de {v} u.m.')

def main():
    print('¿Qué quieres hacer?')
    print('----------------')
    print('1. Calcular los clientes y sus porcentajes\n2. Calcular vendedores y sus porcentajes\n3. Calcular los 5 productos más vendidos\n4. Calcular las ventas mensuales\n5. Salir')
    while True:
        entrada = input('Introduce el número de la acción que quieres llevar a cabo: ')
        if entrada == '':
            print('Introduce una acción válida')
            continue
        elif entrada == '1':
            clientes(leer(datos),total_quantity(leer(datos)))
            main()
            continue
        elif entrada == '2':
            vendedores()
            continue
        elif entrada == '3':
            productos(leer(datos),total_quantity(leer(datos)))
            continue
        elif entrada == '4':
            ingresos_mensuales(leer(datos))
            continue
        elif entrada == '5':
            break
        else:
            print('Introduce una acción válida')
            continue


main()
