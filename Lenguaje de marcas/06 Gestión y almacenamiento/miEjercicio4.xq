"Nombre de los módulos que se imparten en el centro",
/centro/modulos/modulo/nombre/text(),

"Nombre de los módulos del ciclo ASIR",

/centro/modulos/modulo[ciclo='ASIR']/nombre,

"Nombre de los módulos que se imparten en el segundo curso de cualquier ciclo",

/centro/modulos/modulo[curso='2']/nombre,

"Nombre de los módulos de menos de 5 horas semanales:",

/centro/modulos/modulo[horasSemanales < 5]/nombre,

"Nombre de los módulos que se imparten en el primer curso de ASIR",

/centro/modulos/modulo[curso='1' and ciclo='ASIR']/nombre,

"Horas semanales de los módulos de más de 3 horas semanales (4, 5, 5):",

/centro/modulos/modulo[horasSemanales > 3]/horasSemanales




