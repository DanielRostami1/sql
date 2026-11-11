use bibliothek;
-- 1
select fachbuch.titel,
fachbuch.ISBN,
fachbuch.Verlagid  ,
verlag.verlag,
verlag.VerlagID from Fachbuch
left join verlag
on fachbuch.VerlagID = verlag.VerlagID ;
-- 2 
-- full outer join nach bauen da workbench es nicht kennt!
select fachbuch.titel,
fachbuch.ISBN,
fachbuch.Verlagid  ,
verlag.verlag,
verlag.VerlagID from Fachbuch
left join verlag
on fachbuch.VerlagID = verlag.VerlagID 
union
select fachbuch.titel,
fachbuch.ISBN,
fachbuch.Verlagid  ,
verlag.verlag,
verlag.VerlagID from Fachbuch
right join verlag
on fachbuch.VerlagID = verlag.VerlagID ;
-- 3
-- cross join macht tableA * TableB .Wenn tA 3 zeile und tB 5 zeile dann ergibt sich 3*5=15 zeilen.
 select * from fachbuch
 cross join verlag;
-- 4
select fachbuch.titel, 
    fachbereich.fachbereich
from fachbuch
inner join fachbereich_fachbuch 
on fachbuch.FachbuchID = fachbereich_fachbuch.FachbuchID
inner join fachbereich 
on fachbereich_fachbuch.FachbereichID = fachbereich.FachbereichID;
-- 5
select f.ISBN,
f.titel,
a.titel,
a.isbn,
a.von,
a.bis
from fachbuch f 
inner join ausleihe a
on f.fachbuchID = a.fachbuchID;


