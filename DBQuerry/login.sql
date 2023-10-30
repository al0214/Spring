create table users(
    username varchar2(50) not null primary key,
    password varchar2(50) not null,
    enabled char(1) default '1'
);

create table authorities(
    username varchar2(50) not null,
    authority varchar2(50) not null,
    constraint fk_authorities_users foreign key (username) references users(username) on delete cascade
);

create unique index ix_auth_username on authorities(username, authority);

insert into users(username, password) VALUES ('user00', 'pw00');
insert into users(username, password) VALUES ('member00', 'pw00');
insert into users(username, password) VALUES ('admin00', 'pw00');

insert into authorities(username, authority) VALUES ('user00', 'ROLE_USER');
insert into authorities(username, authority) VALUES ('member00', 'ROLE_MANAGER');
insert into authorities(username, authority) VALUES ('admin00', 'ROLE_MANAGER');
insert into authorities(username, authority) VALUES ('admin00', 'ADMIN_MANAGER');

commit;

create table tbl_member(
    userid varchar2(50) not null primary key ,
    userpw varchar2(100) not null ,
    username varchar2(100) not null ,
    regdate date default sysdate,
    updatedate date default sysdate,
    enabled char(1) default '1'
);

create table tbl_member_auth (
    userid varchar2(50) not null ,
    auth varchar2(50) not null,
    constraint fk_member_auth foreign key (userid) references tbl_member(userid)
);

select * from tbl_member;
select * from tbl_member_auth;

select
userid username, userpw password, enabled
from
tbl_member
where userid ='admin90';

select
userid username, auth authority
from
tbl_member_auth
where userid ='admin90';

SELECT mem.userid, userpw, username,
		enabled, regdate, updatedate, auth
		FROM tbl_member mem LEFT OUTER JOIN
		tbl_member_auth auth on mem.userid = auth.userid WHERE mem.userid = 'admin95';

CREATE TABLE persistent_logins (
    username varchar(64) not null,
    series varchar(64) primary key ,
    token varchar(64) not null,
    last_used timestamp not null
);

select * from persistent_logins;

select * from tbl_member;

select * from tbl_member_auth;