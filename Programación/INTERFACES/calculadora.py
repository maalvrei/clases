import PySimpleGUI as ps

menu_temas = ['Menu' , ['HotDogStand', 'LightBrown9', 'LightGray1', 'LightGreen', 'LightGreen1', 'LightGreen10', 'LightGreen2', 'LightGreen3', 'LightGreen4', 'LightGreen5', 'LightGreen6', 'LightGreen7', 'LightGreen8', 'LightGreen9', 'LightGrey', 'LightGrey1', 'LightGrey2', 'LightGrey3', 'LightGrey4', 'LightGrey5', 'LightGrey6', 'LightPurple', 'LightTeal', 'LightYellow', 'Material1', 'Material2']]

def crear_ventana(tema):
    ps.theme(tema)
    boton_size = (6 , 3)
    ps.set_options(font = 'Calibri 14')

    layout = [
        [ps.Text('0.0' , font = 'Courier 50' , size = (6 , 3), justification = 'right' , expand_x = True , right_click_menu = menu_temas , pad = (30 , 50) , key = '-TEXTO-')],
        [ps.Button('Clear' , expand_x = True , size = (6 , 3)) , ps.Button('Enter' , expand_x = True , size = (6 , 3) , disabled = True )],
        [ps.Button('7' , size = (6 , 3)) , ps.Button('8' , size = (6 , 3)) , ps.Button('9' , size = (6 , 3)) , ps.Button('*' , size = (6 , 3))],
        [ps.Button('4' , size = (6 , 3)) , ps.Button('5' , size = (6 , 3) ) , ps.Button('6' , size = (6 , 3)) , ps.Button('/' , size = (6 , 3))],
        [ps.Button('1' , size = (6 , 3)) , ps.Button('2' , size = (6 , 3)) , ps.Button('3' , size = (6 , 3)) , ps.Button('-' , size = (6 , 3))],
        [ps.Button('0' , expand_x = True , expand_y = True , size = (6 , 3)) , ps.Button('.' , size = (6 , 3)) , ps.Button('+' , size = (6 , 3))]
    ]

    return ps.Window('Calculadora' , layout)

tema_defecto = 'HotDogStand'
window = crear_ventana(tema_defecto)

numeros = []
operaciones = []

while True:
    event, values = window.read()


    if event == ps.WIN_CLOSED:
        break

    if event in menu_temas[1]:
        window.close()
        window = crear_ventana(event)

    if event in ['0' , '1' , '2' , '3', '4' , '5' , '6' , '7' , '8' , '9' , '.']:
        numeros.append(event)
        num_string = ''.join(numeros)
        window['-TEXTO-'].update(num_string)
        window['Enter'].update(disabled = False)

    if event in ['+' , '-' , '*' , '/']:
        operaciones.append(''.join(numeros))
        operaciones.append(event)
        numeros = []
        window['-TEXTO-'].update('')

    if event == 'Enter':
        operaciones.append(''.join(numeros))
        resultado = eval(''.join(operaciones))
        window['-TEXTO-'].update(f'{resultado}')
        operaciones = []
        numeros = [str(resultado)]
        window['Enter'].update(disabled = True)

    if event == 'Clear':
        window['-TEXTO-'].update('0.0')
        numeros = []
        operaciones = []
        window['Enter'].update(disabled = True)

window.close()