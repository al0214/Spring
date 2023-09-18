-- 11g부터는 대소문자 구분을 하기 떄문에 해당 구문을 사용하여 기능 Off
alter system set sec_case_sensitive_logon=false;

drop table boardExam;
drop sequence tqq_seq;

-- 시퀀스 구성 1 부터 1씩 증가 최대 9999번까지 생성 가능 순환하지 않으며 순차적으로 순번 입력
CREATE SEQUENCE tqq_seq
       INCREMENT BY 1
       START WITH 1
       MINVALUE 1
       MAXVALUE 9999
       NOCYCLE
       ORDER;

-- bno 4자리수까지 표현 가능 소수점은 허용하지 않음
-- 제목은 한글 기준 30 글자까지 가능하며 빈값을 허용하지 않음
-- 내용은 한글 기준 400 글자까지 가능하며 빈값을 허용하지 않음
-- 생성, 수정 일자는 입력하지 않을시 컴퓨터 기준 시간이 자동 입력됩니다.
Create TABLE boardExam(
    bno number(4,0) ,
    title varchar2(90) not null ,
    detail varchar2(1200) not null ,
    createDate date default SYSDATE,
    changeDate date default SYSDATE

);
-- bno에 primary key 설정
alter table boardExam add constraint pk_boardExam primary key (bno);

-- 더미 데이터 입력
insert into boardExam(bno, title, detail) values (tqq_seq.nextval, '테스트', '더미 데이터');
insert into boardExam(bno, title, detail) (select tqq_seq.nextval, title, detail from boardExam);
select count(*) from boardExam;

delete from boardExam where bno > 1;

-- DB에 반영
commit ;

update boardExam set title='수정', detail='수정', changeDate=SYSDATE where bno=bno;

select * from boardExam;

delete from boardExam where bno = 1;

update boardExam set title='수정 테스트', detail='수정 테스트 글', changeDate=SYSDATE where bno=2;

update boardExam set title='수정', detail='수정', changeDate=SYSDATE where bno=1;