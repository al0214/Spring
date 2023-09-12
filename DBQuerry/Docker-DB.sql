alter system set sec_case_sensitive_logon=false; -- 11g부터는 대소문자 구분을 하기 떄문에 해당 구문을 사용하여 기능 Off


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
    title varchar2(400) not null ,
    detail varchar2(1400) not null ,
    createDate date default SYSDATE,
    changeDate date default SYSDATE

);

update boardExam set title='테스트 6', detail='테스트 6' where bno='6';

insert into boardExam(bno, title, detail) values (tqq_seq.nextval, '테스트', '테스트 내용');

select count(*) from boardExam;

alter table boardExam add constraint pk_boardExam primary key (bno);

select * from boardExam;

insert into boardExam(bno, title, detail) (select tqq_seq.nextval, title, detail from boardExam);

commit ;