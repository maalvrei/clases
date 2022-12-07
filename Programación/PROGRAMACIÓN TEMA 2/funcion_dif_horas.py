"""
Escribir una función que reciba dos horas en formato hh:mm:ss
Debe devolver la diferencia entre ellas en formato hh:mm:ss
"""
def hora_segundos(cadena_hora):
    return int(cadena_hora[0:2]) * 3600 + int(cadena_hora[3:5]) * 60 + int(cadena_hora[6:8])

def dif_horas(inicio,fin):
    diferencia = abs(hora_segundos(fin) - hora_segundos(inicio))
    h = diferencia // 3600
    m = diferencia % 3600 // 60
    s = diferencia % 3600 % 60
    return f'{h:02d} : {m:02d} : {s:02d}'

print(dif_horas('05:45:32' , '14:14:14'))