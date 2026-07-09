select name, composer, milliseconds
from tracks
order by Milliseconds DESC
LIMIT 10;

select name, composer, milliseconds, bytes
from tracks
order by bytes ASC
LIMIT 5;

select name, composer, milliseconds, bytes
from tracks
order by bytes ASC
LIMIT 5 OFFSET 5;