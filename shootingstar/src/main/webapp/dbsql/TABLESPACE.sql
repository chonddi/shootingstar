--sys�� system �������� �α����ؼ� ����� ����, ���̺����̽� �����ϱ�
--sqlplus "/as sysdba  ==>�ý���dba����

--���̺� �����̽� ����
create tablespace shootingstar
datafile 'D:\myoracle\data\shootingstar.dbf' size 2G    --D:\myoracle\data ������ ����
extent management local
uniform size 64k
segment space management auto;

--����� ���� ����
create user star
identified by star123
default tablespace shootingstar;

--����� ���Ѻο�
grant connect, resource to star;
--grant connect, dba to star with admin option;

--�� ���� ���� �ο��ϱ�
grant create view to star;