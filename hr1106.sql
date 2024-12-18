-- employees 복사
create table emp03
as
select *from employees;

-- 모든 사원의 부서번호를 30번으로 수정하자
select * from emp03;
update emp03 set department_id = 30;
rollback;

-- 모든 사원의 급여를 10% 인상한다
update emp03 set salary = salary * 1.1; 
rollback;

-- 입사일을 오늘로 수정한다.
update emp03 set hire_date = sysdate;
rollback;

-- 부서번호가 10번인 사원의 부서번호를 30번으로 수정
update emp03 set department_id = 30 where department_id= 10;

-- 급여가 3000 이상인 사원만 급여를 10% 인상
update emp03 set  salary = salary * 1.1 where  salary >= 3000;

-- 2007년에 입사한 사원의 입사일을 오늘로 수정
update emp03 set hire_date = sysdate where substr(hire_date,1,2)= '07';
rollback;

-- 이름이 Susan의 부서번호는 20번으로, 직급은 FI_MGT
UPDATE EMP03 SET DEPARTMENT_ID = 20, JOB_ID = 'FI_MGR' WHERE UPPER(FIRST_NAME) = UPPER('Susan');
select * from emp03 where first_name = 'Susan';

-- LAST_NAME이 Russell인 사원의 급여를 17000로, 커미션 비율이 0.45로 인상된다.
update emp03 set salary = 17000, commission_pct = 0.45 where upper(LAST_NAME) = upper('Russell');

-- 30번 부서를 삭제
delete from emp03 where department_id=30;
select * from emp03 where department_id = 30;

-- 테이블  생성
CREATE TABLE MYCUSTOMER(
    code VARCHAR2(7),
    name VARCHAR2(10) CONSTRAINT MYCUSTOMER_NAME_NN NOT NULL,
    gender CHAR(1) NOT NULL,
    birth VARCHAR2(8)NOT NULL,
    phone VARCHAR2(16)
);

ALTER TABLE MYCUSTOMER ADD CONSTRAINT MYCUSTOMER_code_PK PRIMARY KEY(code);
ALTER TABLE MYCUSTOMER ADD CONSTRAINT MYCUSTOMER_gender_CK CHECK(gender IN('M','W'));
ALTER TABLE MYCUSTOMER ADD CONSTRAINT MYCUSTOMER_PHONE_UK UNIQUE(PHONE);
DESC MYCUSTOMER;

INSERT INTO MYCUSTOMER VALUES ('2017108','박승대','M','19711430','010-2580-9919');
INSERT INTO MYCUSTOMER VALUES ('2019302','전미래','W','19740812','010-8864-0232');
SELECT * FROM MYCUSTOMER;
SELECT * FROM CUSTOMER;
DESC CUSTOMER;

-- 제약조건 검색기능(반드시 알아둘것)
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'CUSTOMER';
SELECT * FROM USER_TABLES;
SELECT * FROM user_cons_columns WHERE TABLE_NAME = 'CUSTOMER';
ALTER TABLE CUSTOMER DROP CONSTRAINT CUSTOMER_EMAIL_UK;
ALTER TABLE CUSTOMER DROP CONSTRAINT CUSTOMER_GENDER_CK;


-- MERGE  MYCUSTOMER - > CUSTOMER 병합을진행하는데 없으면 INSERT, 있으면 UPDATE
MERGE INTO CUSTOMER C
    USING MYCUSTOMER M
    ON (C.CODE = M.CODE)
    WHEN MATCHED THEN
        UPDATE SET C.NAME = M.NAME, C.GENDER = M.GENDER, C.BIRTH = M.BIRTH, C.PONE = M.PHONE 
    WHEN NOT MATCHED THEN
        INSERT (C.CODE,C.NAME,C.GENDER,C.BIRTH, C.PONE) values(M.CODE,M.NAME,M.GENDER,M.BIRTH, M.PHONE);

SELECT * FROM CUSTOMER;
SELECT * FROM MYCUSTOMER;
UPDATE MYCUSTOMER SET NAME = '박승우' WHERE CODE = '2017108';

-- 두 테이블을 관계설정하기
CREATE TABLE DEPT01(
    NO VARCHAR2(8),
    NAME VARCHAR2(10) NOT NULL,
    REGION VARCHAR2(10)
);
ALTER TABLE DEPT01 ADD CONSTRAINT DEPT01_NO_PK PRIMARY KEY(NO);
CREATE TABLE MEMBER(
    NO NUMBER(8),
    NAME VARCHAR2(10) NOT NULL,
    JOB_ID VARCHAR2(10),
    DEPT_NO VARCHAR2(8)
    );
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_NO_PK PRIMARY KEY(NO);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_DEPT_NO_FK FOREIGN KEY(DEPT_NO) REFERENCES DEPT01(NO);

-- TEST
CREATE TABLE DEPT02(
    DEPT_NO_NUMBER,
    DEPT_NAME VARCHAR2(10) NOT NULL,
    LOCATION VARCHAR2(10)
);
ALTER TABLE DEPT02 ADD CONSTRAINT DEPT02_NO_PK PRIMARY KEY(DEPT_N0);

INSERT INTO DEPT02 VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT02 VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT02 VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT02 VALUES(40,'OPERATIONS','BOSTON');

CREATE TABLE MEMBER(
    MEMBER_NO NUMBER,
    MEMBER_NAME VARCHAR2(10) NOT NULL,
    JOB_ID VARCHAR2(10),
    DEPT_NO VARCHAR2(8)
);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_NO_PK PRIMARY KEY(NO);
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER0_DEPT_NO_FK FOREIGN KEY(DEPT_NO) REFERENCES DEPT02(NO);

INSERT INTO DEPT02 VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT02 VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT02 VALUES(30,'SALES','CHICAGO'); 
INSERT INTO DEPT02 VALUES(40,'OPERATIONS','BOSTON');
SELECT * FROM DEPT02;

INSERT INTO MEMBER VALUES(7499,'ALLEN','SALESMAN',30);
INSERT INTO MEMBER VALUES(7566,'JONES','MANAGER',40);
SELECT * FROM MEMBER;