/* Shopping_DB */
create table member (
    id varchar2(20) constraint  PK_member_id_tb_zipcode not null Primary key,
    pawd varchar2(20),
    name varchar2(50),
    zipcode varchar2(7),
        constraint FK_member_tb_zipcode foreign key(zipcode) references tb_zipcode(zipcode),
    address varchar(20),
    tel varchar2(13),
    indate date default sysdate
);

insert into member
values ('hihi01', '1234', '김정우', 10000, '경기', '010-1111-1111', default);
insert into member
values ('hihi02', '1234', '홍정우', 10001, '경기', '010-1111-5555', default);
insert into member
values ('hihi03', '1234', '박정우', 10002, '경기', '010-1111-5555', default);
insert into member
values ('hihi04', '1234', '이정우', 10003, '경기', '010-1111-5555', default);
insert into member
values ('hihi05', '1234', '최정우', 10004, '경기', '010-1111-5555', default);


select * from member;


create table tb_zipcode (
    zipcode varchar2(7) constraint PK_tb_zipcode_zipcode not null Primary key,
    sido varchar2(30),
    gugum varchar2(30),
    dong varchar2(30),
    bungi varchar2(30)
);

insert into tb_zipcode
values (10000, '경기', '고양', '원흥', '1번지');
insert into tb_zipcode
values (10001, '서울', '강남', '논현', '1번지');
insert into tb_zipcode
values (10002, '서울', '종로', '효자', '2번지');
insert into tb_zipcode
values (10003, '서울', '용산', '후암동', '3번지');
insert into tb_zipcode
values (10004, '경기', '성남', '분당', '4번지');


select * from tb_zipcode;

create table products (
    product_code varchar2(20) constraint PK_products_product_code not null Primary key,
    product_name varchar2(100),
    product_kind char(1),
    product_price1 varchar2(10),
    product_price2 varchar2(10),
    product_content varchar2(1000),
    product_image varchar2(50),
    sizeSt varchar2(5),
    sizeEt varchar2(5),
    product_product_quantity varchar2(5),
    useyn char(1),
    indate date
    );
    
insert into products
values (1111, '상품1', 'A', 100000, 130000, '예쁜 가구', '가구 이미지', 300, 900, 999, 'A', '23/06/30');
insert into products
values (2222, '상품2', 'B', 100000, 130000, '예쁜 인형', '인형 이미지', 20, 100, 999, 'B', '23/06/30');
insert into products
values (3333, '상품3', 'C', 100000, 130000, '예쁜 생활용품', '생활용품 이미지', 10, 50, 999, 'C', '23/06/30');
insert into products
values (4444, '상품4', 'D', 100000, 130000, '예쁜 의류', '의류 이미지', 90, 130, 999, 'D', '23/06/30');
insert into products
values (5555, '상품5', 'E', 100000, 130000, '예쁜 식품', '식품 이미지', 10, 50, 999, 'E', '23/06/30');

select * from products;

create table orders (
    o_seq number(10) constraint PK_orders_o_seq not null Primary key,
    product_code varchar2(20),
        constraint FK_orders_product_code_products foreign key(product_code) references products(product_code),
    id varchar(16),
        constraint FK_orders_id_member foreign key(id) references member(id),
    produckt_size varchar2(5),
    quantity varchar(5),
    result char(1),
    indate date
);

insert into orders
values (1111,'1111','hihi01','25','2','O','2023/06/30');
insert into orders
values (2222,'2222','hihi02','30','2','O','2023/06/30');
insert into orders
values (3333,'3333','hihi03','510','2','O','2023/06/30');
insert into orders
values (4444,'4444','hihi04','155','2','O','2023/06/30');
insert into orders
values (5555,'5555','hihi05','140','2','O','2023/06/30');

select * from orders;
    