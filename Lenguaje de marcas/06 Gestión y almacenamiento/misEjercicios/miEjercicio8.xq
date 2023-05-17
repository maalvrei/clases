<hmtl>
<head>
<link rel="stylesheet" type="text/css" href="miEjercicio8.css"/>
<title>XQuery y HTML</title>
</head>
<body>
{for $ciclo in //ciclo
return 
<div><p>{concat($ciclo/@id/data()," ", $ciclo/grado/text())}</p>
<p>{concat("Nombre: " , $ciclo/nombre/text())}</p>
<p>{concat("Año del decreto: ", $ciclo/decretotitulo/@año/data())}</p></div>
}
</body>
</hmtl>