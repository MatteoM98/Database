--Inserimento Utenti

insert into Utente(username, nome, cognome, email, password, nazione)
values('Mario00','Mario','Rossi', 'mario.rossi@gmail.com', 'pswd00', 'Italia');

insert into Utente(username, nome, cognome, email, password, nazione)
values('Gio007','Giovanni','Neri', 'g.neri@hotmail.it', '1234', 'Italia');

insert into Utente(username, nome, cognome, email, password, nazione)
values('TobyMindController','Tobias','Curtis', 'tb.curtis@gmail.com', 'abcd0123', 'USA');

insert into Utente(username, nome, cognome, email, password, nazione)
values('Balboa','Sylvester','Stallone', 'rocky@mail.us', '00alpha', 'USA');

insert into Utente(username, nome, cognome, email, password, nazione)
values('MechanicGenius','Happy','Queen', 'happy.queen@hongkong.cn', 'macchina001', 'Cina');

insert into Utente(username, nome, cognome, email, password, nazione)
values('WallyOB','Walter','Brian', 'boss_of_the@scorpion.com', 'pwd10','Iraq');

insert into Utente(username, nome, cognome, email, password, nazione)
values('WhoAmI','Harold','Finch', 'theMachine@samaritan.org', 'password100','USA');


--Inserimento Libri
--gli scrittori sono Mario Rossi e Giovanni Neri Harold Finch

insert into Libro(titolo, autore, npagine, stato, nvolume, Data_ultimo_aggiornamento, collana, nletture)
values('La mia Italia', 'Gio007', 100, 'terminato', 3, '2001-09-28 01:00', 'Storie Italiane', 80);

--Giovanni Neri diventa scrittore quindi il tipo aggiornato a 'S'
update Utente set tipo = 'S' where Username = 'Gio007';


insert into Libro(titolo, autore, npagine, stato, Data_ultimo_aggiornamento,nletture)
values('Person Of Interest', 'WhoAmI', 3, 'in corso', '2010-01-02 15:00',28);

--Harold Finch diventa scrittore quindi il tipo aggiornato a 'S'
update Utente set tipo = 'S' where Username = 'WhoAmI';

insert into Libro(titolo, autore, npagine, stato, Data_ultimo_aggiornamento,nletture)
values('Avventure nascoste', 'Mario00', 175, 'terminato', '2011-09-28 14:00',4);

--Mario Rossi diventa scrittore quindi il tipo aggiornato a 'S'
update Utente set tipo = 'S' where Username = 'Mario00';

insert into Libro(titolo, autore, npagine, stato, Data_ultimo_aggiornamento, collana,nletture)
values('La Macchina', 'WhoAmI', 590,'in corso', '2013-07-18 00:45', 'Ingegneria del software',105);

insert into Libro(titolo, autore, npagine, stato, Data_ultimo_aggiornamento, collana,nletture)
values('Rivoluzioni mancate', 'Mario00', 5, 'in corso', '2017-11-08 10:30', 'Storie Italiane',22);

insert into Libro(titolo, autore, npagine, stato, Data_ultimo_aggiornamento,nletture)
values('La ricerca della felicità', 'Gio007', 196, 'terminato', '2014-07-22 13:24',12);

insert into Libro(titolo, autore, npagine, stato, Data_ultimo_aggiornamento, collana,nletture)
values('Kyras: il Druido', 'Gio007', 85, 'in corso', '2001-09-28 01:00', 'Storie fantasy',77);



--Inserimento Capitoli
insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('Cap1','La mia Italia','Gio007',1);

insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('Cap2','La mia Italia','Gio007',2);

insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('Cap3','La mia Italia','Gio007',3);

insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('Capitolo1','Person Of Interest','WhoAmI',1);

insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('Capitolo2','Person Of Interest','WhoAmI',2);

insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('Cp1','Avventure nascoste','Mario00',1);

insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('Cp2','Avventure nascoste','Mario00',2);

insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('Capitolo1','La Macchina','WhoAmI',1);

insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('Capitolo2','La Macchina','WhoAmI',2);

insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('Cp1','Rivoluzioni mancate','Mario00',1);

insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('Cap1','La ricerca della felicità','Gio007',1);

insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('Cap2','La ricerca della felicità','Gio007',2);

insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('Cap1','Kyras: il Druido','Gio007',1);




--Inserimento Paragrafi
insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'Cap1','La mia Italia','Gio007');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(2,'Cap1','La mia Italia','Gio007');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'Cap2','La mia Italia','Gio007');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'Cap3','La mia Italia','Gio007');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'Capitolo1','Person Of Interest','WhoAmI');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'Capitolo2','Person Of Interest','WhoAmI');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'Cp1','Avventure nascoste','Mario00');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'Cp2','Avventure nascoste','Mario00');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'Capitolo1','La Macchina','WhoAmI');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'Capitolo2','La Macchina','WhoAmI');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'Cp1','Rivoluzioni mancate','Mario00');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'Cap1','La ricerca della felicità','Gio007');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'Cap2','La ricerca della felicità','Gio007');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'Cap1','Kyras: il Druido','Gio007');


--Inserimento Commenti
insert into Commento
values('2018-09-28', '05:00', 'WhoAmI', 1, 'Cap1', 'La mia Italia', 'Gio007', 'I remember Italy! Fantastic story.');

insert into Commento
values('2018-02-18', '15:30', 'Mario00', 2, 'Cap1', 'La mia Italia', 'Gio007', 'Ottimo lavoro');

insert into Commento
values('2018-12-11', '22:00', 'WallyOB', 1, 'Capitolo2', 'La Macchina', 'WhoAmI', 'La Macchina è un capolavoro ingegneristico');

insert into Commento
values('2018-10-14', '23:00', 'WallyOB', 1, 'Capitolo1', 'La Macchina', 'WhoAmI', 'Se la Macchina esistesse la privacy sarebbe violata');

insert into Commento
values('2019-02-21', '18:20', 'MechanicGenius', 1, 'Capitolo1', 'La Macchina', 'WhoAmI', 'Progetto interessante');

insert into Commento
values('2019-04-19', '19:43', 'Mario00', 1, 'Cap1', 'La ricerca della felicità', 'Gio007', 'Dopo aver visto il film trovo interessante la lettura del libro, già da questo paragrafo si provano emozioni');

insert into Commento
values('2019-03-25', '15:34', 'TobyMindController', 1, 'Cap2', 'La ricerca della felicità', 'Gio007', 'Copiato dal film, tuttavia è una lettura rilassante ed emozionante al tempo stesso');

insert into Commento
values('2018-09-28', '05:00', 'Balboa', 1, 'Cp1', 'Rivoluzioni mancate', 'Mario00', 'Paragrafo noioso!!!');




--Inserimento Messaggi
insert into Messaggio(Data, Ora, Mittente, Destinatario, Testo)
values('2016-06-10', '17:01', 'Balboa', 'Mario00','Ciao come va?');

insert into Messaggio(Data, Ora, Mittente, Destinatario, Testo)
values('2018-06-10', '17:30', 'Mario00', 'Balboa','Ciao. Tutto ok. Tu?');

insert into Messaggio(Data, Ora, Mittente, Destinatario, Testo)
values('2018-06-12', '05:00', 'Balboa', 'Mario00','I tuoi libri mi hanno ispirato. Penso che inizierò a scrivere qualche storia.');

insert into Messaggio(Data, Ora, Mittente, Destinatario, Testo)
values('2019-03-15', '14:33', 'MechanicGenius', 'TobyMindController','Toby, dovresti smettere con le scommesse!!!');

insert into Messaggio(Data, Ora, Mittente, Destinatario, Testo)
values('2018-03-15', '15:00', 'TobyMindController', 'MechanicGenius','Ci puoi scommettere :-)');

insert into Messaggio(Data, Ora, Mittente, Destinatario, Testo)
values('2018-08-30', '23:59', 'WallyOB', 'WhoAmI','Vorresti un aiuto per costruire la Macchina che descrivi nel tuo libro?');

insert into Messaggio(Data, Ora, Mittente, Destinatario, Testo)
values('2018-08-31', '00:00', 'WhoAmI', 'WallyOB','System Reboot...');

insert into Messaggio(Data, Ora, Mittente, Destinatario, Testo)
values('2018-08-31', '00:01', 'WhoAmI', 'WallyOB','Hai un QI di 197, dovresti sapere che è in mezzo a noi e ci osserva.');

insert into Messaggio(Data, Ora, Mittente, Destinatario, Testo)
values('2018-08-31', '00:05', 'WhoAmI', 'WallyOB','Dopo averla costruita decisi di venderla al governo per la simbolica cifra di un dollaro.');


--Inserimento Tag
insert into Tag
values('informatica');

insert into Tag
values('tecnologia');

insert into Tag
values('ingegneria');

insert into Tag
values('fantasy');

insert into Tag
values('Italia');

insert into Tag
values('geografia');

insert into Tag
values('rivoluzione');

insert into Tag
values('architettura hardware');

insert into Tag
values('romanzo');

insert into Tag
values('innovazione tecnologica');

insert into Tag
values('IT');

insert into Tag
values('serie TV');

insert into Tag
values('tratto da una storia vera');

insert into Tag
values('storie vissute');



--Inserimento CategoriaNarrativa
insert into CategoriaNarrativa
values('Avventura');

insert into CategoriaNarrativa
values('Azione');

insert into CategoriaNarrativa
values('Fantascienza');

insert into CategoriaNarrativa
values('SerieTVFan');

insert into CategoriaNarrativa
values('Horror');

insert into CategoriaNarrativa
values('Fantasy');

insert into CategoriaNarrativa
values('Thriller');

insert into CategoriaNarrativa
values('Comico');

insert into CategoriaNarrativa
values('Storie brevi');

insert into CategoriaNarrativa
values('Storie vere');

insert into CategoriaNarrativa
values('Paranormale');

insert into CategoriaNarrativa
values('Mistero');

insert into CategoriaNarrativa
values('Biografia');

insert into CategoriaNarrativa
values('Storia');

insert into CategoriaNarrativa
values('Scienza');

insert into CategoriaNarrativa
values('Tecnologia');

insert into CategoriaNarrativa
values('Informatica');

insert into CategoriaNarrativa
values('Poesia');

insert into CategoriaNarrativa
values('Vampiri');

insert into CategoriaNarrativa
values('Magia');

insert into CategoriaNarrativa
values('Anime');

insert into CategoriaNarrativa
values('Love Stories');

insert into CategoriaNarrativa
values('Alimentazione');

insert into CategoriaNarrativa
values('Cultura');


--Inserimento di CategoriaNonNarrativa
insert into CategoriaNonNarrativa
values('in Primo Piano');

insert into CategoriaNonNarrativa
values('in Salita');

insert into CategoriaNonNarrativa
values('Nuovo');



--Inserimento di InserimentoNarrativo
insert into InserimentoNarrativo
values('Cultura','La mia Italia','Gio007');

insert into InserimentoNarrativo
values('SerieTVFan','Person Of Interest','WhoAmI');

insert into InserimentoNarrativo
values('Avventura','Avventure nascoste','Mario00');

insert into InserimentoNarrativo
values('Informatica','La Macchina','WhoAmI');

insert into InserimentoNarrativo
values('Storia','Rivoluzioni mancate','Mario00');

insert into InserimentoNarrativo
values('Storie vere','La ricerca della felicità','Gio007');

insert into InserimentoNarrativo
values('Avventura','Kyras: il Druido','Gio007');

insert into InserimentoNarrativo
values('Tecnologia','La Macchina','WhoAmI');

insert into InserimentoNarrativo
values('Fantasy','Kyras: il Druido','Gio007');



--Inserimento di InserimentoNonNarrativo
insert into InserimentoNonNarrativo
values('in Primo Piano','La Macchina','WhoAmI');

insert into InserimentoNonNarrativo
values('Nuovo','Person Of Interest','WhoAmI');

insert into InserimentoNonNarrativo
values('in Salita','La ricerca della felicità','Gio007');


--Inserimento di Lettura
insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('La mia Italia','Gio007','WhoAmI','terminata');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('La mia Italia','Gio007','Balboa','in corso');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('Kyras: il Druido','Gio007','Balboa','terminata');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('La ricerca della felicità','Gio007','Mario00','terminata');


-- sono le sette letture in corso di TobyMindController
insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('La mia Italia','Gio007','TobyMindController','in corso');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('Person Of Interest','WhoAmI','TobyMindController','in corso');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('Avventure nascoste','Mario00','TobyMindController','in corso');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('La Macchina','WhoAmI','TobyMindController','in corso');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('Rivoluzioni mancate','Mario00','TobyMindController','in corso');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('La ricerca della felicità','Gio007','TobyMindController','in corso');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('Kyras: il Druido','Gio007','TobyMindController','in corso');



-- sono le sei letture in corso di MechanicGenius
insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('La mia Italia','Gio007','MechanicGenius','in corso');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('Person Of Interest','WhoAmI','MechanicGenius','in corso');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('Avventure nascoste','Mario00','MechanicGenius','in corso');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('La Macchina','WhoAmI','MechanicGenius','in corso');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('Rivoluzioni mancate','Mario00','MechanicGenius','in corso');

insert into Lettura(TitoloLibro, Autore, Lettore, Stato)
values('La ricerca della felicità','Gio007','MechanicGenius','in corso');




--Inserimento di Following

--utenti seguiti da WhoAmI
insert into Following(Seguace,Seguito)
values ('WhoAmI','TobyMindController');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='WhoAmI') where username = 'WhoAmI';
update Utente set Follower = 1 + (select Follower from Utente where username='TobyMindController') where username = 'TobyMindController';

insert into Following(Seguace,Seguito)
values ('WhoAmI','Balboa');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='WhoAmI') where username = 'WhoAmI';
update Utente set Follower = 1 + (select Follower from Utente where username='Balboa') where username = 'Balboa';

insert into Following(Seguace,Seguito)
values ('WhoAmI','Gio007');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='WhoAmI') where username = 'WhoAmI';
update Utente set Follower = 1 + (select Follower from Utente where username='Gio007') where username = 'Gio007';

--utenti seguiti da Mario00
insert into Following(Seguace,Seguito)
values ('Mario00','TobyMindController');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='Mario00') where username = 'Mario00';
update Utente set Follower = 1 + (select Follower from Utente where username='TobyMindController') where username = 'TobyMindController';

insert into Following(Seguace,Seguito)
values ('Mario00','WhoAmI');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='Mario00') where username = 'Mario00';
update Utente set Follower = 1 + (select Follower from Utente where username='WhoAmI') where username = 'WhoAmI';

insert into Following(Seguace,Seguito)
values ('Mario00','WallyOB');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='Mario00') where username = 'Mario00';
update Utente set Follower = 1 + (select Follower from Utente where username='WallyOB') where username = 'WallyOB';

--utenti seguiti da TobyMindController
insert into Following(Seguace,Seguito)
values ('TobyMindController','MechanicGenius');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='TobyMindController') where username = 'TobyMindController';
update Utente set Follower = 1 + (select Follower from Utente where username='MechanicGenius') where username = 'MechanicGenius';

insert into Following(Seguace,Seguito)
values ('TobyMindController','WallyOB');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='TobyMindController') where username = 'TobyMindController';
update Utente set Follower = 1 + (select Follower from Utente where username='WallyOB') where username = 'WallyOB';

insert into Following(Seguace,Seguito)
values ('TobyMindController','WhoAmI');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='TobyMindController') where username = 'TobyMindController';
update Utente set Follower = 1 + (select Follower from Utente where username='WhoAmI') where username = 'WhoAmI';

--utenti seguiti da Balboa
insert into Following(Seguace,Seguito)
values ('Balboa','Mario00');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='Balboa') where username = 'Balboa';
update Utente set Follower = 1 + (select Follower from Utente where username='Mario00') where username = 'Mario00';

insert into Following(Seguace,Seguito)
values ('Balboa','Gio007');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='Balboa') where username = 'Balboa';
update Utente set Follower = 1 + (select Follower from Utente where username='Gio007') where username = 'Gio007';

insert into Following(Seguace,Seguito)
values ('Balboa','TobyMindController');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='Balboa') where username = 'Balboa';
update Utente set Follower = 1 + (select Follower from Utente where username='TobyMindController') where username = 'TobyMindController';

--utenti seguiti da MechanicGenius
insert into Following(Seguace,Seguito)
values ('MechanicGenius','TobyMindController');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='MechanicGenius') where username = 'MechanicGenius';
update Utente set Follower = 1 + (select Follower from Utente where username='TobyMindController') where username = 'TobyMindController';

insert into Following(Seguace,Seguito)
values ('MechanicGenius','WallyOB');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='MechanicGenius') where username = 'MechanicGenius';
update Utente set Follower = 1 + (select Follower from Utente where username='WallyOB') where username = 'WallyOB';

insert into Following(Seguace,Seguito)
values ('MechanicGenius','Balboa');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='MechanicGenius') where username = 'MechanicGenius';
update Utente set Follower = 1 + (select Follower from Utente where username='Balboa') where username = 'Balboa';

--utenti seguiti da WallyOB
insert into Following(Seguace,Seguito)
values ('WallyOB','WhoAmI');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='WallyOB') where username = 'WallyOB';
update Utente set Follower = 1 + (select Follower from Utente where username='WhoAmI') where username = 'WhoAmI';

--utenti seguiti da Gio007
insert into Following(Seguace,Seguito)
values ('Gio007','WhoAmI');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='Gio007') where username = 'Gio007';
update Utente set Follower = 1 + (select Follower from Utente where username='WhoAmI') where username = 'WhoAmI';

insert into Following(Seguace,Seguito)
values ('Gio007','WallyOB');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='Gio007') where username = 'Gio007';
update Utente set Follower = 1 + (select Follower from Utente where username='WallyOB') where username = 'WallyOB';

insert into Following(Seguace,Seguito)
values ('Gio007','MechanicGenius');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='Gio007') where username = 'Gio007';
update Utente set Follower = 1 + (select Follower from Utente where username='MechanicGenius') where username = 'MechanicGenius';




--Inserimento di Voto

--inserimento voti del libro 'La mia Italia'
insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('La mia Italia','Gio007','WhoAmI',7);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='La mia Italia' and autore='Gio007')
where titolo='La mia Italia' and autore='Gio007';

insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('La mia Italia','Gio007','Mario00',9);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='La mia Italia' and autore='Gio007')
where titolo='La mia Italia' and autore='Gio007';

--inserimento voti del libro 'Person of Interest'
insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('Person Of Interest','WhoAmI','Mario00',8);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='Person Of Interest' and autore='WhoAmI')
where titolo='Person Of Interest' and autore='WhoAmI';

insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('Person Of Interest','WhoAmI','Gio007',10);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='Person Of Interest' and autore='WhoAmI')
where titolo='Person Of Interest' and autore='WhoAmI';

--inserimento voti del libro 'La macchina'
insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('La Macchina','WhoAmI','WallyOB',10);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='La Macchina' and autore='WhoAmI')
where titolo='La Macchina' and autore='WhoAmI';

insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('La Macchina','WhoAmI','MechanicGenius',10);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='La Macchina' and autore='WhoAmI')
where titolo='La Macchina' and autore='WhoAmI';

insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('La Macchina','WhoAmI','Balboa',10);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='La Macchina' and autore='WhoAmI')
where titolo='La Macchina' and autore='WhoAmI';

insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('La Macchina','WhoAmI','TobyMindController',10);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='La Macchina' and autore='WhoAmI')
where titolo='La Macchina' and autore='WhoAmI';

--inserimento voti del libro 'Rivoluzioni mancate'
insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('Rivoluzioni mancate','Mario00','WhoAmI',4);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='Rivoluzioni mancate' and autore='Mario00')
where titolo='Rivoluzioni mancate' and autore='Mario00';

insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('Rivoluzioni mancate','Mario00','MechanicGenius',7);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='Rivoluzioni mancate' and autore='Mario00')
where titolo='Rivoluzioni mancate' and autore='Mario00';

insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('Rivoluzioni mancate','Mario00','Gio007',8);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='Rivoluzioni mancate' and autore='Mario00')
where titolo='Rivoluzioni mancate' and autore='Mario00';

--inserimento voti del libro 'La ricerca della felicità'
insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('La ricerca della felicità','Gio007','Balboa',8);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='La ricerca della felicità' and autore='Gio007')
where titolo='La ricerca della felicità' and autore='Gio007';

insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('La ricerca della felicità','Gio007','TobyMindController',7);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='La ricerca della felicità' and autore='Gio007')
where titolo='La ricerca della felicità' and autore='Gio007';

insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('La ricerca della felicità','Gio007','Mario00',7);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='La ricerca della felicità' and autore='Gio007')
where titolo='La ricerca della felicità' and autore='Gio007';

--inserimento voti del libro 'Kyras: il Druido'
insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('Kyras: il Druido','Gio007','WallyOB',10);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='Kyras: il Druido' and autore='Gio007')
where titolo='Kyras: il Druido' and autore='Gio007';

insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('Kyras: il Druido','Gio007','TobyMindController',10);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='Kyras: il Druido' and autore='Gio007')
where titolo='Kyras: il Druido' and autore='Gio007';
