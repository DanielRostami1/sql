use uebungsdatenbank;
-- 1 : view v_urlaub
-- erstllen wir ein view das folgende anzeigt 
create view v_urlaub as
select name, vorname, urlaubstage, urlaubgenommen
from mitarbeiter ;
-- testen abfrage 
select * from v_urlaub;
-- 2: view v_praemie
-- wir verbinden(join) tabellen mitarbeiter und sachpraemie
create view v_praemie as 
select m.name, m.vorname,
 s.praemie, s.grund from mitarbeiter m
inner join sachpraemie s 
on m.mitarbeiterid = s.mitarbeiterid;
-- 3 : view v_mitarbeiterbonus
create view v_mitarbeiterbonus as
select m.name , m.vorname, b.bonuszahlung as bonus
from mitarbeiter m
inner join bonus b
on m.mitarbeiterid = b.mitarbeiterid
order by  b.bonuszahlung asc;
-- 4:
create view v_mitarbeiterkrankenkasse as
select mitarbeiterid, name, vorname, krankenversicherung 
from mitarbeiter ;
insert into v_mitarbeiterkrankenkasse (mitarbeiterid, name , vorname, krankenversicherung )
values
(51, 'Test', 'mitarbeiter', 'OGK');

-- 5: view entfernen
drop view v_mitarbeiterkrankenkasse;
