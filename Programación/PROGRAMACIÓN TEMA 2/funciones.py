# es una bloque de código que se guarda para ejecutar algo concreto, para después llamarla y que haga lo que tú quieras
# las funciones se definen con la palabra reservada def
# cada función debe hacer una sola cosa

def saluda(persona):
    nombre = persona
    print(f'Hola, {nombre}')

saluda('Alejandro')
saluda('Paco')

# una funcion no debe saber nada del mundo exterior. 
# las diferentes partes de una tienen que tener alta cohesion y bajo acoplamiento. Acoplamiento es que para que una cosa funcione siempre tiene que existir otra. Por ejemplo:

def saluda(persona):
    nombre = gente[1]
    print(f'Hola, {nombre}')
gente =['Ana' , 'Miguel' , 'Dani']

# esta funcion depende mucho de la lista gente. para conseguir que no estén acoplados, se le pone un parámetro tal que así:

def saluda(personas):
    for p in personas:
        print(f'Hola, {p}')
gente = ['Ana' , 'Miguel' , 'Dani'] 

# las variables que se definen dentro de una función no se conocen fuera de la función. para sacar cosas de una funcion:

def saluda(personas):
    salida = []
    for p in personas:
        salida.append(f'Hola, {p}')
    return salida
gente = ['Ana' , 'Miguel' , 'Dani']
saludos = saluda(gente)
print(saludos)

