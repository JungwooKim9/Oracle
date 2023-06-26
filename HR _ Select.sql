/* Select 문 */

/* 테이블의 모든 컬럼을 출력 */

select * from Employee;     -- 사원 정보가 저장된 테이블

select * from Department;   -- 사원에 대한 부서 정보가 저장

select * from Salgrade;     -- 연봉에 대한 등급이 저장됨

/* EMPLOYEE 테이블의 칼럼(필드) 구조 */
    /*
        ENO: 사원번호
        ENAME: 사원명
        JOB: 직책
        MANAGER: 직급 상사 (사수)
        HIREDATE: 입사년원일
        SALARY: 연봉
        COMMITSSION: 보너스
        DNO: 부서번호
    */
    
    /* DEPARTMENT 테이블의 칼럼(필드) 구조 */
    /*
    DNO: 부서번호
    DNAME: 부서명
    LOC: 부서위치
    */
    
    /* SALGRADE 테이블의 칼럼(필드) 구조 */
    /*
    GRADE: 등급
    LOSAL: 최소 월급
    HISAL: 최대 월급
    */
    
    /* SELECT 쿼리: 출력하라 */
    
    SELECT 컬럼명
    from 테이블명[뷰]
    WHERE 조건
    GROUP BY 그룹핑할컬럼
    HAVING 조건(그룹핑한 결과의 조건)
    ORDER BY 컬럼명(정렬할 컬럼명)
    
    /* 기본 Select */
    -- 모든 컬럼 출력하기
    select * from employee;
    
    -- 특정 컬럼만 출력하기
    select eno, ename, salary
    from employee;
    
    -- 컬럼을 여러번 출력 할 수 있다. 컬럼에 연산을 적용할 수 있다.
    select ename, salary, salary + 100, hiredate, salary * 2
    from employee;
    
    -- 컬럼에 별칭 적용하기,   원본이름 as 별칭이름
    select ename as 이름, salary as 월급, salary + 100 as "연봉+100", salary * 2 as "월급의 2배"
    from employee;
    
    -- as는 생략할 수 있다.
    select ename 이름, salary 월급, salary + 100 "연봉+100", salary * 2 "월급의 2배"
    from employee;
    
    -- WHERE 조건 사용하기
    select * from employee
    
    -- 이름이 JAMES인 사원의 이름과 직책, 입사월, 부서번호 출력 하기
    -- SELECT, select, FROM, from, WHERE, where 다 가능
    -- 컬럼에 저장된 값을 가져올 때 대소문자를 구분함.
    
    select ename 이름, job 직책, hiredate 입사년원일, dno 부서번호
    from employee
    where ename = 'JAMES';
    
    -- where 절에서 연산자 사용: or, and
    select *
    from employee
    where ename = 'JAMES' or ename = 'SMITH';
    
    -- where 절에서 in 연산자 사용
    select *
    from employee
    where ename in ('JAMES', 'SMITH');
    
    -- where 절에서 비교 연산자 사용 하기: >, <, >=, <=
    -- 연봉이 1500 이상인 사용자만 출력
    select *
    from employee
    where salary >= 1500 ;
    
    -- 월급이 1500 이상이고 부서가 30인 사원의 정보를 출력
    select *
    from employee
    where salary >= 1500 and dno = 30;
    
    -- 테이블의 컬럼의 자료형 및 테이블 구조 확인
    desc employee;
    
    -- NOMBER: Oracle에서 정수, 실수
    /*
        NUMBER(4): 정수: 4자리까지만 넣을 수 있다.
        NUMBER(7,2): 실수(전체 7자리, 소수점 이하 2자리)
        
        CHAR(10): 문자 10byte     <== 자릿수를 알 수 있는 경우
            varchar2 보다 성능이 빠르다. 하드 공간 낭비가 있다.
            주민번호(13), 비밀번호 4자리만 들어간다.
            
        VARCHAR2(10): 문자 10byte     <== VARCHAR2를 사용, 자릿수를 알 수 없는 경우
            char 보다 성능은 떨어지지만 하드 공간을 낭비하지 않는다.
            
        DATA: 날짜를 저장하는 데이터 타입
    */
    
    -- 테이블 구조 확인
    desc employee;
    
    select * from employee;
    
    -- NUMBER: 정수, 실수, 값을 가져올 때 ''를 붙이면 안됨
    -- CHAR, VARCHAR2, DATE 값을 가져올 때 ''를 붙여야함.
    
    -- 직책이 영업 사원(SALESMAN)이고 월급이 1500이상 3000 미만인 사원의 이름만 출력해보기
     select *
     from employee
     where job = 'SALESMAN' and (SALARY >= 1500 and SALARY < 3000);
     
     -- null을 검색: 주의: =를 사용하면 안됨, is null
        -- null: 0이 아니고 비어있는 상태
        
    -- 보너스(commisstion)가 없는 사원 정보를 출력: null이 아닌 것만 검색
    select *
    from employee
    where commission is not null;
    
    /* 상사(사수) MANAGER가 없는 사원 정보 출력 */
    select * from employee;
    
    select * from employee;
    
    select *
    from employee
    where manager is null;
    
    /* 날짜 검색 하기 */
    -- 입사 날짜가 81/02/20에 입사한 사원의 이름과 직책과 월급을 출력
    select ename as 이름, job as 직책, salary as 월급, hiredate as 입사일
    from employee
    where hiredate = '81/02/20';
    
    -- 81년도에 입사한 사용자만 출력
    select * from employee;
    select *
    from employee
    where hiredate >= '81/01/01' and hiredate <= '81/12/31';    -- 날짜 컬럼: date
    
    -- where에서 Like 연산자 사용하기   <== 컬럼의 특정 단어를 검색할 때 사용: 게시판, 이름, 글내용, 날짜로 검색
        -- 문자열의 단어를 검색할 때 사용
        -- 와일드 카드 식별자 사용: % 어떤 글자가 와도 상관 없다.
        
    -- 이름이 A로 시작되는 사원을 검색
    select *
    from employee
    where ename like 'A%';
    
    select *
    from employee
    where hiredate like '81%';
    
    -- 직책(job) 컬럼에서 AG라는 단어가 들어간 사원 정보를 출력
    select *
    from employee
    where job like '%AG%';
    
    /* 중복을 제거 해서 출력 하기: DISTINCT, 다른 컬럼이 지정되면 오류 발생, 단일 컬럼에서 사용 */
    
    -- 우리 회사의 존재하는 직책을 출력
    select job
    from employee;
    
    -- 우리 회사의 존재하는 부서를 출력
    select dno
    from employee;