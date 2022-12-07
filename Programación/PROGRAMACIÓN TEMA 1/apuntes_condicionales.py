numero = int(input('Dime un número'))

#== es un comparador de igualdad
if numero == 0:
    print=('El número es 0')
elif numero > 0:
    print('El número es mayor que 0')
else:
    print('El número es menor que 0')

#otra forma de hacerlo

if numero == 0:
    print=('El número es 0')
else:
    if numero > 0:
        print('El número es mayor que 0')
    else:
        print('El número es menor que 0')

#elif se utiliza para no tener que anidar otro if y otro else dentro de un else

################ Operadores #################

"""

Son los operadores aritméticos
+
-
*
/
** este es el exponente, por ejemplo 2**8 es 2 elevado a 8
// esta es la división entera
% este es el módulo, es el resto de la división entera

------------------

Operadores de comparación

>
<
==
! este es distinto 
>=
<=

------------------
Asignación o incremento
+=
-=
*=
/=
//=
%=
**=

por ejemplo:

x=1
x= x+1
es lo mismo que
x += 1




"""