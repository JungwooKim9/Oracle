/* MS-SQL: 자동 증가 컬럼, IDENTITY */
create table dept08(

	dno int identity(1,1) primary key,
	dname varchar(50),
	loc varchar(50)
	);

select * from dept08;

insert into dept08 (dname, loc)
values ('인사부', '서울');

insert into dept08 (dname, loc)
values ('관리부', '부산');