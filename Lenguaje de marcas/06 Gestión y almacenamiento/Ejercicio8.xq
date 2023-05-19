<html>
<head>
<LINK rel="stylesheet" type="text/css" href="Ejercicio8.css"/>
</head>
<body>
{
for $c in //ciclo
where $c/decretotitulo/@año=2008 or $c/decretotitulo/@año=2010
return 
<div>
<p>{concat($c/@id/data()," (",$c/grado/text(),")")}</p>
<p>Nombre: {$c/nombre/text()}</p>
<p>Año del decreto: {$c/decretotitulo/@año/data()}</p>


</div>
}

</body>
</html>