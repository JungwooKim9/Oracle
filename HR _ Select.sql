/* Select �� */

/* ���̺��� ��� �÷��� ��� */

select * from Employee;     -- ��� ������ ����� ���̺�

select * from Department;   -- ����� ���� �μ� ������ ����

select * from Salgrade;     -- ������ ���� ����� �����

/* EMPLOYEE ���̺��� Į��(�ʵ�) ���� */
    /*
        ENO: �����ȣ
        ENAME: �����
        JOB: ��å
        MANAGER: ���� ��� (���)
        HIREDATE: �Ի�����
        SALARY: ����
        COMMITSSION: ���ʽ�
        DNO: �μ���ȣ
    */
    
    /* DEPARTMENT ���̺��� Į��(�ʵ�) ���� */
    /*
    DNO: �μ���ȣ
    DNAME: �μ���
    LOC: �μ���ġ
    */
    
    /* SALGRADE ���̺��� Į��(�ʵ�) ���� */
    /*
    GRADE: ���
    LOSAL: �ּ� ����
    HISAL: �ִ� ����
    */
    
    /* SELECT ����: ����϶� */
    
    SELECT �÷���
    from ���̺��[��]
    WHERE ����
    GROUP BY �׷������÷�
    HAVING ����(�׷����� ����� ����)
    ORDER BY �÷���(������ �÷���)
    
    /* �⺻ Select */
    -- ��� �÷� ����ϱ�
    select * from employee;
    
    -- Ư�� �÷��� ����ϱ�
    select eno, ename, salary
    from employee;
    
    -- �÷��� ������ ��� �� �� �ִ�. �÷��� ������ ������ �� �ִ�.
    select ename, salary, salary + 100, hiredate, salary * 2
    from employee;
    
    -- �÷��� ��Ī �����ϱ�,   �����̸� as ��Ī�̸�
    select ename as �̸�, salary as ����, salary + 100 as "����+100", salary * 2 as "������ 2��"
    from employee;
    
    -- as�� ������ �� �ִ�.
    select ename �̸�, salary ����, salary + 100 "����+100", salary * 2 "������ 2��"
    from employee;
    
    -- WHERE ���� ����ϱ�
    select * from employee
    
    -- �̸��� JAMES�� ����� �̸��� ��å, �Ի��, �μ���ȣ ��� �ϱ�
    -- SELECT, select, FROM, from, WHERE, where �� ����
    -- �÷��� ����� ���� ������ �� ��ҹ��ڸ� ������.
    
    select ename �̸�, job ��å, hiredate �Ի�����, dno �μ���ȣ
    from employee
    where ename = 'JAMES';
    
    -- where ������ ������ ���: or, and
    select *
    from employee
    where ename = 'JAMES' or ename = 'SMITH';
    
    -- where ������ in ������ ���
    select *
    from employee
    where ename in ('JAMES', 'SMITH');
    
    -- where ������ �� ������ ��� �ϱ�: >, <, >=, <=
    -- ������ 1500 �̻��� ����ڸ� ���
    select *
    from employee
    where salary >= 1500 ;
    
    -- ������ 1500 �̻��̰� �μ��� 30�� ����� ������ ���
    select *
    from employee
    where salary >= 1500 and dno = 30;
    
    -- ���̺��� �÷��� �ڷ��� �� ���̺� ���� Ȯ��
    desc employee;
    
    -- NOMBER: Oracle���� ����, �Ǽ�
    /*
        NUMBER(4): ����: 4�ڸ������� ���� �� �ִ�.
        NUMBER(7,2): �Ǽ�(��ü 7�ڸ�, �Ҽ��� ���� 2�ڸ�)
        
        CHAR(10): ���� 10byte     <== �ڸ����� �� �� �ִ� ���
            varchar2 ���� ������ ������. �ϵ� ���� ���� �ִ�.
            �ֹι�ȣ(13), ��й�ȣ 4�ڸ��� ����.
            
        VARCHAR2(10): ���� 10byte     <== VARCHAR2�� ���, �ڸ����� �� �� ���� ���
            char ���� ������ ���������� �ϵ� ������ �������� �ʴ´�.
            
        DATA: ��¥�� �����ϴ� ������ Ÿ��
    */
    
    -- ���̺� ���� Ȯ��
    desc employee;
    
    select * from employee;
    
    -- NUMBER: ����, �Ǽ�, ���� ������ �� ''�� ���̸� �ȵ�
    -- CHAR, VARCHAR2, DATE ���� ������ �� ''�� �ٿ�����.
    
    -- ��å�� ���� ���(SALESMAN)�̰� ������ 1500�̻� 3000 �̸��� ����� �̸��� ����غ���
     select *
     from employee
     where job = 'SALESMAN' and (SALARY >= 1500 and SALARY < 3000);
     
     -- null�� �˻�: ����: =�� ����ϸ� �ȵ�, is null
        -- null: 0�� �ƴϰ� ����ִ� ����
        
    -- ���ʽ�(commisstion)�� ���� ��� ������ ���: null�� �ƴ� �͸� �˻�
    select *
    from employee
    where commission is not null;
    
    /* ���(���) MANAGER�� ���� ��� ���� ��� */
    select * from employee;
    
    select * from employee;
    
    select *
    from employee
    where manager is null;
    
    /* ��¥ �˻� �ϱ� */
    -- �Ի� ��¥�� 81/02/20�� �Ի��� ����� �̸��� ��å�� ������ ���
    select ename as �̸�, job as ��å, salary as ����, hiredate as �Ի���
    from employee
    where hiredate = '81/02/20';
    
    -- 81�⵵�� �Ի��� ����ڸ� ���
    select * from employee;
    select *
    from employee
    where hiredate >= '81/01/01' and hiredate <= '81/12/31';    -- ��¥ �÷�: date
    
    -- where���� Like ������ ����ϱ�   <== �÷��� Ư�� �ܾ �˻��� �� ���: �Խ���, �̸�, �۳���, ��¥�� �˻�
        -- ���ڿ��� �ܾ �˻��� �� ���
        -- ���ϵ� ī�� �ĺ��� ���: % � ���ڰ� �͵� ��� ����.
        
    -- �̸��� A�� ���۵Ǵ� ����� �˻�
    select *
    from employee
    where ename like 'A%';
    
    select *
    from employee
    where hiredate like '81%';
    
    -- ��å(job) �÷����� AG��� �ܾ �� ��� ������ ���
    select *
    from employee
    where job like '%AG%';
    
    /* �ߺ��� ���� �ؼ� ��� �ϱ�: DISTINCT, �ٸ� �÷��� �����Ǹ� ���� �߻�, ���� �÷����� ��� */
    
    -- �츮 ȸ���� �����ϴ� ��å�� ���
    select job
    from employee;
    
    -- �츮 ȸ���� �����ϴ� �μ��� ���
    select dno
    from employee;