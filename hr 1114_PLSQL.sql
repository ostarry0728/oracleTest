-- PL/SQL
-- 내용을 employee 'Susan'이름을 갖는 사원의 사원번호와 사원명과, 부서번호를 출력하시오.
DECLARE
    VEMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
    VFIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
    VLAST_NAME EMPLOYEES.LAST_NAME%TYPE;
    VDEPARTMENT_ID EMPLOYEES.DEPARTMENT_ID%TYPE;
BEGIN
    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID 
    INTO VEMPLOYEE_ID, VFIRST_NAME, VLAST_NAME, VDEPARTMENT_ID
    FROM EMPLOYEES WHERE FIRST_NAME = 'Susan'; 
    
    DBMS_OUTPUT.PUT_LINE(VEMPLOYEE_ID || '  ,  ' || VFIRST_NAME || '  ,  ' || VLAST_NAME || '  ,  ' || VDEPARTMENT_ID);
END;
/

SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, DEPARTMENT_ID FROM EMPLOYEES WHERE FIRST_NAME = 'Susan';