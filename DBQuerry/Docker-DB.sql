drop table users;
drop table authorities;

create table tbl_member(
    userid varchar2(50) not null primary key,
    userpw varchar2(100) not null,
    username varchar2(100) not null,
    regdate date default sysdate,
    updatedate date default sysdate,
    enabled char(1) default '1'
);



create table tbl_member_auth(
    userid varchar2(50) not null,
    auth varchar2(50) not null ,
    constraint fk_member_auth foreign key (userid) references tbl_member(userid)
);

SELECT * FROM TBL_MEMBER;

commit;
-- 11g부터는 대소문자 구분을 하기 떄문에 해당 구문을 사용하여 기능 Off
alter system set sec_case_sensitive_logon=false;
select FILE_SEQ.nextval from DUAL;
drop table boardExam;
drop table FileUpLoad;
drop sequence tqq_seq;
drop sequence file_seq;

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME
			= 'TQQ_SEQ';
-- 시퀀스 구성 1 부터 1씩 증가 최대 9999번까지 생성 가능 순환하지 않으며 순차적으로 순번 입력
CREATE SEQUENCE tqqSeq
       INCREMENT BY 1
       START WITH 0
       MINVALUE 0
       MAXVALUE 9999
       NOCYCLE
       ORDER
       NOCACHE ;

CREATE SEQUENCE fileSeq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 0
       MAXVALUE 9999
       NOCYCLE
       ORDER
       NOCACHE ;

-- bno 4자리수까지 표현 가능 소수점은 허용하지 않음
-- 제목은 한글 기준 30 글자까지 가능하며 빈값을 허용하지 않음
-- 내용은 한글 기준 400 글자까지 가능하며 빈값을 허용하지 않음
-- 생성, 수정 일자는 입력하지 않을시 컴퓨터 기준 시간이 자동 입력됩니다.
Create TABLE boardExam(
    bno number(10, 0) ,
    title varchar2(90) not null ,
    detail varchar2(1200) not null ,
    createDate date default SYSDATE,
    changeDate date default SYSDATE
);

select * from FileUpLoad;


SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'FILE_SEQ';
select FILE_SEQ.nextval from USER_SEQUENCES WHERE SEQUENCE_NAME = 'FILE_SEQ';;
select FILE_SEQ.currval from USER_SEQUENCES WHERE SEQUENCE_NAME = 'FILE_SEQ';

select TQQ_SEQ.nextval from DUAL;
select TQQ_SEQ.currval from DUAL;
SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'TQQ_SEQ';

delete from FileUpLoad where bno
select count(bno) from boardExam;

select FILEBNO from FileUpLoad;

select fileBno, bno, clientName, serverName, path, createDate, changeDate from FileUpLoad;

alter table boardExam add constraint boardExam_bno_uq unique (bno);
-- bno에 primary key 설정
alter table boardExam add constraint pk_boardExam primary key (bno);

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME
			= 'TQQ_SEQ';

CREATE TABLE FileUpLoad
(
    fileBno number(10, 0) primary key ,
    bno number(10, 0),
    clientName varchar2(90) not null,
    serverName varchar2(90) not null ,
    path varchar2(300) not null,
    createDate date default SYSDATE,
    changeDate date default SYSDATE,

    CONSTRAINT fk_code FOREIGN KEY(bno) REFERENCES boardExam(bno) ON DELETE CASCADE
);

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME
			= 'TQQ_SEQ';

-- 최대 파일 업로드 개수 3개
-- 년도 월 일 폴더 생성
-- bno | 일련번호 | 클라이언트 파일명 | 서버 파일명 | 서버 경로
select fileBno from FileUpLoad;




select * from FileUpLoad order by bno;
select * from boardExam;

insert into FileUpLoad(fileBno, bno, clientName, serverName, path)
		values
		(FILE_SEQ.nextval, 35,'a', 'a', 'a');

insert into FileUpLoad(fileBno, bno, clientName, serverName, path) values (1, 1,'4.pdf', '202310121112929.pdf',
'D:\UpLoadFile\main\2023\10\12\202310121112929.pdf');
-- 더미 데이터 입력
insert into boardExam(bno, title, detail) values (tqq_seq.nextval, '테스트', '더미 데이터');
insert into boardExam(bno, title, detail) (select tqq_seq.nextval, title, detail from boardExam);
select count(*) from boardExam;

delete from boardExam where bno > 1;

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME
			= 'TQQSEQ';

-- DB에 반영
commit ;

-- 수정 (changeDate만 날짜 변경 createDate는 수정하지 않음)
update boardExam set title='수정', detail='수정', changeDate=SYSDATE where bno=bno;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') FROM DUAL;

-- 삭제
delete from boardExam where bno = 1;

-- 시퀀스 초기화
SELECT tqq_seq.currval FROM DUAL;

ALTER SEQUENCE tqq_seq INCREMENT BY 1;

SELECT tqq_seq.NEXTVAL FROM DUAL;

ALTER SEQUENCE tqq_seq INCREMENT BY 1;
-----------------------------------------------

UPDATE user_sequences
SET last_number = 6
WHERE sequence_name = 'tqq_seq';


update USER_SEQUENCES set LAST_NUMBER = 6 where SEQUENCE_NAME = 'TQQ_SEQ';

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME = 'TQQ_SEQ';


select TO_CHAR(createDate, 'YY-MM-DD') from boardExam;

select * from boardExam;

select ROWNUM rmn, BNO, title, detail, TO_CHAR(createDate, 'YY-MM-DD'), TO_CHAR(changeDate,'YY-MM-DD') from boardExam;

update boardExam set changeDate='2023-09-16' where bno=3;

update boardExam set title='수정 테스트', detail='수정 테스트 글 내용', changeDate=SYSDATE where bno=3;

update boardExam set changeDate='2023-09-10' where bno=bno;

insert into boardExam(bno, title, detail, createDate)
    values (tqq_seq.nextval, '전날 테스트3', '전날 테스트 내용3', '2023-09-19');

delete from boardExam where bno=1;

select
            *
			from
			(
			select
			 	/*+INDEX_ASC(boardExam pk_board)*/ ROWNUM rn, BNO, title, detail, TO_CHAR(createDate, 'YY-MM-DD') AS createDate, TO_CHAR(changeDate, 'YY-MM-DD') AS changeDate
			 from
			 	boardExam where ROWNUM <= 1 * 10
			 	order by bno asc

			 )
			 where rn > 0;

delete from boardExam where bno=16;
delete boardExam where bno=17;



select * from boardExam;

insert into boardExam(bno, title, detail) values (tqq_seq.nextval, '테스트', '더미 데이터');


delete from boardExam where bno = 34;

select count(*) from boardExam;

alter sequence tqq_seq INCREMENT BY 1;

commit;

select path from FileUpLoad where bno = 38
