use uebungsdatenbank;
-- 1 : mitarbeiter mit mehreren sachpraemien
-- where : Welche Datensaetze moechte ich auswaehlen?
-- havin: filtert gruppierte ergebnisse(welche gruppen moechte  ich behalten)
select name, vorname
from mitarbeiter
where mitarbeiterid in (
select mitarbeiterid 
from sachpraemie
group by mitarbeiterid
having count(*) > 1
);
-- 2 :summe der praemien und name ausgeben
select m.name , m.vorname, p.gesamtsumme
from mitarbeiter m
inner join (
select mitarbeiterid ,sum(preis) as gesamtsumme
from sachpraemie 
group by mitarbeiterid
) p 
on m.mitarbeiterid = p.mitarbeiterid;
-- p : Alias fuer die Unterabfrage.
-- Die Unterabfrage berechnet zuerst die Summe der Preise pro Mitarbeiter.
-- 3: Steuerklasse nicht in der Tabelle sterklasse
select name , vorname 
from mitarbeiter
where steuerklasse not in(
select  steuerklassezahl
from steuerklasse
);
-- 4: sterklasse zugewiesen, aber nich in der Tabelle vorhanden
select m1.name, m1.vorname
from mitarbeiter m1
where m1.steuerklasse is not null
and not exists (
    select 1 
    from steuerklasse s 
    where s.steuerklassezahl = m1.steuerklasse
);