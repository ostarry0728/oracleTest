-- 순위함수 RANK(), DENSE_RANK(), ROWNUM
-- ROWNUM으로 구하는 순위(공동순위는 없음, 게시판, 공지사항, 자료실 등등에서 쓰임)
DROP TABLE EMP02;
CREATE TABLE EMP02
AS
SELECT * FROM EMPLOYEES WHERE 1 = 1;
SELECT * FROM EMP02;
SELECT ROWNUM, FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC;
SELECT ROWNUM, FIRST_NAME, SALARY FROM EMPLOYEES;
SELECT ROWNUM, FIRST_NAME, SALARY FROM (SELECT FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC);
-- 공동순위를 구하는 방법 ( RANK(), DENSE_RANK() )
SELECT RANK() OVER(ORDER BY SALARY DESC) AS RANK, FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC;

SELECT ROWNUM, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_RANK, FIRST_NAME, SALARY
FROM (SELECT FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC) ORDER BY SALARY DESC;

SELECT ROWNUM,RANK() OVER(ORDER BY SALARY DESC) AS RANK, DENSE_RANK() OVER(ORDER BY SALARY DESC) AS DENSE_RANK, FIRST_NAME, SALARY
FROM (SELECT FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC) ORDER BY SALARY DESC;

-- 중복순위 제거
SELECT DEPARTMENT_ID, RANK() OVER(PARTITION BY DEPARTMENT_ID ORDER BY SALARY DESC, COMMISSION_PCT DESC, DEPARTMENT_ID DESC) AS RANK, 
FIRST_NAME, SALARY , COMMISSION_PCT 
FROM EMPLOYEES ORDER BY DEPARTMENT_ID, SALARY DESC, COMMISSION_PCT DESC;

-- ROWNUM 규칙 중요(조심)
SELECT ROWNUM, E.* FROM EMPLOYEES WHERE ROWNUM BETWEEN 11 AND 20;
SELECT ROWNUM, E.* FROM EMPLOYEES E;

SELECT RNUM, FIRST_NAME, SALARY, DEPARTMENT_ID FROM (SELECT ROWNUM AS RNUM, E. * FROM EMPLOYEES E WHERE ROWNUM <= 110)
WHERE RNUM >= 100;