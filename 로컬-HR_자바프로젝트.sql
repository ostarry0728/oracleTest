-- susan 부서아이디 보기
select department_id from employees where first_name = 'Susan';

-- 부서테이블에서 40번 부서명을 조회
select department_name from departments where department_id = 40;

-- susan이 소속되어 있는 부서명을 검색
select * from employees where first_name = 'Susan';
select * from departments where department_id = 40;

select E.first_name, D.department_name from departments D inner join employees E on D.department_id = E.department_id 
where upper(first_name) = upper('Susan');

-- 단일행은 비교, 크기, 연산이 가능
-- 다중행은 비교, 크기, 연산이 불가능 (IN = OR, ANY = 1개이상, ALL = 모두, EXISTS = 존재여부)
select department_id from employees where first_name = 'Susan';
select * from departments where department_id = 
(select department_id from employees where first_name = 'Susan');

-- EMPLOYEES 테이블에서 Lex와 같은 부서에 있는 모든 사원의 이름과
-- 입사일자(형식: 1981-11-17)를 출력하는 SELECT문을 작성
select department_id from employees where first_name = 'Lex';
select first_name, to_char(hire_date, 'yyyy-mm-dd') from employees 
where department_id = (select department_id from employees where first_name = 'Lex');

--
select * from employees 
where manager_id = (select employee_id from employees where manager_id is null);

-- 고용테이블에서 전체 연봉평균
select round(avg(salary)) as salary from employees group by department_id;

-- 전체 평균연봉보다 높은 직원 정보 출력
select * from employees where salary > (select round(avg(salary)) as salary from employees);
-- 다중행이면 비교 가능한지
select * from employees where exists (select round(avg(salary)) as salary from employees group by department_id);
select * from employees where 1 = 0;

-- 테이블 복사
drop table imsiTBL;
create table imsiTBL
as
select * from employees where 1 = 1;
select * from imsiTBL;
select * from user_constraints where table_name = upper('imsiTBL');

-- 월급이 13000 이상인 사람의 부서를 보여주시오.
select distinct department_id from employees where salary >= 13000;

select * from employees where department_id in (90, 80, 20);
select * from employees where department_id in 
(select * from employees where department_id from employees where salary >= 13000);


-- EMPLOYEES 테이블에서 Susan 또는 Lex 월급
select salary from employees where upper(first_name) = upper('Susan') or upper(first_name) = upper('Lex');

-- EMPLOYEES 테이블에서 Susan 또는 Lex 월급이 같은 직원의 이름, 업무, 급여를 출력(Susan과 Lex 제외)
select * from employees where salary in (17000, 6500)
and first_name <> 'Susan' and first_name <> 'Lex';

select * from employees where salary in (17000, 6500)
and  first_name not in ('Susan','Lex');

select * from employees where salary in 
(select salary from employees where upper(first_name) = upper('Susan') or upper(first_name) = upper('Lex'))
and first_name <> 'Susan' and first_name <> 'Lex';

-- 한 명 이상으로부터 보고를 받는다 = 나는 매니저로 등록이 되어있다. null = ceo
select distinct manager_id from employees where manager_id is not null or manager_id is null;
select distinct manager_id as "상사" from employees;

-- 한 명 이상으로부터 보고를 받을 수 있는 직원의 직원번호, 이름, 업무, 부서번호를 출력
select employee_id, first_name, job_id, department_id from employees 
where manager_id in (select distinct manager_id from employees);

select first_name, job_id from employees where department_id = 110;
select department_id from departments where department_name = 'Accounting';
select distinct job_id from employees where department_id = 110;

select first_name, job_id from employees 
where department_id = (select department_id from departments where department_name = 'Accounting')
and job_id in ('AC_MGR', 'AC_ACCOUNT');

select first_name, job_id from employees 
where department_id = (select department_id from departments where department_name = 'Accounting')
and job_id in (select distinct job_id from employees where department_id = 110);

-- exists
select * from employees where department_id = 10;

-- 테이블 복사
drop table emp02;
create table emp02
as
select employee_id first_name from employees;

select * from emp02;

-- 서브쿼리를 이용해서 데이터 복사
-- 구조만 복사 department 테이블 생성 (DEP01)

drop table DEP01;
create table DEP01
as
select * from departments where 1 = 0;

-- 내용을 서브쿼리를 이용해서 저장
INSERT INTO DEP01 (SELECT * FROM DEPARTMENTS);

-- UPDATA 서브쿼리를 활용한다
-- 부서 10번에 지역위치를 부서 40번 위치로 수정하시오.
UPDATE DEP01 SET LOCATION_ID = (2400) WHERE DEPARTMENT_ID = 10;
UPDATE DEP01 SET LOCATION_ID = (SELECT LOCATION_ID FROM DEPARTMENTS WHERE DEPARTMENT_ID = 40) 
WHERE DEPARTMENT_ID = 10;
SELECT LOCATION_ID FROM DEPARTMENTS WHERE DEPARTMENT_ID = 40;
SELECT * FROM DEPARTMENT;
--------------------------------------------------------------------------------------------------------------------------------------------------
SELECT * FROM EMPLOYEES;

-- 문제3
SELECT FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE JOB_ID = 'ST_MAN' AND DEPARTMENT_ID <> 20 
AND SALARY >(SELECT MIN(SALARY) FROM EMPLOYEES WHERE JOB_ID = 'ST_MAN');

-- 문제4
SELECT * FROM EMPLOYEES 
WHERE JOB_ID = (SELECT JOB_ID FROM EMPLOYEES WHERE FIRST_NAME = 'Valli')
  AND SALARY = (SELECT SALARY FROM EMPLOYEES WHERE FIRST_NAME = 'Valli') 
  AND FIRST_NAME != 'Valli';

-- 문제5
SELECT DEPARTMENT_ID, FIRST_NAME, SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE FIRST_NAME = 'Valli')
AND SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES 
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE FIRST_NAME = 'Valli'));
--------------------------------------------------------------------------------------------------------------------------------------------------
-- 사원의 급여 정보중 업무별 최소 급여를 받고 있는 사원의 성과 이름, 업무, 급여, 입사일을 출력하시오
-- 업무별 최소급여
select job_id, min(salary) from employees group by job_id;
select min(salary) from employees group by job_id;
select first_name, job_id, salary, hire_date from employees where job_id = '' and salary = '';
select first_name, job_id, salary, hire_date from employees where (job_id, salary) in (select job_id, min(salary) from employees group by job_id);



































