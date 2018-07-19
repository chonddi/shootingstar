--sys나 system 계정으로 로그인해서 사용자 생성, 테이블스페이스 생성하기
--sqlplus "/as sysdba  ==>시스템dba접속

--테이블 스페이스 생성
create tablespace shootingstar
datafile 'D:\myoracle\data\shootingstar.dbf' size 2G    --D:\myoracle\data 폴더에 저장
extent management local
uniform size 64k
segment space management auto;

--사용자 계정 생성
create user star
identified by star123
default tablespace shootingstar;

--사용자 권한부여
grant connect, resource to star;
--grant connect, dba to star with admin option;

--뷰 생성 권한 부여하기
grant create view to star;