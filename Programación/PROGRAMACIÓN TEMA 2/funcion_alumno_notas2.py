def alumno_notas_2(alumno, *asignaturas, **notas):

    print(f'El alumno {alumno} se ha matriculado de las asignaturas: ')
    print('-----------------')

    for a in asignaturas:
        print(a)
    print('-------')
    print('Sus notas son: ')

    for k , v in notas.items():
        print(f'{k} : {v}')

alumno = 'Miguelito de la Roda'

asig = ['Programación' , 'BD' , 'Sistemas' , 'Filología']

notas = {
    'Programación' : 7,
    'BD' : 2.5,
    'Sistemas' : 5
}

alumno_notas_2(alumno, *asig, **notas)
