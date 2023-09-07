create user al0214 identified by board_1234;
grant connect, resource, dba to al0214;
commit;

select * from all_users;


alter system set sec_case_sensitive_logon=false;

Create table board(
  bno number(10,0) ,
  title varchar(40) ,
  detail varchar2(400),
  create_date date default SYSDATE,
  change_date date default SYSDATE
);


delete from board where bno > 1;

drop table board;
drop sequence tmp_seq;

CREATE SEQUENCE tmp_seq START WITH 1 INCREMENT BY 1 MAXVALUE 100000 CYCLE NOCACHE;

select * from board order by bno asc;

select count(*) from board;

COMMIT ;

alter table board add constraint pk_boardn primary key (bno);

insert into board(bno, title, detail) VALUES (tmp_seq.nextval, '테스트', '테스트 글 입니다');

insert into board(bno, title, detail) (select tmp_seq.nextval, title, detail from board);

 INSERT INTO BOARD(bno, title, detail) VALUES ('1', 'title' , 'detail');

select * from board;

delete from board where bno=73;

drop table boardExam;

drop sequence tqq_seq;

CREATE SEQUENCE tqq_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       NOCACHE
       NOORDER;

Create TABLE boardExam(
    bno number(10,0) ,
    title varchar2(40) not null ,
    detail varchar2(400) not null ,
    createDate date default SYSDATE,
    changeDate date default SYSDATE

);

select ROWNUM/*+ INDEX_ASC(boardExam pk_board)*/ rn, bno, title, detail from boardExam order by bno asc ;

insert into boardExam(bno, title, detail) VALUES (tqq_seq.nextval, '테스트', '테스트 글 입니다');

insert into boardExam(bno, title, detail) (select tqq_seq.nextval, title, detail from boardExam);

select tqq_seq.nextval from dual;

delete from boardExam where bno >= 1;

select * from boardExam where bno = 1;

select * from BoardExam;

delete from boardExam where bno >= 1;

select count(*) from boardExam;

COMMIT ;

select /*+ INDEX_ASC(BoardExam) */* from boardExam;

select * from BOARDEXAM;

select * from boardExam order by bno + 1 desc ;

select * from boardExam order by bno desc;

select /*+ INDEX_DESC(boardExam pk_board */ * from boardExam where bno > 0;

alter table boardExam add constraint pk_board primary key (bno);

select * from boardExam order by bno desc;

select /*+ INDEX_DESC(boardExam pk_board) */* from boardExam;

select /*+ INDEX_ASC(boardExam pk_board) */* from boardExam;

select /*+ FULL(boardExam)*/* from boardExam order by bno desc ;

select ROWNUM rn, bno, title, detail from boardExam;


select /*+ INDEX_DESC(boardExam)*/ ROWNUM rn, bno, title from boardExam;

select /*+ INDEX_DESC(boardExam)*/ ROWNUM rn, bno, title from boardExam where ROWNUM <= 10;

select /*+ INDEX_DESC(boardExam)*/ ROWNUM rn, bno, title from boardExam where ROWNUM <= 20;

select /*+ INDEX_DESC(boardExam)*/ bno, title, detail from
    (select /*+ INDEX_DESC(boardExam)*/ ROWNUM rn, bno, title, detail from boardExam where ROWNUM <= 20)
        where rn > 10;

delete from boardExam where bno > 500;

select * from boardExam order by bno asc;

select bno, title, detail from (select /*+INDEX_DESC(boardExam pk_board)*/ ROWNUM rn, BNO, title, detail from boardExam where ROWNUM <= 20) where rn > 10;

select bno, title, detail, createDate, changeDate from ( select /*+INDEX_DESC(boardExam pk_board)*/ ROWNUM rn, BNO, title, detail, createDate, changeDate from boardExam where ROWNUM <= 20 ) where rn > 10;

select *
from boardExam;

select count(*) from boardExam;

select bno,
       title,
       detail,
       createDate,
       changeDate
from (select
          /*+INDEX_DESC(boardExam pk_board)*/ ROWNUM rn,
                                              BNO,
                                              title,
                                              detail,
                                              createDate,
                                              changeDate
      from boardExam
      where ROWNUM <= 5 * 20)
where rn > (5 - 1) * 20;

select tqq_seq.nextval from dual;
select *
from BOARDEXAM;
insert into boardExam(bno, title, detail) values (tqq_seq.nextval,'테스트 제목', '테스트');

select
				bno, title, detail, createDate, changeDate
			from
			(
			select
			 	/*+INDEX_ASC(boardExam pk_board)*/ ROWNUM rn, BNO, title, detail, createDate, changeDate
			 from
			 	boardExam where ROWNUM <= 1 * 5
			 )
			 where rn > (1 -1) * 5;

select
			 	/*+INDEX_ASC(boardExam pk_board)*/ ROWNUM rn, BNO, title, detail, createDate, changeDate
			 from
			 	boardExam where ROWNUM <= 1 * 5;

select * from boardExam order by bno asc;