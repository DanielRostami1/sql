use bibliothek;
create table if not exists ausleihe (
ausleiheID int ,
exemplarID int ,
von timestamp,
bis timestamp,
isbn int not null unique,
titel varchar(100) not null unique,
fachbuchID int,
PRIMARY KEY (ausleiheID, exemplarID),
foreign key (fachbuchID) references fachbuch(fachbuchID)

);