-- Inserimento Libro OP 1
insert into Libro(titolo, autore, npagine, stato, Data_ultimo_aggiornamento,nletture)
values('Conflitti di poteri', 'MechanicGenius', 5, 'in corso', '2018-03-04 17:30',0);

--MechanicGenius diventa scrittore quindi il tipo aggiornato a 'S'
update Utente set tipo = 'S' where Username = 'MechanicGenius';

insert into Capitolo(titolo, titololibro, autorelibro, numero)
values('1 - La Storia si ripete','Conflitti di poteri','MechanicGenius',1);

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(1,'1 - La Storia si ripete','Conflitti di poteri','MechanicGenius');

insert into Paragrafo(nparagrafo, TitoloCapitolo, titololibro, AutoreLibro)
values(2,'1 - La Storia si ripete','Conflitti di poteri','MechanicGenius');

insert into InserimentoNarrativo
values('Storia','Conflitti di poteri','MechanicGenius');



-- Inserimento voto OP 7
insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('Rivoluzioni mancate','Mario00','TobyMindController',6);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='Rivoluzioni mancate' and autore='Mario00')
where titolo='Rivoluzioni mancate' and autore='Mario00';

insert into Voto(TitoloLibro,Autore,Lettore,Valore)
values ('La mia Italia','Gio007','TobyMindController',8);
update Libro set nvoti = 1 + (select nvoti from Libro where titolo='La mia Italia' and autore='Gio007')
where titolo='La mia Italia' and autore='Gio007';

-- Memorizzazione Follower OP 9
insert into Following(Seguace,Seguito)
values ('Gio007','Balboa');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='Gio007') where username = 'Gio007';
update Utente set Follower = 1 + (select Follower from Utente where username='Balboa') where username = 'Balboa';

insert into Following(Seguace,Seguito)
values ('Gio007','Mario00');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='Gio007') where username = 'Gio007';
update Utente set Follower = 1 + (select Follower from Utente where username='Mario00') where username = 'Mario00';

insert into Following(Seguace,Seguito)
values ('Gio007','TobyMindController');
update Utente set Utenti_seguiti = 1 + (select Utenti_seguiti from Utente where username='Gio007') where username = 'Gio007';
update Utente set Follower = 1 + (select Follower from Utente where username='TobyMindController') where username = 'TobyMindController';


-- Rimozione di un follower OP 10

delete from Following where Seguace = 'Balboa' and Seguito = 'Mario00';
update Utente set Utenti_seguiti = (select Utenti_seguiti from Utente where username='Balboa') - 1 where username = 'Balboa';
update Utente set Follower = (select Follower from Utente where username='Mario00') -1 where username = 'Mario00';

delete from Following where Seguace = 'Balboa' and Seguito = 'Gio007';
update Utente set Utenti_seguiti = (select Utenti_seguiti from Utente where username='Balboa') -1 where username = 'Balboa';
update Utente set Follower = (select Follower from Utente where username='Gio007') - 1 where username = 'Gio007';
