

-- 11g부터는 대소문자 구분을 하기 떄문에 해당 구문을 사용하여 기능 Off
alter system set sec_case_sensitive_logon=false;

-- 시퀀스 구성 1 부터 1씩 증가 최대 9999번까지 생성 가능 순환하지 않으며 순차적으로 순번 입력

-- 게시판 번호 시퀀스
CREATE SEQUENCE tqqSeq
       INCREMENT BY 1
       START WITH 0
       MINVALUE 0
       MAXVALUE 9999
       NOCYCLE
       ORDER
       NOCACHE ;

--
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

drop sequence fileSeq;
drop sequence tqqSeq;

-- bno에 primary key 설정
alter table boardExam add constraint pk_boardExam primary key (bno);

alter table boardExam add constraint boardExam_bno_uq unique (bno);

-- 총 게시물의 개수
select count(bno) from boardExam;

-- 파일 Table 생성
-- 최대 파일 업로드 개수 3개
-- 년도 월 일 폴더 생성
CREATE TABLE FileUpLoad
(
    fileBno number(10, 0) primary key , -- 파일의 고유 번호
    bno number(10, 0),                  -- 파일이 속해 있는 게시판 번호
    clientName varchar2(90) not null,   -- 파일 이름
    serverName varchar2(90) not null ,  -- 서버 이름
    path varchar2(300) not null,        -- 저장 위치
    createDate date default SYSDATE,    -- 생성 일시

    CONSTRAINT fk_code FOREIGN KEY(bno) REFERENCES boardExam(bno) ON DELETE CASCADE
);

drop table TABLE_USER;
drop table USER_AUTH;

CREATE TABLE TABLE_USER(
    userId varchar2(50) primary key,
    userPw varchar2(50) not null,
    userName varchar2(50) not null,
    enable char(1) default '1',
    regDate date default sysdate,
    updateDate date default sysdate
);

CREATE TABLE USER_AUTH(
    userId varchar2(50) not null ,
    auth varchar2(50) not null,
    constraint FK_USER_AUTH foreign key (userId)references TABLE_USER(userId)
);

SELECT mem.userId, userPw,
		userName, enable, regdate, updatedate, auth FROM TABLE_USER mem
		LEFT OUTER JOIN USER_AUTH auth on mem.userId = auth.userId where mem.userId = 'admin90';

select * from USER_AUTH;
select * from TABLE_USER;

select * from boardExam;
select * from FileUpLoad;

insert into boardExam(bno, title, detail)(select TQQSEQ.nextval, title, detail from boardExam);

insert into boardExam(bno, title, detail) (select TQQSEQ.nextval, title, detail from boardExam);

SELECT LAST_NUMBER FROM USER_SEQUENCES WHERE SEQUENCE_NAME
			= 'tqqseq';
-- 삭제
delete from boardExam where bno = 1;

-- DB에 반영
commit ;

