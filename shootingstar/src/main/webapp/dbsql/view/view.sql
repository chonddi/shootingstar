--view.sql

create or replace view ctgProductView
as
select r.*, c.cgname
from request r join category c
on r.cgno=c.cgno;


-- PFLISTVIEW 포트폴리오리스트뷰 포트폴리오테이블과 포트폴리오이미지테이블을 합침
CREATE OR REPLACE VIEW PFLISTVIEW AS

   SELECT *

   FROM PORTfOLIO A natural join POFOLIMG B;