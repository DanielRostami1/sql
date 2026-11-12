use uebungsdatenbank;
-- 1
-- table umbenenen
alter table artikel rename to artikelaktuell;
-- 2 spalte umbenenen
alter table artikelaktuell rename column bezeichnung_artikel to bezeichnung;
-- 3 : datentyp einer spalte aendern 
alter table artikelaktuell modify status varchar(300);
-- pruefen
describe artikelaktuell;
-- 4:primary key  hinzufuegen
alter table artikelaktuell 
add primary key (artikelid) ;
-- 5:primary key von einer anderen table loeschen
alter table artikelinfo drop primary key ;
-- 6:not null hinzufuegen (Spalte tiefe darf nicht mehr leer sein)
alter table artikelaktuell modify tiefe decimal(8,2) not null;
-- 7 :not null einschraenkung wieder entfernen (null wieder erlauben)
alter table artikelaktuell modify tiefe decimal(8,2) null;
-- 8: standartwert default hinzufuegen
alter table artikelaktuell alter column preis set  default 0.00;
-- 9: standart wieder entfernen
alter table artikelaktuell alter column preis drop default;
-- 10: unique einschraenkung hinzufuegen (jeder artikel nur einmal)
alter table artikelaktuell add constraint unique_bezeichnung unique (bezeichnung);
-- 11 :
alter table artikelaktuell add constraint check_preis check(preis < 1000.00);
-- 12 :check einschraenkung wider entfernen
alter table artikelaktuell drop constraint check_preis;
-- 13: neue spalte hinzufuegen
alter table artikelaktuell add column kommentar varchar(300);
-- 14 : spalte entfernen
alter table artikelaktuell drop column kommentar;
-- 15 :1 zu n beziehung herstellen (fremdschlussel hinzufuegen)
-- zuerst eine primary key einfugen dann verbinung fk hinzufuegen!!
describe artikelinfo;
alter table  artikelinfo add primary key (artikelid);
alter table positionartikel
add constraint fk_position_artikelinfo
foreign key (fk_artikelinfo_artikelid) references artikelinfo(artikelid);

-- 16 :1 zu n beziehung entfernen (fremdschluessel loeschen)
alter table positionartikel
drop foreign key fk_position_artikelinfo;


