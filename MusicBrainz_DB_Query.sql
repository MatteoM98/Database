-- Query 1
/*Contare il numero di lingue in cui le release contenute nel database sono
scritte (il risultato deve contenere soltanto il numero delle lingue,
rinominato “Numero_Lingue”).*/
SELECT count(DISTINCT LANGUAGE) AS Numero_Lingue
FROM release;

-- Query 2
/*Elencare gli artisti che hanno cantato canzoni in italiano
(il risultato deve contenere il nome dell’artista e il nome della lingua).*/

SELECT DISTINCT ac.name
FROM release
JOIN LANGUAGE ON release.language = language.id
JOIN artist_credit AS ac ON ac.id = release.artist_credit
WHERE language.name = 'Italian'
ORDER BY(ac.name);


-- Query 3
/*Elencare le release di cui non si conosce la lingua
(il risultato deve contenere soltanto il nome della release).*/
SELECT name
FROM release
WHERE LANGUAGE IS NULL;

-- Query 4
/*Elencare gli artisti il cui nome contiene tutte le vocali
(il risultato deve contenere soltanto il nome dell’artista).*/
SELECT name
FROM artist
WHERE name LIKE '%a%'
  AND name LIKE '%e%'
  AND name LIKE '%i%'
  AND name LIKE '%o%'
  AND name LIKE '%u%';


-- Query 5
/*Elencare tutti gli pseudonimi di Eminem con il loro tipo, se disponibile
(il risultato deve contenere lo pseudonimo dellartista, il nome dell’artista (cioè Eminem)
e il tipo di pseudonimo (se disponibile))*/

--Si è messo LEFT per far comparire anche quelli che hanno NULL
SELECT artist.name,
       aa.name AS ALIAS,
       aat.name AS type_name
FROM artist_alias AS aa
JOIN artist ON aa.artist = artist.id
LEFT JOIN artist_alias_type AS aat ON aat.id = aa.type
WHERE artist.name = 'Eminem'
ORDER BY (aa.name);


-- Query 6
/*Trovare gli artisti con meno di venti tracce (il risultato deve contenere
il nome dell’artista ed il numero di tracce, ordinato in ordine crescente
sul numero di tracce).*/

SELECT artist.name,
       sum(COUNT) numero_tracce
FROM artist_credit_name
JOIN
  (SELECT artist_credit,
          count(track.id) COUNT
   FROM track
   GROUP BY(artist_credit)) t ON t.artist_credit = artist_credit_name.artist_credit
JOIN artist ON artist.id = artist_credit_name.artist
GROUP BY(artist.name)
HAVING sum(COUNT)<20
ORDER BY numero_tracce,
         artist.name;


-- Query 7
/*Elencare le lingue cui non corrisponde nessuna release (il risultato deve
contenere il nome della lingua, il numero di release in quella lingua, cioè 0,
e essere ordinato per lingua) (scrivere due versioni della query).*()
/*Prima versione query 7*/
SELECT language.name,
       count(release.language) AS numero_release
FROM LANGUAGE
LEFT JOIN release ON release.language=language.id
GROUP BY language.name
HAVING count(release.language)=0
ORDER BY language.name;


/*Seconda versione query 7*/
SELECT l.name,
       COUNT (release.language) AS numero_release
FROM LANGUAGE l
LEFT JOIN release ON l.id = release.language
WHERE l.id IN
    (SELECT id
     FROM LANGUAGE
     EXCEPT SELECT LANGUAGE
     FROM release
     GROUP BY LANGUAGE)
GROUP BY l.name
ORDER BY l.name;



-- Quey 8
/*Ricavare la seconda registrazione per lunghezza di un artista uomo
il risultato deve comprendere
l'artista accreditato, il nome della registrazione e la sua lunghezza)
(scrivere due versioni della query).*/

/* prima versione*/
SELECT *
FROM
  (SELECT a.name AS artist_name,
          r.name AS recording_name,
          r.length
   FROM artist AS a
   JOIN artist_credit_name AS acn ON acn.artist = a.id
   JOIN
     (SELECT artist_credit,
             LENGTH,
             name
      FROM recording AS rec
      EXCEPT
        (SELECT artist_credit,
                LENGTH,
                name
         FROM recording
         WHERE LENGTH =
             (SELECT MAX(LENGTH)
              FROM recording) ))AS r ON r.artist_credit = acn.artist_credit
   WHERE a.gender=1
     AND r.length IS NOT NULL
   ORDER BY r.length DESC) AS f
WHERE f.length =
    (SELECT MAX(r.length)
     FROM artist AS a
     JOIN artist_credit_name AS acn ON acn.artist_credit = a.id
     JOIN
       (SELECT artist_credit,
               LENGTH,
               name
        FROM recording AS rec
        EXCEPT
          (SELECT artist_credit,
                  LENGTH,
                  name
           FROM recording
           WHERE LENGTH =
               (SELECT MAX(LENGTH)
                FROM recording) ))AS r ON r.artist_credit = acn.artist_credit
     WHERE a.gender=1
       AND r.length IS NOT NULL );


-- Seconda versione della query 8
SELECT a.name artist_name,
       rec_ac.traccia recording_name,
       rec_ac.length LENGTH
FROM artist_credit ac
JOIN
  (SELECT r2.name traccia,
          r2.artist_credit,
          mmax.length
   FROM recording r2
   JOIN
     (SELECT max(LENGTH) LENGTH
      FROM
        (SELECT r.name traccia,
                r.artist_credit,
                r.length
         FROM recording r
         JOIN
           (SELECT acn.artist_credit
            FROM artist a
            JOIN artist_credit_name acn ON a.id=acn.artist
            WHERE a.gender=
                (SELECT id
                 FROM gender
                 WHERE name='Male') ) aacn ON r.artist_credit=aacn.artist_credit) rec_male
      WHERE LENGTH <
          (SELECT max(LENGTH)
           FROM recording) ) mmax ON r2.length=mmax.length) rec_ac ON ac.id=rec_ac.artist_credit
JOIN artist_credit_name acn ON acn.artist_credit=ac.id
JOIN artist a ON a.id=acn.artist;





-- Query 9
/*Per ogni stato esistente riportare la lunghezza totale delle registrazioni
di artisti di quello stato (il risultato deve comprendere il nome dello stato
e la lunghezza totale in minuti delle registrazioni (0 se lo stato non ha registrazioni).*/

SELECT area.name,
       COALESCE (sum(r.length)/60000,
                 0) AS lunghezza_totale_min
FROM recording AS r
RIGHT JOIN artist_credit AS ac ON r.artist_credit = ac.id
RIGHT JOIN artist_credit_name AS acn ON acn.artist_credit = ac.id
RIGHT JOIN artist AS a ON acn.artist = a.id
RIGHT JOIN area ON a.area = area.id
RIGHT JOIN area_type AS AT ON at.id = area.type
WHERE at.name = 'Country'
GROUP BY area.name
ORDER BY lunghezza_totale_min;



-- Query 10
/*Considerando il numero medio di tracce tra le release pubblicate su CD,
ricavare gli artisti che hanno pubblicato esclusivamente release con più
tracce della media (il risultato deve contenere il nome dell’artista e il numero di release ed essere ordinato per numero di release discendente) (scrivere due versioni della query).*/


--- ottengo nome e il numero di release degli artisti
--- che hanno pubblicato release su CD
--Versione 1
SELECT DISTINCT artist.name AS artista,
                count(release.name) AS n_release
FROM release
JOIN artist_credit ON release.artist_credit=artist_credit.id
JOIN artist_credit_name ON artist_credit.id=artist_credit_name.artist_credit
JOIN artist ON artist_credit_name.artist=artist.id
JOIN medium ON release.id=medium.release
JOIN medium_format ON medium.format=medium_format.id
WHERE medium_format.name='CD'
GROUP BY artist.name
EXCEPT --- mi rimane il nome e il numero delle release gli artisti
 --- che hanno pubblicato esclusivamente release su CD con un numero di tracce
 --- > della media
 ---ottengo nome e numero delle release degli artisti che hanno pubblicato
--- release su CD con un numero di tracce <= della
--- media

SELECT artist.name AS artista,
       count(release.name) AS n_release
FROM release
JOIN artist_credit ON release.artist_credit=artist_credit.id
JOIN artist_credit_name ON artist_credit.id=artist_credit_name.artist_credit
JOIN artist ON artist_credit_name.artist=artist.id
JOIN medium ON release.id=medium.release
JOIN medium_format ON medium.format=medium_format.id
WHERE medium_format.name='CD'
  AND artist.name IN
    (---ottengo nome degli artisti che hanno pubblicato
 --- release su CD con un numero di tracce <= della
 --- media
 SELECT DISTINCT artist.name
     FROM medium
     JOIN track ON track.medium=medium.id
     JOIN medium_format ON medium.format=medium_format.id
     JOIN release ON medium.release=release.id
     JOIN artist_credit ON release.artist_credit=artist_credit.id
     JOIN artist_credit_name ON artist_credit.id=artist_credit_name.artist_credit
     JOIN artist ON artist_credit_name.artist=artist.id
     WHERE medium_format.name='CD'
       AND medium.track_count <=
         (-----numero medio di tracce tra le release
 ----- pubblicate su CD
 SELECT avg(m.track_count)
          FROM medium AS m
          JOIN track AS t ON t.medium=m.id
          JOIN medium_format AS mf ON m.format=mf.id
          JOIN release AS r ON m.release=r.id
          WHERE mf.name='CD' ) )
GROUP BY artist.name
ORDER BY n_release DESC;


--Seconda versione
SELECT t.name,
       count(t.nome_release) AS numero_release
FROM
  (SELECT artist.name,
          release.name AS nome_release
   FROM release
   JOIN medium ON medium.release=release.id
   JOIN artist_credit ON release.artist_credit=artist_credit.id
   JOIN artist_credit_name acn ON acn.artist_credit=artist_credit.id
   JOIN artist ON acn.artist=artist.id
   WHERE medium.format =
       (SELECT id
        FROM medium_format
        WHERE name='CD')
     AND artist.name NOT IN
       (SELECT artist.name
        FROM artist_credit
        JOIN
          (SELECT release.name,
                  release.artist_credit
           FROM release
           JOIN medium ON medium.release=release.id
           WHERE medium.format =
               (SELECT id
                FROM medium_format
                WHERE name='CD')
             AND track_count <=
               (-----numero medio di tracce tra le release
 ----- pubblicate su CD
 SELECT avg(m.track_count)
                FROM medium AS m
                JOIN track AS t ON t.medium=m.id
                JOIN medium_format AS mf ON m.format=mf.id
                JOIN release AS r ON m.release=r.id
                WHERE mf.name='CD' ) ) release_minori_media ON artist_credit.id=release_minori_media.artist_credit
        JOIN artist_credit_name acn ON acn.artist_credit=artist_credit.id
        JOIN artist ON acn.artist=artist.id) ) t
GROUP BY t.name
ORDER BY numero_release DESC;



-- Query 11
/*Ricavare il primo artista morto dopo Freddie Mercury (il risultato deve
contenere il nome dell’artista, la sua data di nascita e la sua data di morte).
In questa query non è possibile moltiplicare i valori di giorno mese ed anno per altri numeri.*/

SELECT name artista,
       begin_date_year anno_nascita,
       begin_date_month mese_nascita,
       begin_date_day giorno_nascita,
       end_date_year anno_morte,
       end_date_month mese_morte,
       end_date_day giorno_morte
FROM artist
JOIN
  (SELECT min(end_date_year) anno_morte, -- prendo solamente i minimi evitando i giorni maggiori
 min(end_date_month) mese_morte,
 min(end_date_day) giorno_morte
   FROM artist
   JOIN
     (SELECT min(end_date_year) anno_morte,
             min(end_date_month) mese_morte -- selezione min anno morte e min mese morte dal join con artist

      FROM artist
      JOIN
        (SELECT min(end_date_year) anno_morte -- seleziono il minimo anno di morte

         FROM
           (SELECT name,
                   end_date_year,
                   end_date_month,
                   end_date_day
            FROM artist -- seleziono dalla tabella artista gli artisti che sono solo persone

            WHERE artist.type =
                (SELECT id
                 FROM artist_type
                 WHERE name='Person')
              AND ((end_date_year >
                      (SELECT end_date_year
                       FROM artist
                       WHERE name='Freddie Mercury') -- anno_morte > di anno_morte di Freddie  oppure

                    OR (end_date_year =
                          (SELECT end_date_year
                           FROM artist
                           WHERE name='Freddie Mercury')
                        AND end_date_month >
                          (SELECT end_date_month
                           FROM artist
                           WHERE name='Freddie Mercury') -- stesso anno ma mese maggiore e non nullo

                        AND end_date_month IS NOT NULL)
                    OR (end_date_year =
                          (SELECT end_date_year
                           FROM artist
                           WHERE name='Freddie Mercury')
                        AND end_date_month =
                          (SELECT end_date_month
                           FROM artist
                           WHERE name='Freddie Mercury') -- stesso anno stesso mese ma giorno maggiore e non nullo

                        AND end_date_day >
                          (SELECT end_date_day
                           FROM artist
                           WHERE name='Freddie Mercury'))
                    AND end_date_day IS NOT NULL))--and end_date_month is not null and end_date_day is not null)
) t) t1 ON artist.end_date_year=t1.anno_morte -- condizione join anno morte

      WHERE artist.name<>'Freddie Mercury'
        AND artist.end_date_month>=
          (SELECT end_date_month
           FROM artist
           WHERE name='Freddie Mercury') -- artist con mese_morte >= a quello di Freddie con Freddie escluso
) t2 ON artist.end_date_year=t2.anno_morte
   AND artist.end_date_month=t2.mese_morte -- condizione join anno e mese morte

   WHERE artist.end_date_day > -- solo sul giorno uso il > per evitare quelli la cui data è la stessa di Freddie
       (SELECT end_date_day
        FROM artist
        WHERE name='Freddie Mercury') ) t3 ON artist.end_date_year=t3.anno_morte
AND artist.end_date_month=t3.mese_morte
AND artist.end_date_day=t3.giorno_morte;



-- Query 12
/*Elencare le coppie di etichette discografiche che non hanno mai fatto uscire
una release in comune ma hanno fatto uscire una release in collaborazione
con una medesima terza etichetta (il risultato deve comprendere i nomi delle
coppie di etichette discografiche).*/
SELECT DISTINCT l1.name AS Etichetta1,
                l2.name AS Etichetta2
FROM release_label first
-- Join su stesso label per avere release su cui lavorare (per la prima etichetta)
JOIN release_label second ON first.label = second.label
-- Join per avere label diversi che hanno release in comune
JOIN release_label third ON second.release = third.release
AND second.label <> third.label
-- Join per tutte le release della seconda etichetta
JOIN release_label fourth ON third.label = fourth.label
-- Join per avere i nomi delle etichette
JOIN label l1 ON first.label = l1.id
JOIN label l2 ON fourth.label = l2.id
-- Eliminare i dupplicati a-b b-a
WHERE l1.name < l2.name
EXCEPT

-- Si estraggono le coppie che hanno fatto uscire stessa release
SELECT DISTINCT l1.name AS Etichetta1,
                l2.name AS Etichetta2
FROM release_label f1
JOIN release_label f2 ON f1.label = f2.label
JOIN release_label f3 ON f2.release = f3.release
AND f2.label <> f3.label
JOIN release_label f4 ON f3.label = f4.label
JOIN label l1 ON f1.label = l1.id
JOIN label l2 ON f4.label = l2.id
-- Si escludono le rispettive release della prima e seconda etichetta in comune
WHERE f1.release<>f2.release
  AND f4.release<>f2.release;



-- Query 13
/*Trovare il nome e la lunghezza della traccia più lunga appartenente a una
release rilasciata in almeno due paesi (il risultato deve contenere il nome della traccia e la sua lunghezza in secondi) (scrivere due versioni della query).*/
--Prima versione
SELECT DISTINCT name AS track_name,
                LENGTH/1000 AS lenght_in_second
FROM
  (SELECT name,
          LENGTH
   FROM track) t1
JOIN
  (SELECT max(t.length) AS max_length
   FROM release r
   JOIN
     (SELECT release,
             count(country)
      FROM release_country
      GROUP BY release
      HAVING count(country)>=2) rc ON r.id=rc.release
   JOIN medium m ON r.id=m.release
   JOIN track t ON t.medium=m.id) tmax ON t1.length=tmax.max_length;


--Seconda versione
SELECT DISTINCT name,
                max(LENGTH)/1000 AS max_length_in_second
FROM track
WHERE LENGTH IN
    (SELECT max(t.length) AS max_length
     FROM release r
     JOIN
       (SELECT release,
               count(country)
        FROM release_country
        GROUP BY release
        HAVING count(country)>=2) rc ON r.id=rc.release
     JOIN medium m ON r.id=m.release
     JOIN track t ON t.medium=m.id)
GROUP BY name;





-- Query 14
/*Trovare le release e le tracce il cui nome contiene il nome di
un area (il risultato deve contenere solo il nome della release o della
traccia, rinominato come Nome).*/

SELECT r.name AS Nome
FROM release r
JOIN area AS a ON r.name LIKE '%' ||a.name|| '%'
UNION
SELECT t.name AS Nome
FROM track t
JOIN area AS a ON t.name LIKE '%' ||a.name|| '%'
ORDER BY name;



-- Query 15
/*Elencare tutti gli artisti statunitensi e le release rilasciate negli
Stati Uniti (il risultato deve contenere tre colonne, “Name” con il nome
dell’artista/release e “Type” che sarà uguale ad “Artist” se la tupla si riferisce ad un artista o a “Release” se la tupla si riferisce an una release e “Year” che corrisponde all’anno di nascita o pubblicazione della release). Non si utilizzino viste.*/
SELECT artist.name AS Name,
       'Artista' AS TYPE,
       artist.begin_date_year AS YEAR
FROM artist
JOIN area ON artist.area = area.id
JOIN iso_3166_1 AS iso ON area.id = iso.area
WHERE iso.code = 'US'
UNION ALL --se usassi solo union se ci sono release con lo stesso nome dell' artista sovrascrivo la tupla
SELECT r.name AS Name,
       'Release' AS TYPE,
       rc.date_year AS YEAR
FROM release r
JOIN release_country AS rc ON r.id = rc.release
JOIN country_area AS ca ON rc.country = ca.area
JOIN area ON area.id = ca.area
JOIN iso_3166_1 AS iso ON area.id = iso.area
WHERE iso.code = 'US'
ORDER BY TYPE;




-- Query 16
/*Elencare tutte le coppie di release rilasciate nello stesso anno nello stesso
stato, e che non hanno artisti in comune. Non si utilizzino viste.*/
--- trovo id, paese, anno e artista di ogni release
SELECT r1.id AS Release_ID1,
       r2.id AS Release_ID2,
       r1.name AS Release_Name,
       r2.name AS Release_Name
FROM
  (SELECT r1.id AS id,
          rc.country AS country,
          rc.date_year AS YEAR,
          acn.artist AS artist,
          r1.name
   FROM release r1
   JOIN artist_credit_name AS acn ON acn.artist_credit = r1.artist_credit
   JOIN release_country AS rc ON rc.release = r1.id
   ORDER BY id) r1
JOIN
  (SELECT r1.id AS id,
          rc.country AS country,
          rc.date_year AS YEAR,
          acn.artist AS artist,
          r1.name
   FROM release r1
   JOIN artist_credit_name AS acn ON acn.artist_credit = r1.artist_credit
   JOIN release_country AS rc ON rc.release = r1.id) r2 ON r1.year = r2.year
AND r1.country = r2.country
AND r1.artist <> r2.artist
WHERE r1.name < r2.name
order by r1.name, r2.name;



-- Query 17
/* Elencare gli artisti che (i) o sono statunitensi (ii) o che hanno partecipato
a delle release pubblicate negli Stati Uniti, ma non entrambi. Non si utilizzino viste.*/
SELECT *
FROM
  (SELECT a.name AS Name
   FROM artist AS a
   JOIN area ON a.area = area.id
   WHERE area.name = 'United States'
   ORDER BY a.name) AS a
UNION
  (SELECT DISTINCT a.name AS Name
   FROM artist AS a
   JOIN artist_credit_name AS acn ON a.id=acn.artist join
     (SELECT r.artist_credit
      FROM release AS r
      JOIN release_country AS rc ON r.id = rc.release
      JOIN area ON rc.country = area.id
      WHERE area.name = 'United States' ) AS r ON r.artist_credit = acn.artist_credit)
EXCEPT
  (SELECT a.name AS Name
   FROM artist AS a
   JOIN area ON a.area = area.id
   WHERE area.name = 'United States' INTERSECT
     SELECT DISTINCT a.name AS Name
     FROM artist AS a
     JOIN artist_credit_name AS acn ON a.id=acn.artist join
       (SELECT r.artist_credit
        FROM release AS r
        JOIN release_country AS rc ON r.id = rc.release
        JOIN area ON rc.country = area.id
        WHERE area.name = 'United States' ) AS r ON r.artist_credit = acn.artist_credit )
ORDER BY Name;

--per trovare le occorrenze esclusive dei due insiemi dobbiamo dapprima effettuare la loro unione, e successivamente
 -- toglierne l'intersezione
