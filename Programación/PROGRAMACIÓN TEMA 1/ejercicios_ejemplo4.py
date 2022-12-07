#Escribir un programa que pida al usuario su peso (en kg) y estatura (en metros), calcule el índice de masa corporal y lo almacene en una variable, y muestre por pantalla la frase Tu índice de masa corporal es <imc> donde <imc> es el índice de masa corporal calculado redondeado con dos decimales.
#La fórmula del IMC consiste en dividir el peso en kg entre la altura en metros al cuadrado.

preguntaltura=input('¿Cuánto mides en metros?')
preguntapeso=input('¿Cuántos kg pesas?')
altura=float(preguntaltura)
peso=float(preguntapeso)
calculoimc=peso/(altura*altura)
imc_cadena=str(calculoimc)
resultado=('Tu indice de masa coporal es ' + imc_cadena)
print(resultado)