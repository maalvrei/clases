<html>
<head>
<link rel="stylesheet" type="text/css" href="05bXQuery.css"/>
<title>XQuery y HTML</title>
</head>
<body>
<ol>
{
  for $a in //cliente/nombre
  return
  <li>{$a/text()}</li>
}
</ol>
<p>Total clientes: {
  for $a in //clientes
  let $b:=$a/cliente
  return count($b)
}</p>
</body>
</html>