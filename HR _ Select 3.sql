    /* Select 3 */
    /* ���� ��ȯ �Լ�
        TO_CHAR: ��¥, �������� ���������� ��ȯ
        TO_DATE: �������� ��¥������ ��ȯ
        TO_NUMBER: �������� ���ڷ� ��ȯ
    */
    
    -- TO_CHAR(date, 'YYYYMMDD'): ��¥ ������ 'YYYYMMDD' �������� �̾ƿͼ� char Ÿ������ ��ȯ
    
    /*
        YYYY: ��¥ ������ �⵵�� �̾Ƴ�
        YY: ��¥ �⵵�� ������ 2�ڸ��� �̾Ƴ�
        MM: ��
        DD: ��
        
        DAY: ������ �̾ƿ�(������, ȭ����, ...�Ͽ���)
        DY: ������ ���� �̾ƿ�(��, ȭ, ...��)
        
        HH: �ð�
        MI: ��
        SS: ��
    */
    
    select TO_CHAR (sysdate,'YYYY/MM/DD'), TO_CHAR(sysdate, 'YYYY-MM-DD(DY) HH:MM:MI:SS')
    from dual;
    
    select sysdate, TO_CHAR(sysdate, 'YY/MM/DD_HH:MI:SS_DY')
    from dual;
    
    select * from employee;
    
    desc employee;
    
    select hiredate, TO_CHAR(hiredate, 'YYYY-MM-DD DAY HH:MM:SS')
    from employee;
    
    -- TO_CHAR: ��¥, ���� ==> ���������� ��ȯ
    
    /*
        0: �ڸ����� ó����, �ڸ����� ���� ������ 0���� ó����
        9: �ڸ����� ó����, �ڸ����� ���� ������ �������� ó����
        L: �� ������ ��ȭ�� ��ȣ�� ǥ��
        . : �Ҽ������� ó��
        , : õ���� ������
    */
    
    desc employee;
    
    select ename, salary, to_char(salary,'L999,999'), to_char(salary, 'L000,000')
    from employee;
    
    -- TO_DATE: ������, ���� ==> ��¥Ÿ������ ��ȯ
    /*
        TO_DATE (��ȯ�ҹ���[����], YYYYMMDD)
    */
    
    select TO_DATE(20230628,'YYYYMMDD'), TO_DATE('06282023','MMDDYYYY')
    from dual;
    
    select to_date ('2021-10-30', 'YYYY-MM-DD')
    from dual;
    
    -- ���Ͽ��� ���� ��¥���� ��ĥ ��Ҵ��� ���: 1981-04-15
    select sysdate - to_date('1981-04-15', 'YYYY-MM-DD')    --�ش� ��¥���� ��������� �ϼ�
    from dual;
    
    select to_date('12/06/22', 'MM/DD/YY') - to_date('1900-10-17', 'YYYY-MM-DD') as "�� ��¥�� ��"
    from dual;
    
    -- �ڽ��� ���Ͽ��� ������� ��ĥ ��Ҵ���, ��� �������� ���
    select trunc(sysdate - to_date('1998-09-28', 'YYYY-MM-DD')) as "��ƿ� �� ��",
        trunc(months_between(sysdate, to_date('1998-09-28', 'YYYY-MM-DD'))) as "��ƿ� ���� ��"
    from dual;
    
    -- employee ���̺��� ������� �Ի��Ͽ��� 2030/01/01������ �ٹ� ���� ���� ����
    select * from employee;
    select ename, hiredate,
        trunc (months_between (to_date('2030/01/01','YYYY/MM/DD'), hiredate)) as "Ư�� ��¥���� �ٹ� ���� ��"
    from employee;
    
    -- null ó�� �Լ�: NVL, NVL2, NULLIF
    /*
        NVL(�÷�, ��): �÷��� NULL�� ������ ��� ������ ��ġ
        NVL2(�÷���, null�̾ƴҰ��ó��, null���ó�����)
    */
    select * from employee;
    
    -- NVL �Լ��� ����ؼ� ó�� - ������ ����. ����(salary) * 12 + ���ʽ�(commission)
    select ename, salary, commission,
        salary * 12 + NVL(commission,0) as �ѿ���
    from employee;
    
    -- NVL2 �Լ��� ����ؼ� ó��
    select ename, salary, commission, 
        NVL2(commission, salary * 12 + commission, salary * 12) as �ѿ���
    from employee;
    
    /* �׷� �Լ�: group by, Ư�� �÷��� �׷����ؼ� ó���� */
    
    select �÷���
    from ���̺��̸�[��]
    where ����
    group by �÷���[�׷������÷���]
    having ����[�׷����Ѱ��������]
    order by �÷���[�������÷���];
    
    /* ���� �Լ�: SUM, AVG, MAX, MIN, COUNT  <== null�� �ڵ����� ó���ؼ� �۵���
        NUMBER Ÿ�Կ����� ��� ����
        
        -- SUM: �÷��� ��� ���� ���ϴ� �Լ�
        -- AVG: �÷��� ��� ���� ����� ���ϴ� �Լ�
        -- MAX: �÷��� ��� ���� �ִ밪�� �������� �Լ�
        -- MIN: �÷��� ��� ���� �ּҰ��� �������� �Լ�
        -- COUNT: ���ڵ��, �׷��ε� ���� ���
        
        ����: ���� row�� ��µ�, �ٸ� �÷��� ���� ����� ��� ������ �߻�
    */
    
    select commission from employee
    order by commission asc;
    
    select SUM(commission) as �հ�,
        AVG(commission) as ���,
        MAX(commission) as �ִ밪,
        MIN(commission) as �ּҰ�,
        count(commission)
    from employee;
    
    select * from employee;
    
    -- �μ��� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷��ε� ����
    -- dno: �μ���ȣ�� ������ ���� �׷����ؼ� ó����
    select avg(salary) as �μ����հ�, dno, count(dno) as �׷��εȰ���
    from employee
    group by dno;
    
    select ename, salary, dno
    from employee
    order by dno asc;
    
    -- �μ����� ������ �հ�, ���, �ִ����, �ּҿ���, �׷��ε� ���� ���
    select sum(salary), avg(salary), max(salary), min(salary), dno �μ���ȣ, count(dno) �׷��μ�
    from employee
    group by dno
    order by dno asc;
    
    select salary from employee where dno = 20;
    
    select ename, job, salary
    from employee;
    
    -- ���޺� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷��ε� ��
    select sum(salary) as �հ�, avg(salary) as ���, max(salary), min(salary), job, count(job)
    from employee
    group by job
    order by ��� desc;
    
    -- group by����
    /*
        where��: <����> group by ���� ������ ó���ؼ� ���� ����� group by
        having��: <����> group by �� ����� ���� ����ó��, ��Ī�̸��� ����ϸ� �ȵ�
        order by�� ��Ī�̸� ��� ����
    */
    
    -- ���޺��� ������ �հ�, ���, �ִ밪, �ּҰ��� ����ϵ� 20�μ��� ����, ����� 2000�̻��� �͸� ���
    -- ����� ������������ �����϶�
    select sum(salary) as �հ�, round(avg(salary)) as ���, max(salary) �ִ밪, min(salary) �ּҰ�, job ����, count(*) �׷��μ�
    from employee
    where dno not in (20)
    having round(avg(salary)) >= 2000
    group by job
    order by round(avg(salary)) desc;
    
    -- ���÷� �̻� �׷��� �� �� �ִ�: �� �÷� ��ΰ� ������ �� �׷��� ����
    select dno, job
    from employee
    order by dno, job;
    
    -- �μ���ȣ�� ��å�÷� ��� �׷����ؼ� ������ �հ�, ���, �ִ밪, �ּҰ�, �׷��ε� ��
    select sum(salary), round(avg(salary)), max(salary), count(*) �׷��εȼ�
    from employee
    group by dno, job
    order by �׷��εȼ� desc;
    
    -- �� ��å�� ���ؼ� ������ �հ�, ���, �ִ밪,  �ּҰ��� ����ϴµ� �Ի����� 81�⵵�� �Ի��� ����鸸 ����ϵ�
    -- ������ ����� 1500�̻��� �͸� ����ϰ� ������ ������������ �����ؼ� ���
    select sum(salary) as �հ�, round(avg(salary)) as ���, max(salary) �ִ밪, min(salary) �ּҰ�, job ����, count(*) �׷��μ�
    from employee
    where hiredate like '81%'
    group by job
    having round(avg(salary)) > 1500
    order by ��� desc;
    
    select count(*)
    from employee
    where hiredate like '81%';
    
    -- rollup: �׷����� ��� ������ ���ο� ��ü ����� ���,
    -- cube: �� �׷����� ������ ���ο� ��� ���, ���� ������ ���ο� ��ü ����� �Բ� ���
    
    -- rollup, cube�� ������� �ʴ� �׷��� ����
    -- 
    select sum(salary), round (avg(salary)) as ���, max(salary), min(salary), dno, count(*)
    from employee
    group by dno
    order by dno asc;
    
    -- rollup�� ���
    select sum(salary), round (avg(salary)) as ���, max(salary), min(salary), dno, count(*)
    from employee
    group by rollup (dno)
    order by dno asc;
    
    -- cube�� ���
    select sum(salary), round (avg(salary)) as ���, max(salary), min(salary), dno, count(*)
    from employee
    group by rollup (dno)
    order by dno asc;
    
    /* SubQuery(���� ����): Select ������ select ����, ������ �۾��� �ϳ��� �������� ����
        where ������ ���� �����
    */
    
    -- ename�� SCOTT�� ����� ������ ��å�� ������� ����϶�.
    /*
        1. ename�� SCOTT�� ����� ��å�� �������� ����
        2. ��å�� �������� �ؼ� ����� �˾ƿ;��ϴ� ����
    */
    select * from employee;
    select job
    from employee
    where ename = 'SCOTT';
    
    select ename from employee where job = 'ANALYST';
    
    select * from employee;
    
    -- SubQuery�� ����ؼ� ename�� SCOTT�� ����� ������ ��å�� ������� ����϶�
    select ename, salary, job
    from employee
    where job = ( select job from employee where ename='SCOTT' );
    
    -- SMITH�� ������ �μ��� ���� ������� ����ϱ�(subquery)
    select dno from employee where ename='SMITH';
    
    select ename, dno
    from employee
    where dno = (select dno from employee where ename='SMITH');
    
    -- 'SCOTT'�� ���޺��� ���� ��� ���� ���
    select ename, salary
    from employee
    where salary > (select salary from employee where ename='SCOTT');
    
    -- �ּ� �޿��� �޴� ����� �̸��� ������, �޿� ����ϱ�
    select ename, job, salary
    from employee
    where salary = (select min(salary) from employee);
    
    -- ���� ���� �ƴ϶� �������� ���� ��µ� ��� IN Ű���带 ���
    
    -- Subquery�� ���
    
    -- �μ����� �ּ� �޿��� �޴� ��� ������ �̸�, ��å, ������ ���, group by, min, in Ű���� ����ؼ� ���
    select ename �̸�, job ��å, salary ����, dno �μ���ȣ
    from employee
    where salary in (
        select min(salary)
        from employee
        group by dno
        );
        
    -- �� �μ��� �ּ� �޿��� 30�� �μ��� �ּ� �޿� ���� ū �μ��� ���
    select min(salary), dno, count(*)
    from employee
    group by dno
    having min(salary) > (
        --30�� �μ��� �ּ� �޿�
        select min(salary) from employee
        where dno=30
    );
    
    /*
        ANY ������: ���������� ��ȯ�ϴ� ������ ���� ����
        -- < any �� �ִ밪 ���� ������ ��Ÿ��
        -- > any �� �ּҰ� ���� ŭ�� ��Ÿ��
        -- = any �� IN�� ������ Ű����
        
        ALL������: ������������ ��ȯ�Ǵ� ��� ���� ����.
        -- < all �� �ּҰ� ���� ����
        -- > all �� �ִ밪 ���� ŭ�� ��Ÿ��
    */
    
    -- ������ SALESMAN�� �ƴϸ鼭 ������ SALESMAN�� ������� �޿��� ���� ����� ���
    select * from employee order by job asc;
    
    -- ALL �����ڸ� ����ؼ� ���
    select ename, job, salary
    from employee
    where salary < all (select salary from employee
                            where job='SALESMAN')
        and job != 'SALESMAN';   -- !=, <>
        
    -- min�� ����ؼ� ���
        select ename, job, salary
    from employee
    where salary < (select min(salary) from employee
                            where job='SALESMAN')
        and job != 'SALESMAN';
        
    -- ��� ������ �м���(ANALYST)�� ������� �޿��� �����鼭 ������ �м����� �ƴ� ���
    select ename, job, salary
    from employee
    where salary < all (select salary from employee where job='ANALYST') and job != 'ANALYST';
    
--  =====================================================================  
--1. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ��� �Ͻÿ�. 
    select substr(hiredate,1,5) �Ի���
    from employee;
    
--2. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ��� �Ͻÿ�.
    select ename "4�� �Ի���", hiredate
    from employee
    where substr(hiredate,4,2) = 4;

--3. MOD �Լ��� ����Ͽ� ���ӻ���� Ȧ���� ����� ����Ͻÿ�. 
    select ename, manager
    from employee
    where MOD(manager,2) like 1;

--4. MOD �Լ��� ����Ͽ� ������ 3�� ����� ����鸸 ����ϼ���.
    select ename, salary
    from employee
    where MOD(salary,3) = 0;

--5. �Ի��� �⵵�� 2�ڸ� (YY), ���� (MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ��� �Ͻÿ�.
    select TO_CHAR(hiredate, 'YY / MM"MON" / DY')
    from employee;

--6. ���� �� ���� �������� ��� �Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ� ������ ������ ��ġ ��Ű�ÿ�.
    select trunc(sysdate - to_date('2023-01-01', 'YYYY-MM-DD'))
    from dual;

--7. �ڽ��� �¾ ��¥���� ������� �� ���� �������� ��� �ϼ���. 
    select trunc(sysdate - to_date('1998-09-28', 'YYYY-MM-DD'))
    from dual;

--8. �ڽ��� �¾ ��¥���� ������� �� ������ �������� ��� �ϼ���.
    select months_between(sysdate, to_date('1998-09-28', 'YYYY-MM-DD'))
    from dual;

--9. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� null ����� 0���� ��� �Ͻÿ�.
    select ename ,NVL(manager,0)
    from employee;

/* 10.   �����ȣ,
      [�����ȣ 2�ڸ������ �������� *���� ] as "������ȣ", 
      �̸�, 
       [�̸��� ù�ڸ� ��� �� ���ڸ�, ���ڸ��� * ����] as "�����̸�" */
    select RPAD( substr(eno,1,2), length(eno), '*' ) as ������ȣ,
        RPAD( substr(ename,1,1), 4, '*') as �����̸�
    from employee;
    

--11.  �ֹι�ȣ:   �� ����ϵ� 801210-1*******   ��� �ϵ��� , ��ȭ ��ȣ : 010-12*******
--	dual ���̺� ���
    select RPAD(substr('801210-1234567',1,8), length('801210-1234567'),'*') as �ֹι�ȣ,
        RPAD(substr('010-1234-5678',1,7), length('010-1234-5678'),'*') as ��ȭ��ȣ
    from dual;
--=============================================================================
--��� ����� �Ҽ��� 2�ڸ����� ����ϵ� �ݿø� �ؼ� ��� �Ͻÿ�.

--1.  10 �� �μ��� �����ϰ� �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�.
    select sum(salary), round(avg(salary),2), max(salary), min(salary)
    from employee
    where dno != 10;

--2.  ��å�� SALSMAN, PRESIDENT, CLERK �� ������ �� �μ��� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�.
    select sum(salary), round(avg(salary),2), max(salary), min(salary)
    from employee
    where job != 'SALESMAN' and job != 'PRESIDENT' and job != 'CLERK';

--3. SMITH �� ������ �μ��� �ٹ��ϴ� ����� �� ������ �հ�� ��հ� �ִ밪, �ּҰ��� ���Ͻÿ�. 
    select sum(salary), round(avg(salary),2), max(salary), min(salary)
    from employee
    where dno = ( select dno from employee where ename='SMITH' );

--4. �μ��� �ּҿ����� �������� �ּҿ����� 1000 �̻��� �͸� ����ϼ���.
    select min(salary)
    from employee
    group by dno
    having min(salary) >= 1000;

--5.  �μ��� ������ �հ谡 9000 �̻�͸� ���
    select sum(salary)
    from employee
    group by dno
    having sum(salary) >= 9000;

--6.  �μ��� ������ ����� 2000 �̻� ���
    select round(avg(salary),2)
    from employee
    group by dno
    having round(avg(salary),2) >= 2000;

--7. ������ 1500 ���ϴ� �����ϰ� �� �μ����� ������ ����� ���ϵ� ������ ����� 2500�̻��� �͸� ��� �϶�.
    select round(avg(salary),2)
    from employee
    where salary > 1500
    group by dno
    having round(avg(salary),2) >= 2500;

--8. sub query - �μ����� �ּ� �޿��� �޴� ������� �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���.
    select ename, salary, job, dno
    from employee
    where salary in (select min(salary) from employee group by dno);

--9. sub query - ��ü ��� �޿����� ���� �޴� �������  �̸��� �޿��� ��å�� �μ���ȣ�� ����ϼ���.
    select ename, salary, job, dno
    from employee
    where salary > ( select avg(salary) from employee );

--10. sub query - �޿��� ��� �޿����� ���� ������� �����ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���� �������� �����Ͻÿ�.
    select eno, ename, salary
    from employee
    where salary > ( select avg(salary) from employee )
    order by salary asc;