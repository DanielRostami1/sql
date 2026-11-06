use uebungsdatenbank;
create table if not exists produktionsmaschinen (
maschinenID int  ,
variante int ,
bezeichnung varchar(200),
primary key (maschinenID,variante)
);

insert into produktionsmaschinen (maschinenID, variante, bezeichnung)
 values
(1, 1, 'Bohrmaschine'),
(1, 2, 'Bohrmaschine'),
(2, 1, 'Flex'),
(2, 2, 'Flex');
use uebungsdatenbank;
describe produktionsmaschinen;

-- 2
use uebungsdatenbank;
drop table if exists produktionsmaschinen;
create table  if not exists produktionsmaschinen (
globalID int primary key,
maschinenID int,
variante int ,
bezeichnung varchar(200),
unique (maschinenID,variante)
);

insert into produktionsmaschinen (globalId,maschinenID,variante, bezeichnung) 
values 
(1,1,1,'bormaschine'),
(2,1,2,'bormaschine'),
(3,2,1,'flex'),
(4,2,2,'flex');

-- 3
drop table if exists produktionsmaschinen;
create table if not exists produktionsmaschinen (
globalID int primary key ,
laufzeit int ,
maxlaufzeit int,
maschinenId int,
variante int,
bezeichnung varchar(200),
unique (maschinenID, variante),
-- plausibilitaetsregel:
constraint check_laufzeit check (laufzeit < maxlaufzeit)
);

insert into produktionsmaschinen (globalID ,laufzeit,
maxlaufzeit,maschinenID, variante, bezeichnung) 
values 
(1,1,100,1,1,'bormaschine'),
(2,1,500,2,1,'flex');





