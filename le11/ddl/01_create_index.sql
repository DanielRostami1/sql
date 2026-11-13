use uebungsdatenbank;
-- 1:index erstellen
create index index_arbeitszeit_mitarbeiter
on arbeitszeit (mitarbeiterid);
-- 2: zusammengesetzen index erstllen
create index index_plzort
on kreditinstitutneu (ort,plz);
-- 3 : indiezes wieder entfernen
drop index index_arbeitszeit_mitarbeiter on arbeitszeit;
drop index index_plzort on kreditinstitutneu;
-- CREATE INDEX index_arbeitszeit_mitarbeiter legt den Namen des Index fest. 
-- ON arbeitszeit (mitarbeiterid) sagt der Datenbank, auf welcher Tabelle und welcher Spalte der "Wegweiser" angelegt werden soll
-- testen
-- SELECT * FROM arbeitszeit WHERE mitarbeiterid = 2;