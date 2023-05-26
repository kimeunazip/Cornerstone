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

COMMENT ON TABLE members is 'ȸ�����̺�';
comment on column members.num is 'ȸ����ȣ';
comment on column members.id is 'ȸ�����̵�';
comment on column members.pw is 'ȸ����й�ȣ';
comment on column members.name is 'ȸ���̸�';
comment on column members.email is 'ȸ���̸���';
comment on column members.phone is 'ȸ����ȭ��ȣ';
comment on column members.address is 'ȸ���ּ�';
comment on column members.regdate is 'ȸ���������';
comment on column members.status is 'ȸ����������';

select * from members;

insert into members(num,id,pw,name,email,phone,address,status)
values (members_seq.nextval,'admin1','admin1','������1','admin1@gmail.com','01011111111','A�μ�',2);

insert into members(num,id,pw,name,email,phone,address,status)
values (members_seq.nextval,'admin2','admin2','������2','admin2@gmail.com','01022222222','B�μ�',2);

insert into members(num,id,pw,name,email,phone,address)
values (members_seq.nextval,'abc1234','AAAaaa1111','�輭��','kim@gmail.com','01012341234','����� ������');

insert into members(num,id,pw,name,email,phone,address)
values (members_seq.nextval,'abc5678','BBBbbb222','�ſ���','Shin@gmail.com','01045674567','����� ��걸');

insert into members(num,id,pw,name,email,phone,address)
values (members_seq.nextval,'abc1111','CCCccc333','���ÿ�','kang@gmail.com','01098745612','����� ���ı�');

insert into members(num,id,pw,name,email,phone,address)
values (members_seq.nextval,'abc2222','DDDddd444','�ֳ���','choi@gmail.com','01075312645','����� ��������');

select num,id,pw,name,phone,email,address,regdate,status from members
order by num asc;