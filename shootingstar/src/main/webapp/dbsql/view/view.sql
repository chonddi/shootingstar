--view.sql

--PICK한 전문가회원의 정보를 조회하기 위한 VIEW

create or replace view pickAll
as
select p.*, s.sname 
from smember s
inner join pick p on s.smemberid = p.smemberid; 


-- PFLISTVIEW 포트폴리오리스트뷰 포트폴리오테이블과 포트폴리오이미지테이블와 전문가테이블과 카테고리테이블을 합침
CREATE OR REPLACE VIEW PFLISTVIEW AS
select  p.pfno, s.SNAME , p.cgno ,c.cgname, p.pftitle, i.filename	
from portfolio p inner join pofolimg i
on p.PFNO = i.PFNO
inner join category c
on p.cgno = c.cgno
inner join smember s
on s.SMEMBERID = p.SMEMBERID;

-- PFDETAIL 포트폴리오리스트뷰 포트폴리오테이블과 포트폴리오이미지테이블와 전문가테이블과 카테고리테이블을 합침
CREATE OR REPLACE VIEW PFDETAIL AS
 select  p.pfno, p.pftitle, s.SNAME, s.pr , c.cgname,  i.filename	
from portfolio p inner join pofolimg i
on p.PFNO = i.PFNO
inner join category c
on p.cgno = c.cgno
inner join smember s
on s.SMEMBERID = p.SMEMBERID;