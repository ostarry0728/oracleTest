-- PL/SQL
-- 내용을 employee 테이블에서 임의의 부서번호를 랜덤으로 생성한뒤, 해당된 부서 번호 최고 연봉을 출력한뒤, 평가(낮음, 높음, 중간...)
DECLARE
    -- 부서번호, 최고연봉 선언
    VNO NUMBER(4);
    VTOP_SALARY NUMBER(12,2);
    VRESULT VARCHAR2(20);
BEGIN
    -- 임의의 부서번호 생성 (RANDOM)
    VNO := ROUND(DBMS_RANDOM.VALUE(10,110),-1);
    SELECT SALARY INTO VTOP_SALARY
    FROM (SELECT SALARY FROM EMPLOYEES WHERE DEPARTMENT_ID = VNO ORDER BY SALARY DESC)
    WHERE ROWNUM = 1;
    -- 평가내리기 1~5000 낮음, 5000~10000 중간, 10000~20000 높음, 20000~ 최고, 없으면 예외처리
    IF(VTOP_SALARY BETWEEN 1 AND 5000)THEN
       VRESULT := '낮음';
    ELSIF(VTOP_SALARY BETWEEN 5000 AND 10000)THEN
        VRESULT := '중간';
    ELSIF(VTOP_SALARY BETWEEN 10000 AND 20000)THEN
        VRESULT := '높음';
    ELSE
        VRESULT := '최고';
    END IF;
        
    DBMS_OUTPUT.PUT_LINE('부서번호: '|| VNO);
    DBMS_OUTPUT.PUT_LINE('최고: '|| VTOP_SALARY);
    DBMS_OUTPUT.PUT_LINE('최고연봉평가: '|| VRESULT);
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE( VNO ||' 부서에는 해당되는 사원이 없습니다.');
END;
/

--(SELECT SALARY, DEPARTMENT_ID, FIRST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID = 50 ORDER BY SALARY DESC);  
--SELECT ROWNUM, SALARY DEPERTMENT_ID, FIRST_NAME 
-- (SELECT SALARY, DEPARTMENT_ID, FIRST_NAME FROM EMPLOYEES WHERE DEPARTMENT_ID = 50 ORDER BY SALARY DESC)
--WHERE ROWNUM <= 1;