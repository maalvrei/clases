"<a href='https://es.wikipedia.org/wiki/Diego_Velázquez'>Diego Velázquez</a>",
for $a in //artista
return concat("<a href='https://es.wikipedia.org/wiki/", $a/nombreCompleto/data(),"'>", $a/nombreCompleto/data(),"</a>")