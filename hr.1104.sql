--hr resource 있는 테이블정보
select * from tab;
--employees 테이블 구조
desc employees;
-- employees 속에 들어있는 레코드 확인
select * from employees;
-- departments 테이블 객체(레코드=인스턴스)를 확인
select * from departments;
-- departments 구조
desc depertments;
-- department_id, department_name 보임
select department_id, department_name from departments;
--필드명에 별칭사용하기
select department_id as "부서번호", department_name as "부서명" from departments;
select department_id as DEPT_NO, department_name as DEPT_NAME from departments;
select department_id as "DEPT NO", department_name as "DEPT NAME" from departments;
-- + ||
select '5' + 5 from dual;
select '5' || 5 from dual;
-- 문자열을 기능을 이용해서 필드명을 보여주기
select first_name, job_id from employees;
select first_name || '의 직급은' || job_id || '입니다' as data from employees;
-- 중복되지 않게 보여주기 distinct
select distinct job_id from employees;
--연봉을 3000 이상 받는 사람 정보
select * from employees where salary >= 3000;
desc employees;
--2008년 이후에 입사한 직원조사
select * from employees where hire_date >= '2008/01/01';
select * from employees where TO_CHAR(hire_date,'YYYY/MM/DD') >= '2008/01/01';
select * from employees where hire_date >= TO_DATE('2008/01/01','YYYY/MM/DD HH24:MI:SS');
--AND, BETWEEN a AND b 
SELECT * FROM EMPLOYEES WHERE SALARY >= 2000 AND SALARY <= 3000;
SELECT * FROM EMPLOYEES WHERE SALARY BETWEEN 2000 AND 3000;
-- OR, IN( , )직원번호가 67 이거나 101 이거나 184인 사원
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID = 67 OR EMPLOYEE_ID = 101 OR EMPLOYEE_ID = 184;
SELECT * FROM EMPLOYEES WHERE EMPLOYEE_ID IN(67, 101, 184);
--NULL 연산, 비교, 할당 안된다.
SELECT 100 + NULL FROM DUAL;
desc employees;
SELECT * FROM EMPLOYEES WHERE COMMISSION_PCT = NULL;
SELECT * FROM EMPLOYEES;
SELECT EMPLOYEE_ID FIRST_NAME, COMMISSION_PCT FROM EMPLOYEES ORDER BY COMMISSION_PCT DESC;
-- ORDER BY ASC,DESC 사번을 기준으로 오름차순 정렬
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMPLOYEES ORDER BY EMPLOYEE_ID DESC;
--GROUP BY
SELECT DEPARTMENT_ID, SUM(SALARY) FROM EMPLOYEES
GROUP BY DEPARTMENT_ID HAVING DEPARTMENT_ID = 30;

SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEES WHERE DEPARTMENT_ID >= 70;
SELECT DEPARTMENT_ID, SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID >= 70;
SELECT DEPARTMENT_ID, MAX(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID >= 70 GROUP BY DEPARTMENT_ID;
SELECT DEPARTMENT_ID, MAX(SALARY), MIN(SALARY),SUM(SALARY), ROUND(AVG(SALARY),1), 
    COUNT(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID >= 70 GROUP BY DEPARTMENT_ID HAVING SUM(SALARY) >= 30000;
SELECT MAX(SALARY), ROUND(AVG(SALARY),1), SUM(SALARY) FROM EMPLOYEES;