-- Ejercicios 1

-- 1) Crea una vista de la tabla Country llamada Países, que muestre todos los países cambiando el nombre de los campos a castellano.
describe country;
create view paises (codigo, nombre, continente, region, area, anioIndependencia,poblacion, esperanzaVida, gnp, gnpViejo, gentilicio, formaDeGobierno, presidente, capital, codigo2) as select Code, Name, Continent, Region, SurfaceArea, IndepYear, Population, LifeExpectancy, GNP, GNPOld, LocalName, GovernmentForm,HeadOfState,Capital,Code2 from country;

-- 2) Crea una vista VistaEuropa de la tabla City, que muestre todos los datos de las ciudades del continente europeo (cambiar el código del país por su nombre), cambiando el nombre de los campos a castellano.

describe city;
create view VistaEuropa (ID, Nombre, CodigoDePais,Distrito,Poblacion)
as 
select id, city.Name, countryCode,District, city.Population 
from city join country on city.CountryCode = country.Code where country.Continent like 'Europe';

select * from vistaeuropa;

-- 3) CREA una vista VISTA_CAPITALES en la que aparezca el código, nombre, continente y region de los países junto con el nombre de su capital. Los campos de la vista en castellano.

create or replace view vista_capitales (codigo, nombre, continente, region, capital)
as
select code, country.name, continent, region, city.name from country join city on country.Capital = city.ID;

select * from vista_capitales;

-- Ejercicios 2

-- 1) Crea una vista llamada iberia, basada en la tablecity que solo tenga el nombre, la región y la población de las ciudades españolas.

create or replace view iberia (nombre, region, poblacion)
as
select city.name, city.District,city.Population from city join country on city.CountryCode = country.code where country.name like 'Spain';

select * from iberia;

-- 6) Crea una vista llamada “ciudades_esp” con el nombre del país, el nombre de la ciudad y el continente de las ciudades de España que no son capital.

create or replace view ciudades_esp 
as
select country.name as pais, city.name as ciudad, country.continent as continente
from country
join city on country.code = city.CountryCode
where country.name = 'Spain' and city.ID <> country.Capital;

select * from ciudades_esp;

