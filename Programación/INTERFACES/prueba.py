import PySimpleGUI as ps
#1. Establecer el tema


ps.theme('asdfg')

#2. Crear el layout

layout = [
    [ps.Text('Introduce tu nombre')],
    [ps.InputText()],
    [ps.Button('ok'), ps.Button('Cancel')],
    [ps.Radio('koko')],
    [ps.Checkbox('jijiji')],
    [ps.Listbox()]
]

#3. Event loop

windows = ps.Window('Formulario' , layout)

while True:
    event , values = window.read()
    if event == 'Cancel' or event == ps.WIN_CLOSED:
        break

window.close()