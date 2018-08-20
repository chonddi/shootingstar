--view.sql

--caution - YOU should insert sMemberID-"미정"(Mi Jung (uncertain)) into smember table before you run the test

-- VIEW for request inquiry

CREATE OR REPLACE VIEW RQLIST AS		
select  r.rqno, r.memberid, r.cgno, r.rqprice, r.rqregion, r.rqdate,
		r.rqtype, r.pickcount, r.rqdetail, r.regdate, r.delflag, p.plevel, p.pickno		
from request r inner join pick p
on r.rqno = p.rqno;

-- VIEW for selecting smembers regards to PICK

create or replace view pickAll
as
select p.*, s.sname 
from smember s
inner join pick p on s.smemberid = p.smemberid; 


-- PFLISTVIEW 포트폴리오 리스트뷰/ 포트폴리오 테이블, 포폴이미지 테이블, 전문가 테이블과 카테고리 테이블을 합침
CREATE OR REPLACE VIEW PFLISTVIEW AS
select  p.pfno, s.SNAME, s.SMEMBERID , p.cgno ,c.cgname, p.pftitle, i.filename, p.regdate, s.authority, p.delflag		
from portfolio p inner join pofolimg i
on p.PFNO = i.PFNO
inner join category c
on p.cgno = c.cgno
inner join smember s
on s.SMEMBERID = p.SMEMBERID;

-- PFDETAIL 포트폴리오 디테일/ 포트폴리오 테이블 포트폴리오 이미지 테이블과 전문가 테이블과 카테고리 테이블을 합침
CREATE OR REPLACE VIEW PFDETAIL AS
 select  p.pfno, p.pftitle, s.SNAME, s.pr , c.cgname,  i.filename, i.pfimgno	
from portfolio p inner join pofolimg i
on p.PFNO = i.PFNO
inner join category c
on p.cgno = c.cgno
inner join smember s
on s.SMEMBERID = p.SMEMBERID;

--smember 포트폴리오 합침
CREATE OR REPLACE VIEW SADDRESS AS
select  s.ADDRESS1, p.pfno
from portfolio p inner join smember s
on p.smemberid = s.smemberid;


--쪽지함
create or replace view message as
select *
from sendmsg natural join receivemsg;


--View for port_payfinish.jsp
create or replace view PAYFINISH
as
select r.rqno, r.cgno, r.rqregion, r.rqdetail, r.memberid, p.pickno, p.smemberid, p.sprice, p.sname, m.name, m.tel, p.plevel From request r left JOIN pickAll p
ON r.rqno = p.rqno
left JOIN member m
ON r.memberid = m.memberid;


--View for port_payfinish.jsp and port_transactional.jsp
create or replace view TRANSACINFO
as
select lpad(r.pno, 6, 0) as PNO, r.memberid, c.cgname, p.sname, p.smemberid, p.rqregion, r.regdate, r.pmethod, r.usemile, r.pprice, p.pickno, r.flag
from rqpayment r left join payfinish p
on r.pickno=p.pickno
left join category c
on p.cgno=c.cgno;


--View for port_payfinish2.jsp and port_transactional2.jsp
create or replace view TRANSACINFO2
as
select lpad(r.pno, 6, 0) as PNO, r.memberid, c.cgname, p.name, p.smemberid, p.rqregion, r.regdate, r.pmethod, r.pprice, p.pickno, r.flag
from rqpayment r left join payfinish p
on r.pickno=p.pickno
left join category c
on p.cgno=c.cgno;


--View for Qlist.jsp
create or replace view QNAlist
as
select q.*, (select count(*) from qnare r where r.qno=q.qno) as REPLYCNT
from qna q;



