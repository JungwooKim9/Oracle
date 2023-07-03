/* JOIN, VIEW, INDEX, ������ */

-- ���̺� ����:

create table dept03
as
select * from department;

select * from dept03;

create table emp03
as
select * from employee;

select * from emp03;

-- ���̺� ����: Ư�� �÷��� ������ �־ ����

create table salesman01
as
select eno, ename, job, salary
from employee
where job='SALESMAN';

select * from salesman01;

-- �츮 ȸ���� ��å�� ���� ���̺� ����(job01)

select * from employee;

create table job01
as
select distinct job
from employee;

-- ���̺� ����� ���� ������ ������� �ʴ´�. - �÷���, �ڷ���, ���ڵ�(����Ÿ) �����,
    -- ���� ������ ������� �ʴ´�.(Primary Key, Unique, Foreign Key, Not Null, Check)
    
-- ���� ���� Ȯ��: user_constraints   <== ������ ����: ����Ŭ���� ���̺� ������ ���� ���̺�
select * from user_constraints
where table_name in('DEPARTMENT', 'DEPT03', 'EMPLOYEE', 'EMP03');

-- Alter Table�� ����ؼ� ���� ���̺� ���� ���� �߰�
select * from emp03;
select * from dept03;

-- EMP03 ���̺��� ENO �÷��� Primary Key �Ҵ�: ���̺� 1���� �Ҵ�, �÷��� �ߺ��� �����Ͱ� ������Ѵ�, null�� ������Ѵ�.
desc emp03;

alter table emp03
add constraint PK_EMO03_ENO primary key(eno);

-- EMP03 ���̺��� DNO �÷��� Foreign Key: �θ� ���̺�: DEPT03 DNO �÷��� ����
    -- Foreign Key�� �����ϴ� �÷��� Primary Key�� Unique �÷��� ����
    -- ���� �÷��� �ڷ����� ���ų� ����ؾ� �Ѵ�.
    -- DNO �÷��� ���� �θ� ���̺��� �÷��� ���� ������ ���� ����־�� �Ѵ�.
    
desc emp03;
desc dept03;

-- �θ� ���̺��� ���� �÷���: Primary Key, Unique���� �Ѵ�.

alter table dept03
add constraint PK_DEPT03_DNO Primary Key(dno);

alter table emp03
add constraint FK_EMP03_DNO foreign key (dno) references dept03 (dno);

select * from emp03;

select distinct job from emp03;

alter table emp03
add constraint CK_EMP03_SALARY check (salary > 0);

-- EMP03�� JOB �÷���: CLERK, SALESMAN, MANAGER, ANALYST, PRESIDENT�� �ֵ��� üũ ���� ���� �Ҵ�.
alter table emp03
add constraint CK_EMP03_JOB check (job in('CLERK', 'SALESMAN', 'MANAGER', 'ANALYST', 'PRESIDENT'));

/* JOIN: DataBase���� ���� ���̺��� �����մϴ�. �� ���̺��� �ٸ� ���̺�� ����(FK)�� ������ �ִ�.
        RDBMS: ������ DBMS
    -- DB���� ������ ���̺��� �𵨸� �Ǿ� �ִ�. (�ߺ� ����, ���� ���)
    -- �𵨸� ���� �ʴ� ���̺��� �ߺ��� �����Ͱ� ��� �Էµ�   <== �ϵ� ������ ����, ������ ��������.
    -- employee ���̺��� dno �÷��� �μ� ��ȣ�� ������ �ִ�.
    -- department ���̺��� �μ���ȣ, �μ���, �μ���ġ�� ������ �ִ�.
    -- employee ���̺�� department ���̺��� �ϳ��� ���̺�� ������ �Ǿ��� ��� �μ� ������ ��� �ߺ� �Ǿ ��.
    -- �ٸ� ���̺��� �÷��� ��� �ϱ� ���ؼ��� JOIN�� ����ؼ� �ٸ� ���̺��� �÷��� ���
    -- �� ���̺��� JOIN �ϱ� ���ؼ��� �� ���̺��� ���� Ű �÷��� ã�ƾ� �Ѵ�.(FK -> PK,UK) <== ON
    -- JOIN ANST ȣȯ JOIN: ��� DBMS���� �������� ����ϴ� JOIN ����
        -- Oracle, MSSQL, MYSQL, ...
        
*/

select * from employee;

select * from department;

/* EQUI JOIN: ����Ŭ������ �۵��ϴ� JOIN ����   <== ����: ���� Ű �÷��� ���̺� �̸��� ���
    select - JOIN�� ���̺��� �÷��� ���, �� ���̺��� ������ Ű �÷��� ��½�
    from - JOIN�� ���̺��� ,�� ���, ���̺� �̸��� ��Ī���� ���
    where - �� ���̺��� ���� Ű �÷��� ã�Ƽ� '='�� ó��
    and - ������ ó����
*/

-- ���̺� ��Ī(alias)�� ����ؼ� ����
select ENO, ENAME, JOB, e.DNO, DNAME, LOC
from employee e, department d
where e.dno = d.dno
and d.dno = '20';

-- ���̺� ��Ī(alias)�� ������� �ʴ� ��� [��ü ����]
select employee.eno, employee.ename, employee.job, employee.dno, department.dname, department.loc
from employee, department
where employee.dno = department.dno
and employee.dno = '20';

-- ���� Ű �÷��� �ƴϸ� ���� ����
select eno, ename, job, e.dno, dname, loc
from employee e, department d
where e.dno = d.dno
and e.dno = '20';

/* employee, department ��ü ���̺� ��� */
desc employee;
desc department;

create table emp_dept
as
select eno, job, manager, hiredate, salary, commission, d.dno, dname, loc
from employee e, department d
where e.dno = d.dno;

select * from emp_dept;

select * from department;

/* ANSI JOIN: ��� DBMS���� �������� ����ϴ� JOIN ���� */

/* INNER ����: �� ���̺� ��� ���� Ű �÷��� ���� ��ġ�ϴ� �͸� ���   <== 90% �̻� ���
    Select: �� ���̺��� �÷��� ���, �� ���̺��� ���� Ű �÷��� ��½� ���̺� �̸��� ���
    from���� : ���̺�1 [inner](���� ����) JOIN ���̺�2
    ON����   : �� ���̺��� ���� Ű �÷��� ���
    where���� ���� ó���� 
*/

select eno, ename, job, salary, e.dno, dname, loc
from employee e inner join department d
on e.dno = d.dno
where e.dno = '20';

/* Outer JOIN: ���� ���̺��� ������ ��� ����ϵ��� ��
    LEFT Outer JOIN: ���� ���̺��� ������ ��� ���
    RIGHT Outer JOIN: ������ ���̺��� ������ ��� ���
    Full Outer JOIN: �� ���̺� ��� ��ü ������ ���
*/

-- ANSI ȣȯ�� Outer JOIN

/*
    ���� �ǽ� ���̺� ����
*/
create table emp05
as
select * from employee;

create table dept05
as
select * from department;

select * from dept05;
select * from emp05;

insert into dept05
values(50, 'HR', 'SEOUL');

commit;

-- ANSI ȣȯ INNER JOIN: �� ���̺��� ���� Ű �÷��� ��ġ�ϴ� �����͸� ���(������)
select ename, job, e.dno, dname, loc
from dept05 d Inner JOIN emp05 e
on d.dno = e.dno;

-- ANSI ȣȯ LEFT Outer JOIN: �� ���̺��� ���� Ű �÷��� ��ġ�ϴ� ���� ���̺��� ���� ��� ���
select ename, job, e.dno, d.dno, dname, loc
from dept05 d LEFT OUTER JOIN emp05 e
on d.dno = e.dno;

-- Oracle Equie JOIN

-- īŸ���þ� ��(�� ���̺��� ��� ���ڵ尡 �� ���̺��� ���ڵ� ���� ��Ī)
-- where ���ǿ��� �� ���� Ű �÷��� ���� �׸� ���
select *
from employee e, department d
where e.dno = d.dno
and salary > 2000;

/* NATURAL JOIN: ����Ŭ������ ���Ǵ� JOIN,
    - �� ���̺��� ���� Ű �÷��� Oracle�� �ڵ����� ã�Ƽ� JOIN
    - Select ������ ���� Ű �÷��� ���̺��� ����ϸ� ���� �߻���
    - from���� NATURAL JOIN Ű���带 �����.
    - where���� ���� Ű �÷��� ������� ����. (����Ŭ���� �� ���̺��� ���� Ű �÷��� �ڵ����� ã�Ƽ� ó����.)
    - where���� ������ ó����
*/

-- NATURAL JOIN���� JOIN  <== �� ���̺��� ���� Ű �÷��� �ڵ����� ã�Ƽ� JOIN ������, select���� ���� Ű �÷��� ��½� ���̺� �̸��� ����ϸ� ������ �߻�
select eno, ename, salary, dno, dname, loc
from emp05 e natural join dept05 d
where salary > 2000;

-- EQUI JOIN
select eno, ename, salary, e.dno, dname, loc
from emp05 e, dept05 d
where e.dno = d.dno;

-- Ansi SQL JOIN: ��� DBMS���� ���Ǵ� ����: Oracle, MS-SQL, My-SQL, Postgre, MariaDB, ...
select eno, ename, salary, e.dno, dname, loc
from emp05 e join dept05 d
on e.dno = d.dno
where salary > 2000;

/* SELF JOIN: �ڽ��� ���̺��� �ٽ� �� �� JOIN
    -- �ݵ�� ���̺� ��Ī�� ����ؼ� JOIN �ؾ���.
    -- select���� �÷��� ����� �� ��Ī �̸��� ���̺���� ����ؾ���.
    -- ������, ��� ������ �ڽ��� ���̺��� ��ȸ�� �� �����.
*/

select * from emp05;

-- SELF JOIN�� ����ؼ� ����� ���� ��� ����(�̸�)�� ���
select dno �����ȣ, ename �����, manager ���ӻ��
from employee
where manager = 7788
order by ename asc;

select dno �����ȣ, ename �����, manager ���ӻ��
from employee
where eno = 7788
order by ename asc;

-- SELF JOIN�� ����ؼ� ���� ��� ������ �� ���� ���   (EQUI JOIN)
select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ۻ�������ȣ, m.ename ���ӻ���̸�
from emp05 e, emp05 m
where e.manager = m.eno(+)
order by e.ename asc;

select eno, ename, manager, eno, ename, manager
from emp05;

-- ANSI JOIN�� ����ؼ� ���� ��� ������ �� ���� ���   (ANSI JOIN)
select e.eno �����ȣ, e.ename ����̸�, e.manager ���ӻ����ȣ, m.eno ���ӻ�������ȣ, m.ename ���ӻ���̸�
from emp05 e Join emp05 m
on e.manager = m.eno(+)
order by e.ename asc;

select * from emp05;

-- select ������ || �� ����ϸ� ���ڿ��� ���� �� �� ����
select '�����: ' || ename || '�� ������ ' || salary || '�Դϴ�.' as ����޿�����
from emp05;

-- ������� ���ӻ���̸��� SELF JOIN���� �ٷ� ���
select e.ename ����̸�, m.ename ���ӻ���̸�
from emp05 e Join emp05 m
on e.manager = m.eno
order by e.ename asc;

-- KING�� Manager ������ �������� �ʴ� ������ Outer Join�� ���ؼ� ���
select e.ename || '�� ���ӻ�� �̸��� ' || m.ename ||' �Դϴ�' as "����� ���� ���ӻ����"
from emp05 e LEFT Outer Join emp05 m
on e.manager = m.eno
order by e.ename asc;

/* CROSS JOIN: īŸ���þ� ��: �� ���̺��� �ϳ��� ���ڵ忡�� �� ���̺��� ��� ���ڵ�� ����
        : �� �� ���̺��� ��� ������ ���ؼ� ���� üũ �� ���.
*/

-- ANSI JOIN���� ���(14 * 5 = 70�� ���ڵ� ���)
select *
from emp05 e cross join dept05 d;

-- EQUTE JOIN
select *
from emp05 e, dept05 d;

-- VIEW ���� �� �� �ִ� ���� �Ҵ� (System �������� ���� �� ����)
GRANT CREATE ANY VIEW TO "C##HR" WITH ADMIN OPTION;
GRANT DROP ANY VIEW TO "C#HR" WITH ADMIN OPTION;

-- VIEW: ������ ���̺�, �ڵ尡 ����� ���� ���̺�
    -- VIEW�� �����͸� ������ ���� �ʴ´�. select �ڵ尡 ����ִ�.
    -- ��ġ ���̺� ó�� ����
    -- view�� select ������ �� ����.
    
    -- 1. ������ ���ؼ� ����(���� ���̺��� Ư�� �÷��� ���)
    -- 2. ������ ������ ���� �� ȣ���ؼ� ���(JOIN)

-- �並 ����(������ ���� ������ view)
create view v_emp
as
select ename, salary from emp05;

select * from emp05;

-- �� ����
select * from v_emp;

-- view ������ Ȯ���ϴ� ������ ����: user_views
select * from user_views;     -- ���� �α����� �������� ������ ��� view�� Ȯ��

-- View ����: emp05 ���̺�� dept05 ���̺��� JOIN�ϴ� ����
create view v_emp_dept
as
select eno, ename, job, salary, e.dno, dname, loc
from emp05 e, dept05 d
where e.dno = d.dno;

-- View ����
select * from v_emp_dept;

-- View ����
drop view v_emp_dept;

-- �ڽ��� ���� ��縦 ����ϴ� view ����
select * from emp05;

select e.eno, e.ename, e.manager, m.eno, m.ename, m.manager
from emp05 e, emp05 m
where e.manager = m.eno;

create view v_sasu_info
as
select e.ename ����̸�, e.manager, m.eno, m.ename ���ӻ��
from emp05 e JOIN emp05 m
on e.manager = m.eno
order by e.ename asc;

select * from v_sasu_info;

-- view�� ����� �ڵ� ������ Ȯ��: ������ ������ ����ؼ� Ȯ��
select * from user_views;