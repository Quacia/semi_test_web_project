create table users(
    id varchar2(40) primary key,
    password varchar2(40) not null,
    name varchar2(50) not null,
    job char(10) check(job in('developer', 'student', 'amateur'))
);

create table visit(
    id number primary key,
    u_id varchar2(40) references users(id) on delete set null,
    content clob,
    regdate timestamp
);

create table photo(
    id number primary key,
    u_id varchar2(40) references users(id) on delete set null,
    content varchar2(210) not null,
    url varchar2(150) not null,
    regdate date
);

select * from users;

alter table users modify password varchar2(70);
desc users;

create sequence seq_photo_id;

select * from photo;
select * from visit;

create sequence seq_visit_id;