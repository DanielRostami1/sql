use uebungsdatenbank;
-- 5.1
-- union doplicate entfernt
select name, vorname 
from niederlassungbelgien
union 
select name, vorname 
from niederlassungholland;
-- 5.2
-- union all doplikat ist erlaupt
select name, vorname 
from niederlassungbelgien
union all 
select name, vorname 
from niederlassungholland;
-- 5.3
select name, vorname 
from niederlassungbelgien
union 
select name, vorname 
from niederlassungschweiz
union 
select name, vorname 
from niederlassungholland;
-- 5.4
 -- inner join gibt nur uebereinstimmede daten aus 2 tabelen
select h.name , h.vorname
 from niederlassungbelgien h
inner join niederlassungholland b 
on h.name = b.name and h.vorname = b.vorname;

-- 5.5
select h.name, b.vorname 
from niederlassungholland h
left join niederlassungbelgien b
on h.name = b.name and h.vorname = b.vorname
where b.name is  null ;
-- 5.6
select name, vorname , status
from niederlassungholland 
where status= 'aktiv'
union
select name, vorname , status
from niederlassungbelgien 
where status= 'aktiv';
-- 5.7
select name ,vorname
from niederlassungholland
union
select name , vorname
from niederlassungbelgien
order by name;




