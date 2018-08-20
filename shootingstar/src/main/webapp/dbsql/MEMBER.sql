/* 테이블 드랍*/
DROP TABLE CATEGORY CASCADE CONSTRAINTS; /* 카테고리 */
DROP TABLE MEMBER CASCADE CONSTRAINTS;   /* 고객회원*/
DROP TABLE REQUEST CASCADE CONSTRAINTS;  /* 견적요청서 */
DROP TABLE REQUESTIMG CASCADE CONSTRAINTS;  /* 견적이미지 */
DROP TABLE QNA CASCADE CONSTRAINTS;  /* QNA게시판 */
DROP TABLE QNARE CASCADE CONSTRAINTS; /* QNA댓글 */
DROP TABLE SMEMBER CASCADE CONSTRAINTS;  /* 전문가 */
DROP TABLE MSPAYMENT CASCADE CONSTRAINTS; /* 멤버십결제 */
DROP TABLE PORTFOLIO CASCADE CONSTRAINTS;  /* 포트폴리오 */
DROP TABLE POFOLIMG CASCADE CONSTRAINTS;  /* 포폴이미지 */
DROP TABLE REVIEW CASCADE CONSTRAINTS;  /* 후기 */
DROP TABLE PICK CASCADE CONSTRAINTS;  /* 픽 */
DROP TABLE LIKEY CASCADE CONSTRAINTS;  /* 관심 */
DROP TABLE RQPAYMENT CASCADE CONSTRAINTS;  /* 견적결제 */


/* 시퀀스 드랍*/
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



/* 카테고리 시퀀스*/
create sequence category_seq
start with 1
increment by 1;

/* 카테고리 */
CREATE TABLE CATEGORY (
	CGNO NUMBER(10) primary key, /* 카테고리번호 */
	CGNAME VARCHAR2(20) NOT NULL, /* 카테고리이름 */
	CGORDER NUMBER(10) NOT NULL /* 카테고리정렬 */
);


/* 고객 */
CREATE TABLE MEMBER (
	MEMBERID VARCHAR2(50) primary key, /* 고객ID */
	NAME VARCHAR2(20) NOT NULL, /* 이름 */
	PWD VARCHAR2(30) NOT NULL, /* 비밀번호 */
	TEL VARCHAR2(20) NOT NULL, /* 전화번호 */
	MILEAGE NUMBER(10) default 0, /* 마일리지 */
	TEMPPWD VARCHAR2(200), /* 임시번호 */
	REGDATE DATE DEFAULT sysdate, /* 가입일 */
	OUTDATE DATE /* 탈퇴일 */
);

/* 견적요청서 시퀀스*/
create sequence request_seq
start with 1
increment by 1;

/* 견적요청서 */
CREATE TABLE REQUEST (
	RQNO NUMBER(10) primary key, /* 견적글번호 */
	MEMBERID VARCHAR2(50) NOT NULL, /* 고객ID */
	CGNO NUMBER(10) NOT NULL, /* 카테고리번호 */
	RQPRICE NUMBER(10) NOT NULL, /* 금액 */
	RQREGION VARCHAR2(50) NOT NULL, /* 촬영지역 */
	RQDATE VARCHAR2(50) NOT NULL, /* 촬영날짜 */
	RQTYPE VARCHAR2(20), /* 촬영용도 */
	PICKCOUNT NUMBER(1) DEFAULT 0, /* 픽카운트 */
	RQDETAIL VARCHAR2(4000), /* 세부요청사항 */
	REGDATE DATE DEFAULT SYSDATE, /* 등록일 */
	DELFLAG CHAR(1) DEFAULT 'N' /* 삭제여부 */
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

/* 견적요청서이미지 시퀀스*/
create sequence requestimg_seq
start with 1
increment by 1;

/* 견적이미지 */
CREATE TABLE REQUESTIMG (
	RQIMGNO NUMBER(10) primary key, /* 이미지번호 */
	RQNO NUMBER(10) NOT NULL, /* 견적글번호 */
	ORIGINALFILENAME VARCHAR2(200), /* 원본파일명 */
	FILENAME VARCHAR2(200) /* 파일명 */
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
		
/* Q&A 시퀀스*/
create sequence qna_seq
start with 1
increment by 1;

/* QNA게시판 */
CREATE TABLE QNA (
	QNO NUMBER(10) primary key, /* QNA글번호 */
	QTITLE VARCHAR2(100) NOT NULL, /* 제목 */
	QCONTENT VARCHAR2(4000) NOT NULL, /* 내용 */
	MEMBERID VARCHAR2(50) NOT NULL, /* 고객ID */
	REGDATE DATE DEFAULT SYSDATE /* 등록일 */
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
		
/* QNA댓글 시퀀스*/
create sequence qnare_seq
start with 1
increment by 1;

/* QNA댓글 */
CREATE TABLE QNARE (
	QRNO NUMBER(10) primary key, /* 댓글번호 */
	QNO NUMBER(10) NOT NULL, /* QNA글번호 */
	ID VARCHAR2(20) NOT NULL, /* 아이디 */
	CONTENT VARCHAR2(3000) NOT NULL, /* 댓글내용 */
	REGDATE DATE default sysdate, /* 등록일 */
	PARENT NUMBER(10), /* 부모번호 */
	LEVELS NUMBER(1) DEFAULT 0 /* 계층 */
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
		
/* 전문가 */
CREATE TABLE SMEMBER (
	SMEMBERID VARCHAR2(50) primary key, /* 전문가ID */
	SNAME VARCHAR2(20) NOT NULL, /* 이름 */
	SPWD VARCHAR2(30) NOT NULL, /* 비밀번호 */
	STEL VARCHAR2(20) NOT NULL, /* 전화번호 */
	PR VARCHAR2(1000) NOT NULL, /* 자기소개 */
	ZIPCODE VARCHAR2(20) NOT NULL, /* 우편번호 */
	ADDRESS1 VARCHAR2(200) NOT NULL, /* 주소 */
	ADDRESS2 VARCHAR2(200) NOT NULL, /* 상세주소 */
	IDENTIFICATION VARCHAR2(500), /* 신분증 */
	ACCOUNTCOPY VARCHAR2(500), /* 계좌사본 */
	TEMPPWD VARCHAR2(200), /* 임시번호 */
	REGDATE DATE DEFAULT SYSDATE, /* 가입일 */
	OUTDATE DATE, /* 탈퇴일 */
	MEMBERSHIP DATE DEFAULT SYSDATE, /* 멤버십만료일 */
	AUTHORITY CHAR(1) DEFAULT 'N' /* 권한 */
);

/* 미정초기화 */
insert into smember (smemberid, sname, spwd, stel, pr, zipcode, address1, address2)
values('미정','미정','1','123123','초기화용입니다','123123','서울','어딘가');

/* 멤버십 시퀀스*/		
create sequence mspayment_seq
start with 1
increment by 1;

/* 멤버십결제 */
CREATE TABLE MSPAYMENT (
	PNO NUMBER(10) primary key, /* 결제번호 */
	SMEMBERID VARCHAR2(50), /* 전문가ID */
	PMETHOD VARCHAR2(20), /* 결제방법 */
	PCONTENT VARCHAR2(200), /* 결제내용 */
	PPRICE NUMBER(10), /* 결제금액 */
	PERIOD NUMBER(10), /* 결제기간*/
	REGDATE DATE DEFAULT sysdate /* 결제일 */
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

/* 포트폴리오시퀀스*/		
create sequence portfolio_seq
start with 1
increment by 1;

/* 포트폴리오 */
CREATE TABLE PORTFOLIO (
	PFNO NUMBER(10) primary key, /* 포폴글번호 */
	SMEMBERID VARCHAR2(50) NOT NULL, /* 전문가ID */
	CGNO NUMBER(10) NOT NULL, /* 카테고리번호 */
	PFTITLE VARCHAR2(100) NOT NULL, /* 포트폴리오제목 */
	READCOUNT NUMBER(10) DEFAULT 0,  /*조회수 */
	REGDATE DATE DEFAULT SYSDATE, /* 등록일 */
	DELFLAG CHAR(1) DEFAULT 'N' /* 공개여부 */
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
		
/* 포트폴리오이미지시퀀스*/		
create sequence pofolimg_seq
start with 1
increment by 1;

/* 포폴이미지 */
CREATE TABLE POFOLIMG (
	PFIMGNO NUMBER(10) primary key, /* 이미지번호 */
	PFNO NUMBER(10) NOT NULL, /* 포폴글번호 */
	ORIGINALFILENAME VARCHAR2(500), /* 원본파일명 */
	FILENAME VARCHAR2(500) /* 파일명 */
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
		

/* 후기시퀀스*/
create sequence review_seq
start with 1
increment by 1;

/* 후기 */
CREATE TABLE REVIEW (
	REVIEWNO NUMBER(10) NOT NULL, /* 후기글번호 */
	SMEMBERID VARCHAR2(50) NOT NULL, /* 전문가ID */
	CONTENT VARCHAR2(2000) NOT NULL, /* 내용 */
	COMMUNICATION NUMBER(5,2) DEFAULT 0, /* 커뮤니케이션 */
	RESULT NUMBER(5,2) DEFAULT 0, /* 결과만족도 */
	MEMBERID VARCHAR2(50) NOT NULL, /* 고객ID */
	NAME VARCHAR2(30) NOT NULL, /* 고객이름 */
	PNO NUMBER(10) NOT NULL, /* 결제번호 */
	AVG NUMBER(10) NOT NULL, /* 평점 */
	CGNAME VARCHAR2(50) NOT NULL, /* 카테고리이름 */
	REGDATE DATE DEFAULT SYSDATE /* 등록일 */
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
		
/* 픽 시퀀스*/
create sequence pick_seq
start with 1
increment by 1;

/* 픽 */
CREATE TABLE PICK (
   PICKNO NUMBER(10) primary key, /* 픽번호 */
   RQNO NUMBER(10) NOT NULL, /* 견적글번호 */
   SMEMBERID VARCHAR2(50) NOT NULL, /* 전문가ID */
   SPRICE NUMBER(10) DEFAULT 0 NOT NULL, /* 전문가금액 */
   CHOICE CHAR(1) DEFAULT 'N', /* 낙찰여부 */
   PLEVEL NUMBER(10) DEFAULT 0 /* 페이지 단계 */
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
		
/* 관심 시퀀스*/
create sequence likey_seq
start with 1
increment by 1;

/* 관심 */
CREATE TABLE LIKEY (
	LIKENO NUMBER(10) primary key, /* 관심번호 */
	MEMBERID VARCHAR2(50), /* 고객ID */
	PFNO NUMBER(10) /* 포폴글번호 */
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
		
/* 견적결제 시퀀스*/
create sequence rqpayment_seq
start with 1
increment by 1;

/* 견적결제 */
CREATE TABLE RQPAYMENT (
	PNO NUMBER(10) NOT NULL, /* 결제번호 */
	MEMBERID VARCHAR2(50), /* 고객ID */
	SMEMBERID VARCHAR2(50) NOT NULL, /* 전문가ID */
	PMETHOD VARCHAR2(20), /* 결제방법 */
	PPRICE NUMBER(10), /* 결제금액 */
	MILEAGE NUMBER(10) DEFAULT 0, /* 남은마일리지 */
	USEMILE NUMBER(10) DEFAULT 0, /* 마일리지사용금액 */
	REGDATE DATE DEFAULT SYSDATE, /* 결제일 */
	PICKNO NUMBER(10), /* 픽번호 */
	FLAG CHAR(1) DEFAULT 'N' /* 후기여부 */
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