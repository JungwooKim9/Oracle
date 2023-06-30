/* WINE_DB */

create table sale (
    sale_date date default sysdate not null Primary key,
    wine_code varchar2(6) not null,
        constraint FK_sale_wine_code foreign key(wine_code) references wine(wine_code),
    mem_id varchar2(30) not null,
        constraint FK_sale_mem_id foreign key(mem_id) references wmember(mem_id),
    sale_amount varchar(5) not null,
    sale_price varchar2(6) not null,
    sale_tot_price varchar2(15) not null
);

insert into sale
values ('23/06/30', '9911', 'aaa', 98, 80000, 100000);
insert into sale
values ('23/07/04', '9912', 'bbb', 98, 80000, 100000);
insert into sale
values ('23/05/29', '9913', 'ccc', 98, 80000, 100000);
insert into sale
values ('23/08/12', '9914', 'ddd', 98, 80000, 100000);
insert into sale
values ('23/09/28', '9915', 'eee', 98, 80000, 100000);

select * from sale;

create table wmember (
    mem_id varchar2(6) not null Primary key,
    mem_grade varchar2(20),
        constraint FK_wmember_mem_grade foreign key(mem_grade) references grade_pt_rade(mem_grade),
    mem_pw varchar2(20) not null,
    mem_birth date default sysdate not null,
    mem_tel varchar2(20),
    mem_pt varchar2(10) default 0 not null
);

insert into wmember
values ('aaa', 'A', '1234', default, '010-1111-1111', 3000);
insert into wmember
values ('bbb', 'B', '1234', default, '010-1111-2222', 2000);
insert into wmember
values ('ccc', 'C', '1234', default, '010-1111-3333', 1000);
insert into wmember
values ('ddd', 'D', '1234', default, '010-1111-4444', 500);
insert into wmember
values ('eee', 'E', '1234', default, '010-1111-5555', default);

select * from wmember;

create table grade_pt_rade (
    mem_grade varchar(20) not null Primary key,
    grade_pt_rate number(3,2)
);

insert into grade_pt_rade
values ('A', 5.0);
insert into grade_pt_rade
values ('B', 4.0);
insert into grade_pt_rade
values ('C', 3.0);
insert into grade_pt_rade
values ('D', 2.0);
insert into grade_pt_rade
values ('E', 1.0);

select * from grade_pt_rade;


create table today (
    today_code varchar(6) not null Primary key,
    today_sens_value number(3),
    today_intell_value number(3),
    today_phy_value number(3)
);

insert into today
values ('AA', 500, 200, 300);
insert into today
values ('BB', 100, 900, 700);
insert into today
values ('CC', 900, 500, 100);
insert into today
values ('DD', 600, 300, 900);
insert into today
values ('EE', 500, 500, 500);

select * from today;

create table nation (
    nation_code varchar2(26) not null Primary key,
    nation_name varchar2(50) not null
);

insert into nation
values ('1010','대한민국');
insert into nation
values ('1020','미국');
insert into nation
values ('1030','중국');
insert into nation
values ('1040','일본');
insert into nation
values ('1050','영국');

select * from nation;

create table wine (
    wine_code varchar2(26) not null Primary key,
    wine_name varchar2(100),
    wine_url blob,
    nation_code varchar2(6),
            constraint FK_wine_nation_code foreign key(nation_code) references nation(nation_code),
    wine_type_code varchar2(6),
            constraint FK_wine_type_code foreign key(wine_type_code) references wine_type(wine_type_code),
    wine_sugar_code number(2),
    wine_price number(15) default 0 not null,
    wine_vintage date,
    theme_code varchar2(6),
            constraint FK_theme_code foreign key(theme_code) references theme(theme_code),
    today_code varchar(6),
            constraint FK_today_code foreign key(today_code) references today(today_code)
);

insert into wine
values ('9911', '가나', null, '1010', '777771', 10, 100000, '03/06/30', '3131', 'AA');
insert into wine
values ('9912', '나다', null, '1010', '777772', 10, 100000, '03/06/30', '3132', 'BB');
insert into wine
values ('9913', '다라', null, '1010', '777773', 10, 100000, '03/06/30', '3133', 'CC');
insert into wine
values ('9914', '라마', null, '1010', '777774', 10, 100000, '03/06/30', '3134', 'DD');
insert into wine
values ('9915', '마바', null, '1010', '777775', 10, 100000, '03/06/30', '3135', 'EE');

select * from wine;

create table theme (
    theme_code varchar2(6) not null Primary key,
    theme_name varchar2(50) not null
);

insert into theme
values ('3131','테마1');
insert into theme
values ('3132','테마2');
insert into theme
values ('3133','테마3');
insert into theme
values ('3134','테마4');
insert into theme
values ('3135','테마5');

select * from theme;

create table stock_management (
    stock_code varchar2(6) not null Primary key,
    wine_code varchar2(6),
        constraint FK_wine_code foreign key(wine_code) references wine(wine_code),
    manager_id varchar(30),
        constraint manager_id foreign key(manager_id) references manager(manager_id),
    ware_date date default sysdate not null,
    stock_amount number(5) default 0 not null
);

insert into stock_management
values ('9999','9911','mn1', default, 90);
insert into stock_management
values ('9998','9912','mn2', default, 90);
insert into stock_management
values ('9997','9913','mn3', default, 90);
insert into stock_management
values ('9996','9914','mn4', default, 90);
insert into stock_management
values ('9995','9915','mn5', default, 90);

select * from stock_management;

create table manager (
    manager_id varchar2(30) not null Primary key,
    manager_pwd varchar2(20) not null,
    manager_tel varchar2(20)
);

insert into manager
values ('mn1','1234','010-9999-9999');
insert into manager
values ('mn2','1234','010-9999-8888');
insert into manager
values ('mn3','1234','010-9999-7777');
insert into manager
values ('mn4','1234','010-9999-6666');
insert into manager
values ('mn5','1234','010-9999-5555');

select * from manager;

create table wine_type (
    wine_type_code varchar2(6) not null Primary key,
    wine_type_name varchar2(50)
);

insert into wine_type
values ('777771','화이트');
insert into wine_type
values ('777772','레드');
insert into wine_type
values ('777773','화이트');
insert into wine_type
values ('777774','레드');
insert into wine_type
values ('777775','화이트');

select * from wine_type;