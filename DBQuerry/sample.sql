Create TABLE boardExam(
    bno number(10,0) ,
    title varchar(40) not null ,
    detail varchar2(400) not null ,
    createDate date default SYSDATE,
    changeDate date default SYSDATE

);

select * from boardExam;

COMMIT;