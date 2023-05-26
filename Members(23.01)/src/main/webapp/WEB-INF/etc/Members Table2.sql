--Members 
create table members(
    num number not null,
    id varchar2(20) not null,
    pw varchar2(30) not null,
    name varchar2(30) not null,
    phone varchar2(12) not null,
    email varchar2(20),
    address varchar2(50),
    regDate Date default sysdate not null,
    status number default 0 not null,
  
    constraint members_pk primary key(num)
    );
    
create sequence members_seq start with 1
increment by 1
minvalue 1
nocycle
cache 2;

COMMENT ON TABLE members is '회원테이블';
comment on column members.num is '회원번호';
comment on column members.id is '회원아이디';
comment on column members.pw is '회원비밀번호';
comment on column members.name is '회원이름';
comment on column members.email is '회원이메일';
comment on column members.phone is '회원전화번호';
comment on column members.address is '회원주소';
comment on column members.regdate is '회원등록일자';
comment on column members.status is '회원계정상태';

select * from members;

insert into members(num,id,pw,name,email,phone,address,status)
values (members_seq.nextval,'admin1','admin1','관리자1','admin1@gmail.com','01011111111','A부서',2);

insert into members(num,id,pw,name,email,phone,address,status)
values (members_seq.nextval,'admin2','admin2','관리자2','admin2@gmail.com','01022222222','B부서',2);

insert into members(num,id,pw,name,email,phone,address)
values (members_seq.nextval,'abc1234','AAAaaa1111','김서연','kim@gmail.com','01012341234','서울시 마포구');

insert into members(num,id,pw,name,email,phone,address)
values (members_seq.nextval,'abc5678','BBBbbb222','신예준','Shin@gmail.com','01045674567','서울시 용산구');

insert into members(num,id,pw,name,email,phone,address)
values (members_seq.nextval,'abc1111','CCCccc333','강시온','kang@gmail.com','01098745612','서울시 송파구');

insert into members(num,id,pw,name,email,phone,address)
values (members_seq.nextval,'abc2222','DDDddd444','최나윤','choi@gmail.com','01075312645','서울시 영등포구');

select num,id,pw,name,phone,email,address,regdate,status from members
order by num asc;