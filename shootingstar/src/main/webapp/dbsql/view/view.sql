--view.sql

create or replace view ctgProductView
as
select r.*, c.cgname
from request r join category c
on r.cgno=c.cgno;