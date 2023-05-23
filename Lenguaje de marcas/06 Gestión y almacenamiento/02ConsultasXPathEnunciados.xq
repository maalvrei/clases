"1.-Usando XPath, proveedor cuyo numprov es 'v1'",
//proveedor[@numprov="v1"],
"2.- Usando XPath, los datos de partes cuyo color sea 'Rojo'",
//parte[color="Rojo"],
"3.- Usando XPath, ídem anterior pero incluyendo resultados entre una etiqueta <partesrojas></partes color='rojo'>",
<partes>{//parte[color="Rojo"]}</partes>