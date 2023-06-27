/* Select 2 */

/* �Լ� ��� �ϱ� */

/*
    ����Ŭ���� �������ִ� �پ��� �⺻ ������ �Լ�
    1. ���� ó�� �Լ�
    2. ���� ó�� �Լ�
    3. ��¥ ó�� �Լ�
    4. ��ȯ �Լ�
    5. �Ϲ� �Լ�
*/

/*

    1. ���� �Լ�: 
        UPPER: �빮�ڷ� ��ȯ���ִ� �Լ�
        LOWER: �ҹ��ڷ� ��ȯ���ִ� �Լ�
        INITCAP: ù�ڸ� �빮�ڷ� ��ȯ���ִ� �Լ�
*/

/*
    dual: ������ ���̺�, ���� �Լ��� ó���ϱ� ���� �������� ���� ���̺�
*/

select UPPER ('Oracle mania') as �빮��
from dual;

select LOWER ('Oracle mania') as �ҹ���
from dual;

select INITCAP ('oracle mania') as "�ܾ��� ù�ڸ� �빮��"
from dual;

select ename as "�̸�(����)", LOWER(ename) as �ҹ���, INITCAP(ename) as "ù�ڸ� �빮��"
from employee;

--
select *
from employee;

select *
from employee
where ename = UPPER('ward');

/*
    ������ ���̸� ó���ϴ� �Լ�
    LENGTH: ���� ���� ��ȯ(�ѱ��� 1byte)
    LENGTHB: ���� ���� ��ȯ(�ѱ��� 3byte)�� ó��
*/

-- ���� ���� ����
select LENGTH ('Oracle mania') as ���ڼ�
from dual;

-- �ѱ� 1�ڴ� 3byte ==> 1�ڷ� ���
select LENGTH ('����Ŭ �ŴϾ�') as ���ڼ�
from dual;

-- LENGTHB: �ѱ� 1�ڸ� 3byte�� ó��
select LENGTHB ('����Ŭ �ŴϾ�') as ���ڼ�
from dual;

/*
    char(6): ����: 6��, �ѱ�: 2��     <== ������ �ڸ����� ������ ���     : �ֹι�ȣ(13), ������ ��й�ȣ(4), ...
    varchar2(6): ����: 6��, �ѱ�: 2��     <== ������ �ڸ����� �� �� ���� ���  : �ּ�, ����, ...
    
    nchar(6): �����ڵ�(3byte) 6�ڸ� �Է�: �ѱ�, �Ϻ���, �߱���, �ƽ�Ű�ڵ�, ����
    nvarchar2(6): �����ڵ�(3byte) 6�ڸ� �Է�: �ѱ�, �Ϻ���, �߱���, �ƽ�Ű�ڵ�, ����
*/

-- Test01 ���̺� ����
create table test01 (
    name1 char(6) not null,
    name2 varchar2(6) null,
    name3 nchar(6) null,
    name4 nvarchar2(6) null
);

drop table test01;

desc test01;

-- test01 ���̺� �� �ֱ�
-- name1, name2: ���� 6��, �ѱ� 2��
-- name3, name4: ���� 6��, �ѱ� 6��
select LENGTH('abcdefghijklmnopqr') from dual;

insert into test01 (name1, name2, name3, name4)
values ('abcdef','hijklm','abced6','����Ŭ�ŴϾ�');

insert into test01 (name1, name2, name3, name4)
values ('abcdef','hijklm','abced6','abcdefg');

insert into test01 (name1, name2)
values ('������', '������');

select * from test01;

-- ���� ���̺��� ���� ���� �о����
select * from employee;

select ename, length(ename) as �̸��Ǳ��ڼ�
from employee;

/*
    CONCAT: ���ڿ��� ���� �����ִ� �Լ�
    SUBSTR: ���ڸ� �߶󳻴� �Լ�, �ѱ� 1�ڸ� 1byte�� ó����
    SUBSTRB: ���ڸ� �߶󳻴� �Լ�, �ѱ� 1�ڸ� 3byte�� ó����
    INSTR: Ư�� ������ ��ġ���� ��ȯ(�ѱ� 1byte)
    INSTRB: Ư�� ������ ��ġ���� ��ȯ(�ѱ� 3byte)
    LPAD: ���� �ڸ����� �Է� �ް� �������� Ư�� ��ȣ�� ä��(����)
    RPAD: ���� �ڸ����� �Է� �ް� �������� Ư�� ��ȣ�� ä��(������)
    TRIM: ������ �����ϴ� �Լ�(��, ��)
    RTRIM: �������� ������ ����
    LTRIM: ������ ������ ����
*/

select 'Oracle', 'mania',
    concat ('Oracle', 'mania')
from dual;

select * from employee;

select ename, job, concat(ename, job) as �÷����� from employee;

-- substr: ���ڿ��� �߶���� �Լ�: substr(�÷�, 4, 3) --- �÷��� 4��° �ڸ����� 3�ڸ� �߶�ͼ� ���
select substr('Oracle mania', 4, 3)
from dual;

select substr('����Ŭ �ŴϾ�', 5, 3)
from dual;

select substrb('Oracle mania', 4, 3)
from dual;

select substrb('����Ŭ �ŴϾ�', 4, 3)
from dual;

-- ���� ���̺��� ���
select * from employee;

select hiredate, substr(hiredate, 1, 2) as ���������, substr(hiredate, 4, 2) as �������
    , substr(hiredate, 7, 2) as �ϸ����
from employee;

-- INSTR: Ư�� ������ ��ġ�� ���,
-- Oracle mania���� a��� ���ڰ� �� �ڸ���: 3
select instr('Oracle mania', 'a')
from dual;

-- 4��° �ڸ� ���ĺ��� �˻�: a�� �� �ڸ���: 9
select instr('Oracle mania', 'a', 4)
from dual;

-- ��� �̸� �÷��� ���� 'K'�� �� �ڸ����� �˻�: �˻��� ���� �ʴ� ��� �ڸ����� 0���� ���
select ename, instr(ename, 'K')
from employee;

-- LPAD: LPAD(�÷�, �ڸ������ø�, '*')  : Ư�����ڸ� ���ʿ� ���
-- RPAD: RPAD(�÷�, �ڸ������ø�, '*')  : Ư�����ڸ� �����ʿ� ���
select salary, LPAD(salary, 10, '*'), RPAD(salary, 10, '*')
from employee;

-- �ֹι�ȣ(13�ڸ�): 230627-1234567: ��ü: 14�ڸ�,  230627-1******
    -- substr�� ����ؼ� �߶󳻰�, RPAD�� ����ؼ� �������� *ǥ�� ó���ؼ� ���
    -- length �Լ��� ���
    -- dual ���̺��� �����ؼ� ���
    
    select '230627-1234567' as �ֹι�ȣ,
        RPAD( substr('230627-1234567',1,8), length('230627-1234567'), '*' ) as �ֹι�ȣ2
    from dual;
    
    select * from employee;
    
    -- �̸�, �Ի����� ��½� �⵵��**�� ���
    select ename as �̸�, RPAD(substr(hiredate,1,6), length(hiredate),'*') as �Ի���
    from employee;
    
    -- trim�� ����ؼ� ���� ����: DataBase�� �����ϱ� �� client���� ���ڿ��� �յ� ������ ���� �� DB�� ����
    select '       Oracle mania       ' as ����,
        RTRIM('       Oracle mania       ') as �����ʰ�������,
        LTRIM('       Oracle mania       ') as ���ʰ�������,
        TRIM('       Oracle mania       ') as �յڰ�������
    from dual;
    
    /* 2. ���� �Լ�
        ROUND: Ư�� �ڸ������� �ݿø� ó���ϴ� �Լ�     <== ����� �Ҽ��� �ڸ��� �ݿø��ؼ� ó��
            5�̻��� �ݿø�, 5���ϴ� ����
        
        ROUND(���): �Ҽ��� ���ڸ����� �ݿø�
        ROUND(���, �Ҽ����ڸ���):
            - ����� ��: �Ҽ��� �������� ���������� �̵��ؼ� �ݿø�, �� �ڸ��� �ڿ��� �ݿø� <== ����
            - ������ ��: �Ҽ��� �������� �������� �̵��ؼ� �ݿø�, �� �ڸ����� �ݿø�
            
        TRUNC: Ư�� �ڸ������� �߶� ����
        MOD: ������ ���� ��ȯ
    */
    
    select 98.7654 as ����,
        round(98.7654),     -- 99
        round(98.7654, 2),     -- 98.77 �Ҽ��� ���������� 2�ڸ� �̵� �� �� �ڿ��� �ݿø�
        round(98.7654, -1),     -- 100 �Ҽ��� �������� 1�ڸ� �̵� �� �� �ڸ����� �ݿø�
        round(98.7654, -2),     -- 100
        round(98.7654, -3),     -- 0
        round(98.7654, 3)     -- 98.765 �Ҽ��� ���������� 3�ڸ� �̵� �� �� �ڿ��� �ݿø�(5�ڿ� �ڸ��� 4���� �ݿø� ���� �ʰ� �����)
    from dual;
    
    select ROUND(1234/34, 2)
    from dual;
    
    select * from employee;
    
    -- �� �ٷμҵ漼�� ���: ���� * 0.033
    select salary, salary * 0.033 as �ٷμҵ漼
    from employee;
    
    -- TRUNC: Ư�� �ڸ����� ����
    select trunc(98.7654),   -- 98 �Ҽ��� �ڴ� ��� ����
            trunc(98.7654,2),   -- 98.76     �Ҽ��� 2�ڸ� �� �ڴ� ��� ����
            trunc(98.7654,-1),   -- 90     �Ҽ��� �������� 1�ڸ� �̵� �� ����
            trunc(98.7654,1)   -- 98.7     �Ҽ��� �������� 1�ڸ� �̵� �� ����
    from dual;
    
    -- MOD(���, ������ ��): ����� ������ ���� ����� �������� ���
    
    -- 31�� ����� �� ��� ������ ���
    select round(31/2) as �����, MOD(31, 2) as �����������
    from dual;
    
    select *
    from employee;
    
--1. ���� �����ڸ� ����Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ������� ����̸�, �޿�, �λ�� �޿��� ����ϼ���. 
    select ename as ����̸�, salary as �޿�, salary + 300 as "�λ�� �޿�"
    from employee;
    
--2. ����� �̸�, �޿�, ���� �� ������ ������ ���� ���������� ��� �Ͻÿ�. ���� �� ������ ���޿� 12�� ������ $100�� �󿩱��� ���ؼ� ��� �Ͻÿ�.
    select ename ����̸�, salary as �޿�, salary * 12 + 100 as "���� �� ����"
    from employee
    order by �޿� desc;

--3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� �޿��� ������ ���� ���������� ����ϼ���.
    select ename �̸�, salary �޿�
    from employee
    where salary > 2000
    order by �޿� desc;

--4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����ϼ���. 
    select ename �̸�, dno �μ���ȣ
    from employee
    where eno = 7788;

--5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ��� �ϼ���. 
    select ename �̸�, salary �޿�
    from employee
    where salary < 2000 or salary > 3000;

--6. 1981�� 2�� 20�Ϻ��� 81�� 5�� 1�� ������ �Ի��� ����� �̸� ������, �Ի����� ����Ͻÿ�
    select ename �̸�, job ������, hiredate �Ի���
    from employee
    where hiredate between '81/02/20' and '81/05/01';

--7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� ����(��������)���� ����Ͻÿ�.
    select ename �̸�, dno �μ���ȣ
    from employee
    where dno = 20 or dno = 30
    order by ename desc;

--8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸��� ������������ ����ϼ���.
    select ename �̸�, salary �޿�, dno �μ���ȣ
    from employee
    where (salary between '2000' and '3000') and (dno = 20 or dno = 30)
    order by ename asc;

--9. 1981�⵵ �Ի��� ����� �̸��� �Ի����� ��� �Ͻÿ� ( like �����ڿ� ���ϵ� ī�� ��� : _ , % )
    select ename �̸�, hiredate �Ի���
    from employee
    where hiredate like '81/%';

--10. �����ڰ� ���� ����� �̸��� �������� ����ϼ���.
    select ename �̸�, job ������
    from employee
    where manager is null;

--11. Ŀ�Լ��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿��� Ŀ�Լ��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
    select ename �̸�, salary �޿�, commission Ŀ�̼�
    from employee
    where commission is not null
    order by salary desc, commission desc;

--12. �̸��� ����° ������ R�� ����� �̸��� ǥ���Ͻÿ�.
    select ename �̸�
    from employee
    where instr(ename, 'R') = 3;

--13. �̸��� A �� E �� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
    select ename �̸�
    from employee
    where (instr(ename, 'A') > 0) and (instr(ename, 'E') > 0);

/* 14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸缭
    �޿��� $1600, $950, �Ǵ� $1300 �� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�. */
    select ename �̸�, job ������, salary �޿�
    from employee
    where (job = 'CLERK' or job = 'SALESMAN') and (salary != 1600 and salary != 950 and salary != 1300);

--15. Ŀ�̼��� $500�̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.
    select ename �̸�, salary �޿�, commission Ŀ�̼�
    from employee
    where commission >= 500;
    
    select * from employee;
    /* order by���� �� �� �̻��� �÷��� ���ĵ� �� */
    select *
    from employee
    order by job asc;
    
    -- job asc, ename desc
    -- �� �� �̻��� �÷��� ���ĵ� ��, job �÷�(���÷�)�� ���� ��, job �÷��� �ߺ��� ���� ���ؼ� ename �÷�(���÷�) desc ���ĵ�
    select *
    from employee
    order by job asc, ename desc;
    
    select *
    from employee
    order by dno desc, ename asc;
    
    /* ��¥ �Լ�
        SYSDATE: ���� �ý����� ��¥�� ����ϴ� �Լ�
        MONTHS_BETWEEN: �� ��¥ ������ ���� ���� ���
        ADD_MONTHS: Ư�� ��¥�� ���� ���� ���� �� ���
        NEXT_DAY: Ư�� ��¥���� �ʷ��ϴ� ������ ���ڷ� �޾Ƽ� ������ �����ϴ� ��¥�� ���
        LAST_DAY: ���� ������ ��¥�� ��ȯ
        ROUND: ��¥�� �ݿø��ϴ� �Լ�, 15�� �̻�: �ݿø�, 15�̸�: ����
        TRUNC: ��¥�� �߶󳻴� �Լ�
    */
    -- ���� �ý����� ��¥�� ���: ��/��/��
    select sysdate
    from dual;
    
    select sysdate -1 as ����, sysdate as ����, sysdate +1 as ����
    from dual;
    
    select * from employee;
    
    -- �Ի��Ϸκ��� ���� ��¥���� ��ĥ �ٹ��ߴ��� ���
    select ename �̸�, hiredate �Ի���, Round(sysdate - hiredate) �ѱٹ��ϼ�
    from employee;
    
    -- �Ի��Ϸκ��� 1000�� ���� ������ ��¥�� ���.
    select ename �̸�, hiredate �Ի���, hiredate + 1000 �Ի�õ�ϳ�¥
    from employee;
    
    -- Ư�� ��¥���� ���� �������� ���
    select hiredate as ����, trunc (hiredate, 'MONTH'), ROUND(hiredate, 'MONTH')
    from employee;
    
    -- months_between: �� ��¥ ������ ���� ���� ���
    select ename, hiredate, trunc(months_between(sysdate, hiredate)) as �ٹ�������
    from employee;
    
    -- date(��¥Ÿ��)
    -- add_months(��¥, ������): ��¥�� �������� ���ϴ� �Լ�
    -- ���� ��¥�� 100������ ���� ��¥
    select sysdate as "���� ��¥", add_months (sysdate, 100) as "100���� ��", sysdate + 100 as "100�� ��"
    from dual;
    
    -- �Ի� �� 6������ ���� ������ ���
    select ename, hiredate, add_months(hiredate, 6) as "�Ի� �� 6���� ����"
    from employee;
    
    -- next_day: Ư�� ��¥���� ������ ��ǲ���� �־ �����ϴ� ������ ��¥�� ���
    select next_day (sysdate, '������')
    from dual;
    
    -- last_day(date): date�� ������ ��¥�� ���
    select sysdate as ���ó�¥, last_day(sysdate)
    from dual;
    
    -- ��� ���̺��� �Ի����� ������ ��¥�� ���
    select hiredate as �Ի���, last_day(hiredate)
    from employee;
    
    /* ���� ��ȯ �Լ�
        TO_CHAR: ��¥, �������� ���������� ��ȯ
        TO_DATE: �������� ��¥������ ��ȯ
        TO_NUMBER: �������� ���ڷ� ��ȯ
    */
    
    -- TO_CHAR(date, 'YYYYMMDD'): ��¥ ������ 'YYYYMMDD' �������� �̾ƿͼ� char Ÿ������ ��ȯ
    
    select TO_CHAR (sysdate,'YYYYMMDD')
    from dual;