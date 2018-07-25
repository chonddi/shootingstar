--view.sql

create or replace view ctgProductView
as
select r.*, c.cgname
from request r join category c
on r.cgno=c.cgno;


-- PFLISTVIEW 포트폴리오리스트뷰 포트폴리오테이블과 포트폴리오이미지테이블와 전문가테이블과 카테고리테이블을 합침
CREATE OR REPLACE VIEW PFLISTVIEW AS
select  p.pfno, s.SNAME , p.cgno ,c.cgname, p.pftitle, i.filename	
from portfolio p inner join pofolimg i
on p.PFNO = i.PFNO
inner join category c
on p.cgno = c.cgno
inner join smember s
on s.SMEMBERID = p.SMEMBERID;