
drop table board;

create table board (
    seq number(5) not null primary key,
    title varchar2(200) null,
    writer varchar2(20) null,
    content varchar2(2000) null,
    regdate date default sysdate null,
    cnt number(5) default 0 null
);

insert into board
values (1, 'MVC M2 �Խ��� ����', 'admin', 'MVC M2 �Խ��� ����', default, 0);

insert into board
values (2, 'MVC M2 �Խ��� ����2', 'user', 'MVC M2 �Խ��� ����2', default, 0);

select * from board
order by seq desc;


commit;

-- sql���� commit�� ���� �ʴ� ���: ������ ��� ���¿� ������. (LOCK)
insert into board (seq, title, writer, content)
values(4, '������ 4', 'admin', '�۳��� 4');

create table users (
    id varchar2(8) not null primary key,
    password varchar2(8) null,
    name varchar2(20) null,
    role varchar2(5)
);

-- ���� ������ �Է�
insert into users
values ('admin', '1234', '������', 'Admin');

insert into users
values ('user', '1234', '�Ϲݻ����', 'Users');

select * from users;

select nvl(max(seq),0) + 1 from board;


select nvl(max(seq),0) + 1 from board