(:Diferencia entre for y let :)
for $a in //autor
return <PERSONAS>{$a/apellido}</PERSONAS>,
"*********************************",
let $a := //autor
return <PERSONAS>{$a/apellido}</PERSONAS>