use uebungsdatenbank;
-- 1
create table if not exists mageschenk (
   geschenkID smallint  primary key,
   artikel varchar(200) not null,
   preis decimal(5,2) not null,
   jahrzugehoerigkeit smallint not null
 );

 
 -- 2
 
 DROP TABLE if exists mageschenk;
 create table if not exists mageschenk (
    geschenkID smallint primary key ,
    artikel varchar(200) not null unique,
    preis decimal(5,2) not null,
    jahrzugehoerigkeit smallint not null
    );
    insert into mageschenk (geschenkID, artikel, preis, jahrzugehoerigkeit)
    values (1,'uhr',100,10);
    -- describe mageschenk;
    insert into mageschenk (geschenkID, artikel, preis, jahrzugehoerigkeit)
    values (2,'rucksack',20,15);
	insert into mageschenk (geschenkID, artikel, preis, jahrzugehoerigkeit)
    values (3,'rucksack',20,15);
    -- 3
  
    alter table mageschenk
    modify  preis  decimal(5,2) not null default 0.00;
    -- 4
    alter table mageschenk
    ADD CONSTRAINT check_jahre check (jahrzugehoerigkeit in(5,10,15,20));
    insert into mageschenk (geschenkID,artikel, preis,jahrzugehoerigkeit) values (3,'haube',30,20);
    insert into mageschenk (geschenkID,artikel, preis,jahrzugehoerigkeit) values (4,'auto',300,5);
    insert into mageschenk (geschenkID,artikel, preis,jahrzugehoerigkeit) values (5,'fahrrad',300,12);
   
    
    

    
 