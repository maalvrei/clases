#Escribir un programa que pregunte al usuario por el número de horas trabajadas y el coste por hora. Después debe mostrar por pantalla la paga que le corresponde.
pregunta1=input('¿Cuántas horas has trabajado este mes?')
pregunta2=input('¿A cuánto te pagan la hora?')
horas=int(pregunta1)
precio=int(pregunta2)
calculo=horas*precio
cobrar=str(calculo)
respuesta1='Te corresponden '
respuesta2=' euros'
respuestafinal=(respuesta1 + cobrar + respuesta2)
print(respuestafinal)