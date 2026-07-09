select name, composer, milliseconds, Albumid
from tracks
order by
    Albumid ASC,
    Milliseconds DESC;