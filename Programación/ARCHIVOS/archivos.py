ruta_base = 'C:\\Users\\migue\\Desktop\\Clases\\Programación\\ARCHIVOS\\'
archivo = 'C:\\Users\\Tarde\\Desktop\\Clases\\Programación\\ARCHIVOS\\agenda.txt'
archivo2 = ruta_base + 'agenda2.txt'

def agenda():
    b = open(archivo, 'r')
    pendientes = b.readline()
    while True:
        entrada = input('¿Qué tarea vas a realizar?: ')
        if entrada == '':
            break
        else:
            if entrada in pendientes:
                print('Esa tarea ya está marcada como pendiente.')
            else:
                pendientes += entrada + ', '
    b.close()
    d = open(archivo, 'w')
    d.write(pendientes)
    d.close()


"""def agenda2():
    a = open(archivo, 'r')
    pendientes = a.readline()
    a.close()
    t = open(archivo2, 'r')
    terminadas = t.readline()
    while True:
        entrada = input('¿Qué tareas has terminado?: Pulsa intro si no has terminado ninguna: ')
        if entrada == '':
            break
        else:
            if entrada in pendientes:
                pendientes.replace('entrada' , '')
                a = open(archivo, 'w')
                a.write(pendientes)
                a.close()
        if entrada in terminadas:
            print('Esa tarea ya ha sido terminada')
        else:
            terminadas += entrada + ', '
    c = open(archivo2, 'w')
    c.write(terminadas)
    c.close()"""


agenda()
"""agenda2()"""