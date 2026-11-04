use uebungsdatenbank;
SELECT mitarbeiterid,name,vorname, eintrittsdatum, austrittsdatum FROM mitarbeiter
 where austrittsdatum is not null ;
SELECT mitarbeiterid,name,vorname,eintrittsdatum,austrittsdatum, austrittsgrund FROM mitarbeiter
where austrittsdatum is not null;
select * from mitarbeiter;
select * from mitarbeiter where abteilung = 'Vertrieb';
SELECT mitarbeiterid, name, vorname, urlaubstage, urlaubgenommen FROM mitarbeiter
 WHERE urlaubgenommen >= 30;
select mitarbeiterid,name,vorname from mitarbeiter where anzahlkinder >= 1;
-- punkt7
select mitarbeiterid, name,vorname  from mitarbeiter 
where eintrittsdatum between '1990-01-01' and '2000-01-01';
-- 8
select * from mitarbeiter
 where geschlecht ='w' and abteilung = 'Vertrieb' ;
 -- 9
 select * from mitarbeite
 where geschlecht = 'w'and  (krankenversicherung = 'MH Plus Bonn' OR krankenversicherung = 'IKK gesund plus');
 -- 10 
 select * from mitarbeiter 
 where geschlecht ='w'  and verheiratet='nein' and  anzahlkinder > 0 ;
 -- 11
 select * from krankenkasse limit 10;
 -- 12
 select name, vorname,abteilung from mitarbeiter 
 order by abteilung asc,name asc,vorname asc;
 -- 13
 select name, vorname, abteilung, bonus from mitarbeiter 
 order by abteilung asc,bonus asc;
 -- 14
 select name as Name ,vorname as Vorname ,strasse as Strasse,
 hausnummer as Hausnummer,plz as Postleitzahl ,ort as Ort 
 from mitarbeiter ;
 -- 15
 select ort , count(ort) as anzahl from mitarbeiter
 group by ort;
