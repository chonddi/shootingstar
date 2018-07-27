--view.sql

create or replace view ctgProductView
as
select r.*, c.cgname
from request r join category c
on r.cgno=c.cgno;


-- PFLISTVIEW ?�트?�리?�리?�트�??�트?�리?�테?�블�??�트?�리?�이미�??�이블�? ?�문가?�이블과 카테고리?�이블을 ?�침
CREATE OR REPLACE VIEW PFLISTVIEW AS
select  p.pfno, s.SNAME , p.cgno ,c.cgname, p.pftitle, i.filename	
from portfolio p inner join pofolimg i
on p.PFNO = i.PFNO
inner join category c
on p.cgno = c.cgno
inner join smember s
on s.SMEMBERID = p.SMEMBERID;

-- PFDETAIL ?�트?�리?�리?�트�??�트?�리?�테?�블�??�트?�리?�이미�??�이블�? ?�문가?�이블과 카테고리?�이블을 ?�침
CREATE OR REPLACE VIEW PFDETAIL AS
 select  p.pfno, p.pftitle, s.SNAME, s.pr , c.cgname,  i.filename	
from portfolio p inner join pofolimg i
on p.PFNO = i.PFNO
inner join category c
on p.cgno = c.cgno
inner join smember s
on s.SMEMBERID = p.SMEMBERID;

--쪽지함 뷰
create or replace view message as
select *
from sendmsg natural join receivemsg;