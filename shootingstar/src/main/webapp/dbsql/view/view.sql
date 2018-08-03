--view.sql

--PICK???�문가?�원???�보�?조회?�기 ?�한 VIEW

create or replace view pickAll
as
select p.*, s.sname 
from smember s
inner join pick p on s.smemberid = p.smemberid; 


-- PFLISTVIEW ?�트?�리?�리?�트�??�트?�리?�테?�블�??�트?�리?�이미�??�이블�? ?�문가?�이블과 카테고리?�이블을 ?�침
CREATE OR REPLACE VIEW PFLISTVIEW AS
select  p.pfno, s.SNAME, s.SMEMBERID , p.cgno ,c.cgname, p.pftitle, i.filename, p.regdate	
from portfolio p inner join pofolimg i
on p.PFNO = i.PFNO
inner join category c
on p.cgno = c.cgno
inner join smember s
on s.SMEMBERID = p.SMEMBERID;

-- PFDETAIL ?�트?�리?�리?�트�??�트?�리?�테?�블�??�트?�리?�이미�??�이블�? ?�문가?�이블과 카테고리?�이블을 ?�침
CREATE OR REPLACE VIEW PFDETAIL AS
 select  p.pfno, p.pftitle, s.SNAME, s.pr , c.cgname,  i.filename, i.pfimgno	
from portfolio p inner join pofolimg i
on p.PFNO = i.PFNO
inner join category c
on p.cgno = c.cgno
inner join smember s
on s.SMEMBERID = p.SMEMBERID;

--smember �ּҰ��� ������ pfno��
CREATE OR REPLACE VIEW SADDRESS AS
select  s.ADDRESS1, p.pfno
from portfolio p inner join smember s
on p.smemberid = s.smemberid;


--쪽�???�?
create or replace view message as
select *
from sendmsg natural join receivemsg;


--결제?�료�??�한 뷰테?�블
create or replace view PAYFINISH
as
select r.rqno, r.cgno, r.rqregion, r.rqdetail, r.memberid, p.pickno, p.smemberid, p.sprice, p.sname, m.name, m.tel From request r left JOIN pickAll p
ON r.rqno = p.rqno
left JOIN member m
ON r.memberid = m.memberid;





