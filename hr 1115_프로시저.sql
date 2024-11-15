-- EMP01 테이블 복사

SELECT * FROM USER_TABLES WHERE TABLE_NAME = 'EMP01';
DROP TABLE EMP01;
CREATE TABLE EMP01
AS
SELECT  * FROM EMPLOYEES WHERE 1 = 1;
SELECT * FROM EMP01;

-- 부서별로 월급을 인상하는 프로그램이다. 10번부서 전원 10% 인상, 20번부서는 전원 20% 인상, 나머지는 동결.
CREATE OR REPLACE PROCEDURE EMP01_PROC(VDEPTNO IN EMPLOYEES.DEPARTMENT_ID%TYPE)
IS
BEGIN
    IF VDEPTNO = 10 THEN 
        UPDATE EMP01 SET SALARY = SALARY * 1.1 WHERE DEPARTMENT_ID = VDEPTNO;
        DBMS_OUTPUT.PUT_LINE(VDEPTNO ||'부서는 전원 10% 인상했습니다.');
    ELSIF VDEPTNO = 20 THEN
        UPDATE EMP01 SET SALARY = SALARY * 1.2 WHERE DEPARTMENT_ID = VDEPTNO;
        DBMS_OUTPUT.PUT_LINE(VDEPTNO ||'부서는 전원 20% 인상했습니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE(VDEPTNO ||'부서는 전원동결입니다.');
    END IF;
END;
/

SELECT * FROM EMP01 WHERE DEPARTMENT_ID = 10;

EXECUTE EMP01 PROC(10);

























































































