-- le 8
use uebungsdatenbank;
-- 1 tablle erstllen
drop table if exists accounts;
create table if not exists accounts (
kontonummer int primary key,
kontoinhaber varchar(100) not null,
kontostand decimal(10,2) not null
);
describe accounts;
-- 2 bispieldaten einfuegen
insert into accounts (kontonummer, kontoinhaber, kontostand)
values
(1001, 'max mustermaan', 1500.00),
(1002, 'burhan rostami',800.00),
(1003, 'rauf rahimi',50.00);


-- 3 die funktion (prozedur) fuer die bankueberweisung erstellen
-- Wir sagen MySQL: Die Prozedur ist erst fertig, wenn du // siehst.
delimiter //
-- CREATE PROCEDURE – Eine gespeicherte Prozedur erstellen
-- IN bedeutet, dass ein Wert von außen in die Prozedur hineingegeben wird.
create procedure Bankueberweisung (
in p_Senderkonto int,
in p_Empfaengerkonto int,
in p_Betrag decimal(10,2)
)
-- BEGIN = Hier beginnt der Code der Prozedur
begin
-- wir starten die Transaktion
start transaction;
-- 1: geld vom sender abziehen
update accounts set kontostand = kontostand - p_Betrag
where kontonummer = p_Senderkonto;

-- 2: pruefen , ob  kontstand danach negative ist 
-- (wir holen uns den aktuellen kontostand von sender)
if (select kontostand from accounts where kontonummer = p_Senderkonto) < 0 then
-- wenn ja, abbrechen und alles rueckgaengig machen
-- ROLLBACK – Änderungen rückgängig machen
rollback;
select 'ueberweisung fehlgeschlagen: nicht genuegend guthaben!' as Meldung;
else 
-- wenn nein (genug geld da), geld auf empfengerkont addieren
update accounts set kontostand = kontostand + p_Betrag
where kontonummer = p_Empfaengerkonto;

-- transkation erflgereich abschliessen und speichern
-- COMMIT – Änderungen speichern

commit;
select 'ueberweisung erfolgereich durchgefuehrt!' as Meldung;
end if;

end //
-- END = Hier endet der Code der Prozedur.
-- // = Ende der gesamten Prozedurdefinition.
delimiter ; 
-- testen die funktion :gultige ueberweisung zb 100 euro von konto 1001 auf 1002
call bankueberweisung(1001,1002,100.00);
-- pruefen
select * from accounts;




