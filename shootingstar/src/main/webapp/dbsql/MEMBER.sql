/* ���̺� ���*/
DROP TABLE CATEGORY CASCADE CONSTRAINTS; /* ī�װ� */
DROP TABLE MEMBER CASCADE CONSTRAINTS;   /* ��ȸ��*/
DROP TABLE REQUEST CASCADE CONSTRAINTS;  /* ������û�� */
DROP TABLE REQUESTIMG CASCADE CONSTRAINTS;  /* �����̹��� */
DROP TABLE QNA CASCADE CONSTRAINTS;  /* QNA�Խ��� */
DROP TABLE QNARE CASCADE CONSTRAINTS; /* QNA��� */
DROP TABLE SMEMBER CASCADE CONSTRAINTS;  /* ������ */
DROP TABLE MSPAYMENT CASCADE CONSTRAINTS; /* ����ʰ��� */
DROP TABLE PORTFOLIO CASCADE CONSTRAINTS;  /* ��Ʈ������ */
DROP TABLE POFOLIMG CASCADE CONSTRAINTS;  /* �����̹��� */
DROP TABLE REVIEW CASCADE CONSTRAINTS;  /* �ı� */
DROP TABLE PICK CASCADE CONSTRAINTS;  /* �� */
DROP TABLE LIKEY CASCADE CONSTRAINTS;  /* ���� */
DROP TABLE RQPAYMENT CASCADE CONSTRAINTS;  /* �������� */


/* ������ ���*/
drop sequence category_seq;
drop sequence request_seq;
drop sequence requestimg_seq;
drop sequence qna_seq;
drop sequence qnare_seq;
drop sequence mspayment_seq;
drop sequence portfolio_seq;
drop sequence pofolimg_seq;
drop sequence review_seq;
drop sequence pick_seq;
drop sequence likey_seq;
drop sequence rqpayment_seq;



/* ī�װ� ������*/
create sequence category_seq
start with 1
increment by 1;

/* ī�װ� */
CREATE TABLE CATEGORY (
	CGNO NUMBER(10) primary key, /* ī�װ���ȣ */
	CGNAME VARCHAR2(20) NOT NULL, /* ī�װ��̸� */
	CGORDER NUMBER(10) NOT NULL /* ī�װ����� */
);


/* �� */
CREATE TABLE MEMBER (
	MEMBERID VARCHAR2(50) primary key, /* ��ID */
	NAME VARCHAR2(20) NOT NULL, /* �̸� */
	PWD VARCHAR2(30) NOT NULL, /* ��й�ȣ */
	TEL VARCHAR2(20) NOT NULL, /* ��ȭ��ȣ */
	MILEAGE NUMBER(10) default 0, /* ���ϸ��� */
	TEMPPWD VARCHAR2(200), /* �ӽù�ȣ */
	REGDATE DATE DEFAULT sysdate, /* ������ */
	OUTDATE DATE /* Ż���� */
);

/* ������û�� ������*/
create sequence request_seq
start with 1
increment by 1;

/* ������û�� */
CREATE TABLE REQUEST (
	RQNO NUMBER(10) primary key, /* �����۹�ȣ */
	MEMBERID VARCHAR2(50) NOT NULL, /* ��ID */
	CGNO NUMBER(10) NOT NULL, /* ī�װ���ȣ */
	RQPRICE NUMBER(10) NOT NULL, /* �ݾ� */
	RQREGION VARCHAR2(50) NOT NULL, /* �Կ����� */
	RQDATE VARCHAR2(50) NOT NULL, /* �Կ���¥ */
	RQTYPE VARCHAR2(20), /* �Կ��뵵 */
	PICKCOUNT NUMBER(1) DEFAULT 0, /* ��ī��Ʈ */
	RQDETAIL VARCHAR2(4000), /* ���ο�û���� */
	REGDATE DATE DEFAULT SYSDATE, /* ����� */
	DELFLAG CHAR(1) DEFAULT 'N' /* �������� */
);

ALTER TABLE REQUEST
	ADD
		CONSTRAINT FK_MEMBER_TO_REQUEST
		FOREIGN KEY (
			MEMBERID
		)
		REFERENCES MEMBER (
			MEMBERID
		);

ALTER TABLE REQUEST
	ADD
		CONSTRAINT FK_CATEGORY_TO_REQUEST
		FOREIGN KEY (
			CGNO
		)
		REFERENCES CATEGORY (
			CGNO
		);

/* ������û���̹��� ������*/
create sequence requestimg_seq
start with 1
increment by 1;

/* �����̹��� */
CREATE TABLE REQUESTIMG (
	RQIMGNO NUMBER(10) primary key, /* �̹�����ȣ */
	RQNO NUMBER(10) NOT NULL, /* �����۹�ȣ */
	ORIGINALFILENAME VARCHAR2(200), /* �������ϸ� */
	FILENAME VARCHAR2(200) /* ���ϸ� */
);

ALTER TABLE REQUESTIMG
	ADD
		CONSTRAINT FK_REQUEST_TO_REQUESTIMG
		FOREIGN KEY (
			RQNO
		)
		REFERENCES REQUEST (
			RQNO
		);
		
/* Q&A ������*/
create sequence qna_seq
start with 1
increment by 1;

/* QNA�Խ��� */
CREATE TABLE QNA (
	QNO NUMBER(10) primary key, /* QNA�۹�ȣ */
	QTITLE VARCHAR2(100) NOT NULL, /* ���� */
	QCONTENT VARCHAR2(4000) NOT NULL, /* ���� */
	MEMBERID VARCHAR2(50) NOT NULL, /* ��ID */
	REGDATE DATE DEFAULT SYSDATE /* ����� */
);

ALTER TABLE QNA
	ADD
		CONSTRAINT FK_MEMBER_TO_QNA
		FOREIGN KEY (
			MEMBERID
		)
		REFERENCES MEMBER (
			MEMBERID
		);
		
/* QNA��� ������*/
create sequence qnare_seq
start with 1
increment by 1;

/* QNA��� */
CREATE TABLE QNARE (
	QRNO NUMBER(10) primary key, /* ��۹�ȣ */
	QNO NUMBER(10) NOT NULL, /* QNA�۹�ȣ */
	ID VARCHAR2(20) NOT NULL, /* ���̵� */
	CONTENT VARCHAR2(3000) NOT NULL, /* ��۳��� */
	REGDATE DATE default sysdate, /* ����� */
	PARENT NUMBER(10), /* �θ��ȣ */
	LEVELS NUMBER(1) DEFAULT 0 /* ���� */
);

ALTER TABLE QNARE
	ADD
		CONSTRAINT FK_QNA_TO_QNARE
		FOREIGN KEY (
			QNO
		)
		REFERENCES QNA (
			QNO
		);
		
/* ������ */
CREATE TABLE SMEMBER (
	SMEMBERID VARCHAR2(50) primary key, /* ������ID */
	SNAME VARCHAR2(20) NOT NULL, /* �̸� */
	SPWD VARCHAR2(30) NOT NULL, /* ��й�ȣ */
	STEL VARCHAR2(20) NOT NULL, /* ��ȭ��ȣ */
	PR VARCHAR2(1000) NOT NULL, /* �ڱ�Ұ� */
	ZIPCODE VARCHAR2(20) NOT NULL, /* �����ȣ */
	ADDRESS1 VARCHAR2(200) NOT NULL, /* �ּ� */
	ADDRESS2 VARCHAR2(200) NOT NULL, /* ���ּ� */
	IDENTIFICATION VARCHAR2(500), /* �ź��� */
	ACCOUNTCOPY VARCHAR2(500), /* ���»纻 */
	TEMPPWD VARCHAR2(200), /* �ӽù�ȣ */
	REGDATE DATE DEFAULT SYSDATE, /* ������ */
	OUTDATE DATE, /* Ż���� */
	MEMBERSHIP DATE DEFAULT SYSDATE, /* ����ʸ����� */
	AUTHORITY CHAR(1) DEFAULT 'N' /* ���� */
);

insert into smember (smemberid, sname, spwd, stel, pr, zipcode, address1, address2)
values('미정','미정','1','123123','초기화용입니다','123123','서울','어딘가');

/* ����� ������*/		
create sequence mspayment_seq
start with 1
increment by 1;

/* ����ʰ��� */
CREATE TABLE MSPAYMENT (
	PNO NUMBER(10) primary key, /* ������ȣ */
	SMEMBERID VARCHAR2(50), /* ������ID */
	PMETHOD VARCHAR2(20), /* ������� */
	PCONTENT VARCHAR2(200), /* �������� */
	PPRICE NUMBER(10), /* �����ݾ� */
	PERIOD NUMBER(10), /* �����Ⱓ*/
	REGDATE DATE DEFAULT sysdate /* ������ */
);

ALTER TABLE MSPAYMENT
	ADD
		CONSTRAINT FK_SMEMBER_TO_MSPAYMENT
		FOREIGN KEY (
			SMEMBERID
		)
		REFERENCES SMEMBER (
			SMEMBERID
		);

/* ��Ʈ������������*/		
create sequence portfolio_seq
start with 1
increment by 1;

/* ��Ʈ������ */
CREATE TABLE PORTFOLIO (
	PFNO NUMBER(10) primary key, /* �����۹�ȣ */
	SMEMBERID VARCHAR2(50) NOT NULL, /* ������ID */
	CGNO NUMBER(10) NOT NULL, /* ī�װ���ȣ */
	PFTITLE VARCHAR2(100) NOT NULL, /* ��Ʈ���������� */
	READCOUNT NUMBER(10) DEFAULT 0,  /*��ȸ�� */
	REGDATE DATE DEFAULT SYSDATE, /* ����� */
	DELFLAG CHAR(1) DEFAULT 'N' /* �������� */
);

ALTER TABLE PORTFOLIO
	ADD
		CONSTRAINT FK_SMEMBER_TO_PORTFOLIO
		FOREIGN KEY (
			SMEMBERID
		)
		REFERENCES SMEMBER (
			SMEMBERID
		);

ALTER TABLE PORTFOLIO
	ADD
		CONSTRAINT FK_CATEGORY_TO_PORTFOLIO
		FOREIGN KEY (
			CGNO
		)
		REFERENCES CATEGORY (
			CGNO
		);
		
/* ��Ʈ�������̹���������*/		
create sequence pofolimg_seq
start with 1
increment by 1;

/* �����̹��� */
CREATE TABLE POFOLIMG (
	PFIMGNO NUMBER(10) primary key, /* �̹�����ȣ */
	PFNO NUMBER(10) NOT NULL, /* �����۹�ȣ */
	ORIGINALFILENAME VARCHAR2(500), /* �������ϸ� */
	FILENAME VARCHAR2(500) /* ���ϸ� */
);

ALTER TABLE POFOLIMG
	ADD
		CONSTRAINT FK_PORTFOLIO_TO_POFOLIMG
		FOREIGN KEY (
			PFNO
		)
		REFERENCES PORTFOLIO (
			PFNO
		);
		

/* �� ������*/
create sequence pick_seq
start with 1
increment by 1;

/* �� */
CREATE TABLE PICK (
   PICKNO NUMBER(10) primary key, /* �ȹ�ȣ */
   RQNO NUMBER(10) NOT NULL, /* �����۹�ȣ */
   SMEMBERID VARCHAR2(50) NOT NULL, /* ������ID */
   SPRICE NUMBER(10) DEFAULT 0 NOT NULL, /* �������ݾ� */
   CHOICE CHAR(1) DEFAULT 'N', /* �������� */
   PLEVEL NUMBER(10) DEFAULT 0 /* ������ �ܰ� */
);

ALTER TABLE PICK
	ADD
		CONSTRAINT FK_REQUEST_TO_PICK
		FOREIGN KEY (
			RQNO
		)
		REFERENCES REQUEST (
			RQNO
		);

ALTER TABLE PICK
	ADD
		CONSTRAINT FK_SMEMBER_TO_PICK
		FOREIGN KEY (
			SMEMBERID
		)
		REFERENCES SMEMBER (
			SMEMBERID
		);
		

/* ���� ������*/
create sequence likey_seq
start with 1
increment by 1;

/* ���� */
CREATE TABLE LIKEY (
	LIKENO NUMBER(10) primary key, /* ���ɹ�ȣ */
	MEMBERID VARCHAR2(50), /* ��ID */
	PFNO NUMBER(10) /* �����۹�ȣ */
);

ALTER TABLE LIKEY
	ADD
		CONSTRAINT FK_PORTFOLIO_TO_LIKE
		FOREIGN KEY (
			PFNO
		)
		REFERENCES PORTFOLIO (
			PFNO
		);

ALTER TABLE LIKEY
	ADD
		CONSTRAINT FK_MEMBER_TO_LIKE
		FOREIGN KEY (
			MEMBERID
		)
		REFERENCES MEMBER (
			MEMBERID
		);


/* �������� ������*/
create sequence rqpayment_seq
start with 1
increment by 1;

/* �������� */
CREATE TABLE RQPAYMENT (
	PNO NUMBER(10) primary key, /* ������ȣ */
	MEMBERID VARCHAR2(50), /* ��ID */
	SMEMBERID VARCHAR2(50), /* ������ID */
	PMETHOD VARCHAR2(20), /* ������� */
	PPRICE NUMBER(10), /* �����ݾ� */
	MILEAGE NUMBER(10) DEFAULT 0, /* �������ϸ��� */
	USEMILE NUMBER(10) DEFAULT 0, /* ���ϸ������ݾ� */
	REGDATE DATE DEFAULT SYSDATE, /* ������ */
	PICKNO NUMBER(10), /* �ȹ�ȣ */
	FLAG CHAR(1) DEFAULT 'N' /* �ı⿩�� */
);

ALTER TABLE RQPAYMENT
	ADD
		CONSTRAINT FK_PICK_TO_RQPAYMENT
		FOREIGN KEY (
			PICKNO
		)
		REFERENCES PICK (
			PICKNO
		);

ALTER TABLE RQPAYMENT
	ADD
		CONSTRAINT FK_MEMBER_TO_RQPAYMENT
		FOREIGN KEY (
			MEMBERID
		)
		REFERENCES MEMBER (
			MEMBERID
		);
		
ALTER TABLE RQPAYMENT
	ADD
		CONSTRAINT FK_SMEMBER_TO_RQPAYMENT
		FOREIGN KEY (
			SMEMBERID
		)
		REFERENCES SMEMBER (
			SMEMBERID
		);


/* �ı������*/
create sequence review_seq
start with 1
increment by 1;

/* �ı� */
CREATE TABLE REVIEW (
	REVIEWNO NUMBER(10) NOT NULL, /* �ı�۹�ȣ */
	SMEMBERID VARCHAR2(50) NOT NULL, /* ������ID */
	CONTENT VARCHAR2(2000) NOT NULL, /* ���� */
	COMMUNICATION NUMBER(5,2) DEFAULT 0, /* Ŀ�´����̼� */
	RESULT NUMBER(5,2) DEFAULT 0, /* ��������� */
	MEMBERID VARCHAR2(50) NOT NULL, /* ��ID */
	NAME VARCHAR2(30) NOT NULL, /* ���̸� */
	PNO NUMBER(10) NOT NULL, /* ������ȣ */
	AVG NUMBER(10) NOT NULL, /* ���� */
	CGNAME VARCHAR2(50) NOT NULL, /* ī�װ��̸� */
	REGDATE DATE DEFAULT SYSDATE /* ����� */
);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_MEMBER_TO_REVIEW
		FOREIGN KEY (
			MEMBERID
		)
		REFERENCES MEMBER (
			MEMBERID
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_SMEMBER_TO_REVIEW
		FOREIGN KEY (
			SMEMBERID
		)
		REFERENCES SMEMBER (
			SMEMBERID
		);

ALTER TABLE REVIEW
	ADD
		CONSTRAINT FK_RQPAYMENT_TO_REVIEW
		FOREIGN KEY (
			PNO
		)
		REFERENCES RQPAYMENT (
			PNO
		);