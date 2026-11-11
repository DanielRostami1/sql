use bibliothek;
create table if not exists Verlag (
VerlagID int primary key auto_increment,
Verlag varchar(100) not null
);
create table if not exists Fachbereich (
FachbereichID int primary key auto_increment,
Fachbereich varchar(255) not null unique
);
create table if not exists Fachbuch (
FachbuchID int primary key auto_increment,
ISBN int not null unique,
titel varchar(100) not null,
VerlagID int ,
foreign key (VerlagID) references Verlag(VerlagID)
);
create table if not exists Fachbereich_Fachbuch (
FachbereichID int ,
FachbuchID int,
primary key(FachbereichID,FachbuchID),
foreign key (FachbereichID) references Fachbereich(FachbereichID),
foreign key (FachbuchID) references Fachbuch(FachbuchID)

);