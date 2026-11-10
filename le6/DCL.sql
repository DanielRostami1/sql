-- user erstllen mit password
-- 1
create user if not exists 'daniel'@'localhost'
identified by '*************';
-- rechte fuer tabelle artikel vergeben
grant select,update,insert on uebungsdatenbank.artikel to 'daniel'@'localhost';
-- rechte neue laden
flush privileges;
-- 2
-- berechtigung entziehen
revoke select, insert, update ON uebungsdatenbank.artikel FROM 'daniel'@'localhost';
-- user loeschen
 -- drop user if exists 'daniel'@'localhost';
-- 3
-- rolle erstellen
create role 'vertrieb';
-- fuer rolle rechte geben
grant select ,insert , update on uebungsdatenbank.artikel to 'vertrieb';
-- neue user erstellen
create user if not exists 'franz'@'localhost' 
identified by '12345';
create user if not exists 'maria'@'localhost'
identified by '12345';
-- benuzer rolle 'vertrieb' zuweisen
grant 'vertrieb' to 'franz'@'localhost';
grant 'vertrieb' to 'maria'@'localhost';
-- wichtig!! die rolle muss fuer benuzer standardmaessig aktiviert werden!
set default role all to 'franz'@'localhost' , 'maria'@'localhost';
-- rechte entziehen
revoke insert , update on uebungsdatenbank.artikel from 'vertrieb';
-- role loeschen
drop role 'vertrieb';



