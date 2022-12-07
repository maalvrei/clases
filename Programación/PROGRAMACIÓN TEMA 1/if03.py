print('Comparador de años')
f1=int(input('Dime el año de partida: '))
f2=int(input('Dime otro año: '))
if f1==f2:
    print('Son el mismo año')
else:
    if f1>f2:
        r1=f1-f2
        print(f'Han pasado {r1} años desde {f2}')
    else:
        r2=f2-f1
        print(f'Faltan {r2} años para llegar a {f2}')