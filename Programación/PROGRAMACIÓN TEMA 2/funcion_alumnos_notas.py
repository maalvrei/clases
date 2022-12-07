def alumno_notas(alumno, *asignaturas):
    print(f'El alumno {alumno} se ha matriculado de las asignaturas: ')
    print('-----------------')
    for a in asignaturas:
        print(a)

alumno_notas('Miguelito de la Roda', 'Programación' , 'Base de Datos' ,  'Sistemas')

def alumno_notas_2(alumno, *asignaturas, **notas):
    print(f'El alumno {alumno} se ha matriculado de las asignaturas: ')
    print('-----------------')
    for a in asignaturas:
        print(a)
