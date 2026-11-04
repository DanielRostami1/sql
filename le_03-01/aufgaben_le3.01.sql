use ubungsdatenbank;
-- 1
 insert into qualifikationen (qid, bezeichnung, kuerzel, kategorie) 
values (8,'SQL','ITE','Informatik');
select * from qualifikationen;
-- 2
insert into qualifikationen (qid, bezeichnung, kuerzel, kategorie)
values (9,'Sys-Admin','ADA','Support');
select * from qualifikationen;
-- 3
insert into qualifikationen (qid, bezeichnung)
values (10,'Projektleitung');
select * from qualifikationen;
-- 4
update qualglobal 
set bezeichnung = 'Second Level Helpdes' where qid = 2;
update qualglobal 
set bezeichnung = 'First Level Helpdesk',kuerzel = 'FLH'
where qid = 3;
select * from qualglobal;
-- 5
USE uebungsdatenbank;
UPDATE qualglobalarchiv 
SET kuerzel = 'DBE' 
WHERE kuerzel = 'DAT';
SELECT * FROM qualglobalarchiv;
-- 6
delete from qualglobalarchiv where qid = 2;
select * from qualglobalarchiv;
-- 7
delete from qualglobalarchiv where qid in (5,6,7);
select * from qualglobalarchiv;
-- 8
delete from qualglobalarchiv;
select * from qualglobalarchiv;
