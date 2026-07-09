SELECT
	trackid,
	name	
FROM
	tracksQ
WHERE
    /* O '%' depois da palavra */
	name LIKE 'Wild%';

SELECT
	trackid,
	name	
FROM
	tracks
WHERE
    /* O '%' antes da palavra */
	name LIKE '%Wild';

SELECT
	trackid,
	name	
FROM
	tracks
WHERE
    /* O '%' em ambos os lados */
	name LIKE '%Wild%';

SELECT
	trackid,
	name	
FROM
	tracks
WHERE
    /* Caractere coringa no meio */
	name LIKE '%B_d%';