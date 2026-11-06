use uebungsdatenbank;
create table if not exists Kunden (
Kunden_id int primary key  ,
Name varchar(100) not null ,
Vorname varchar(100) not null ,
Email varchar(150) not null  unique,
Telefon int not null,
Geburtsdatum date
);
