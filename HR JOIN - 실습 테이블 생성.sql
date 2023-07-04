/* JOIN 실습 */

drop table member10 cascade constraints;
drop table zipcode10 cascade constraints;
drop table product10 cascade constraints;
drop table orders10 cascade constraints;

create table zipcode10 (
    zipcode number(6) not null constraint PK_ZIPCODE_ZIPCODE Primary key, 
    si_do varchar2(200) not null, 
    gu_gun varchar2 (200) not null, 
    bungi varchar2 (200) not null
    ); 

create table member10 (
    m_id number(4) not null constraint PK_MEMBER10_M_ID Primary key, 
    pass varchar2(200) not null , 
    name  varchar2(200) not null, 
    email varchar2(200) not null, 
    zipcode number(6) null , 
    constraint FK_MEMBER10_ZIPCODE10 foreign key (zipcode) references zipcode10(zipcode)
    );

create table product10 ( 
    pro_id number (6) not null constraint PK_PRODUCT10_PRO_ID primary key, 
    pro_name varchar2(200) not null, 
    pro_price number (7,2) not null , 
    pro_cnt number (4) default 0 not null
); 

create table orders10 (
    ord_id number (6) not null constraint PK_ORDER10_ORD_ID Primary key, 
    m_id number(4) not null ,
    pro_id number(6) not null ,
    orderdate date,
        constraint FK_ORDER10_M_ID foreign key (m_id) references member10(m_id), 
        constraint FK_ORDER10_PRO_ID foreign key (pro_id) references product10(pro_id)
);

-- 각각의 테이블에 레코드 5개씩 저장 후 JOIN 실습: EQUIE JOIN, ANSI JOIN
insert into zipcode10
values (100000, '서울시 종로구', '종로3가', '1번지');
insert into zipcode10
values (100001, '서울시 중구', '무교동', '2번지');
insert into zipcode10
values (100002, '서울시 용산구', '후암동', '3번지');
insert into zipcode10
values (100003, '서울시 성동구', '상왕십리동', '4번지');
insert into zipcode10
values (100004, '서울시 광진구', '중곡동', '5번지');

insert into member10
values (1111, '12234a', '김정우', 'wjddn98@aaa.aaa', 100000);
insert into member10
values (2222, '1gddq52', '홍길동', 'redway@aaa.aaa', 100001);
insert into member10
values (3333, 'sga234', '이순신', 'soongod@aaa.aaa', 100002);
insert into member10
values (4444, 'bcxzh4', '장보라', 'gotomarket@aaa.aaa', 100003);
insert into member10
values (5555, 'ikhy0956', '최하늘', 'skychoi@aaa.aaa', 100004);

insert into product10
values (131313, '광천김', 30000, 500);
insert into product10
values (131314, '참기름', 4500, 400);
insert into product10
values (131315, '소금', 5000, 300);
insert into product10
values (131316, '계란', 2000, 100);
insert into product10
values (131317, '우유', 3800, 200);

insert into orders10
values (172631, 1111, 131313, '23/07/03');
insert into orders10
values (172632, 2222, 131314, '23/07/02');
insert into orders10
values (172633, 3333, 131315, '23/07/01');
insert into orders10
values (172634, 4444, 131316, '23/07/03');
insert into orders10
values (172635, 5555, 131317, '23/07/01');

-- 구매 정보에 대해서 회원이름, 메일주소, 시/도, 제품이름, 제품가격, 제품수량(cnt), 구매날짜를 출력
-- insert 한 쿼리, EQUIE JOIN, ANSI JOIN   <== 

-- EQUIE JOIN
select name, email, si_do, pro_name, pro_price, pro_cnt
from zipcode10 z, member10 m, product10 p, orders10 o
where z.zipcode = m.zipcode
    and m.m_id = o.m_id
    and p.pro_id = o.pro_id
order by z.zipcode asc;

-- ANSI JOIN
select name, email, si_do, pro_name, pro_price, pro_cnt
from zipcode10 z JOIN member10 m
        on z.zipcode = m.zipcode
    JOIN orders10 o
        on m.m_id = o.m_id
    JOIN product10 p
        on p.pro_id = o.pro_id
order by z.zipcode asc;



select * from member10; 
select * from zipcode10; 
select * from product10;
select * from orders10; 
