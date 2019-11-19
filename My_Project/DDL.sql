create database BookPad;

\c bookpad

create table Utente(
 Username varchar(40) primary key,
 Nome varchar(20) not null,
 Cognome varchar(20) not null,
 Email varchar(40) unique not null check(Email like '%@%.%'),
 Password varchar(20) not null,
 Utenti_seguiti int default 0,
 Follower int default 0,
 Nazione varchar(30) not null,
 -- Un Utente è considerato sia lettore che scrittore se il suo tipo è 'S'
 Tipo char default 'L' check(Tipo like 'L' or Tipo like 'S')
);

create table Libro(
 Titolo varchar(50),
 Autore varchar(40) references Utente(Username) on update cascade on delete cascade,
 Npagine int not null,
 Stato varchar(10) not null check(Stato='in corso' or Stato='terminato'),
 Nvoti int default 0,
 Nvolume int default 1,
 Data_ultimo_aggiornamento timestamp not null,
 Collana varchar(30),
 Nletture int default 0,
 primary key(Titolo,Autore)
);

create table Capitolo(
 Titolo varchar(30),
 TitoloLibro varchar(50),
 AutoreLibro varchar(40),
 Numero int not null,
 foreign key(TitoloLibro,AutoreLibro) references Libro(Titolo,Autore) on update cascade on delete cascade,
 primary key(Titolo,TitoloLibro,AutoreLibro)
);

create table Paragrafo(
 Nparagrafo int,
 TitoloCapitolo varchar(30),
 TitoloLibro varchar(50),
 AutoreLibro varchar(40),
 foreign key(TitoloCapitolo,TitoloLibro,AutoreLibro) references Capitolo(Titolo,TitoloLibro,AutoreLibro) on update cascade on delete cascade,
 primary key(Nparagrafo,TitoloCapitolo,TitoloLibro,AutoreLibro)
);


create table Commento(
 Data date,
 -- la data è nel formato YYYY-MM-DD
 Ora time,
 Utente varchar(40) references Utente(Username) on update cascade on delete cascade,
 Nparagrafo int not null,
 TitoloC varchar(30) not null,
 TitoloL varchar(50) not null,
 Autore varchar(40) not null,
 Testo text not null,
 foreign key(Nparagrafo,TitoloC,TitoloL,Autore) references Paragrafo(Nparagrafo,TitoloCapitolo,TitoloLibro,AutoreLibro) on update cascade on delete cascade,
 primary key(Data,Ora,Utente)
);



create table Messaggio(
 Data date,
 Ora time,
 Mittente varchar(40) references Utente(Username) on update cascade on delete cascade,
 Destinatario varchar(40) references Utente(Username) on update cascade on delete cascade,
 Testo text not null,
 primary key(Data,Ora,Mittente)
);

create table Tag(
 Nome varchar(100) primary key);

create table CategoriaNarrativa(
 Nome varchar(20) primary key);

create table CategoriaNonNarrativa(
 Nome varchar(20) primary key);

 create table TagperLibro(
   Tag varchar(100) references Tag(Nome) on update cascade on delete cascade,
   TitoloLibro varchar(50),
   AutoreLibro varchar(40),
   foreign key(TitoloLibro, AutoreLibro) references Libro(Titolo, Autore) on update cascade on delete cascade,
   primary key(Tag, TitoloLibro, AutoreLibro)
 );

 create table InserimentoNonNarrativo(
   Categoria varchar(20) references CategoriaNonNarrativa(Nome) on update cascade on delete cascade,
   TitoloLibro varchar(50),
   AutoreLibro varchar(40),
   foreign key (TitoloLibro, AutoreLibro) references Libro(Titolo, Autore) on update cascade on delete cascade,
   primary key(Categoria, TitoloLibro, AutoreLibro)
 );

 create table InserimentoNarrativo(
   Categoria varchar(20) references CategoriaNarrativa(Nome) on update cascade on delete cascade,
   TitoloLibro varchar(50),
   AutoreLibro varchar(40),
   foreign key (TitoloLibro, AutoreLibro) references Libro(Titolo, Autore) on update cascade on delete cascade,
   primary key(Categoria, TitoloLibro, AutoreLibro)
 );

 create table Lettura(
   TitoloLibro varchar(50),
   Autore varchar(40),
   Lettore varchar(40) references Utente(Username) on update cascade on delete cascade,
   Stato varchar(10) not null check(Stato='in corso' or Stato='terminata'),
   foreign key(TitoloLibro, Autore) references Libro(Titolo, Autore) on update cascade on delete cascade,
   primary key(TitoloLibro, Autore, Lettore)
 );

create table Following(
  Seguace varchar(40) references Utente(Username) on update cascade on delete cascade,
  Seguito varchar(40) references Utente(Username) on update cascade on delete cascade,
  primary key(Seguace, Seguito)
);

-- Creazione di un dominio personalizzato per il valore del voto in Voto
create domain voto_d as int default NULL check(value>=0 AND value<=10);

create table Voto(
  TitoloLibro varchar(50),
  Autore varchar(40),
  Lettore varchar(40) references Utente(Username) on update cascade on delete cascade,
  Valore voto_d default 0,
  foreign key(TitoloLibro, Autore) references Libro(Titolo, Autore) on update cascade on delete cascade,
  primary key(TitoloLibro, Autore, Lettore)
);




-- Vista 1
create view vista_1 as select COALESCE(t1.nazione,t2.nazione) as nazione,COALESCE(libri_scritti,0) as libri_scritti,
COALESCE(media_libri_in_lettura_per_utente,0) as media_libri_in_lettura_per_utente
from
(
  select nazione,count(*) as libri_scritti
  from utente u
  join libro as l on u.username = l.autore
  group by nazione
) as t1 full join
(
  select nazione, count(distinct lettore) lettori_per_nazione,count(*)/count(distinct lettore) as media_libri_in_lettura_per_utente
  from utente
  join lettura on lettura.lettore = utente.username
  where lettura.stato = 'in corso'
  group by nazione
) as t2 on t1.nazione = t2.nazione;


-- Vista 2
create view vista_2 as select l1.lettore as Lettore1, l2.lettore as Lettore2
from lettura l1 join lettura l2 on l1.titololibro = l2.titololibro and l1.lettore != l2.lettore
where l1.stato='in corso' and l2.stato = 'in corso' and l1.lettore < l2.lettore group by(l1.lettore, l2.lettore)
having count(l1.lettore)>5;
