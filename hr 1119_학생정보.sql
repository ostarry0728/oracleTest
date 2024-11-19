---- employees
--SELECT * FROM EMPLOYEES;
--desc employees;
--
---- books
--DROP TABLE books;
--
--CREATE TABLE books (
--    id number(4), 
--    title varchar2(50), 
--    publisher varchar2(30), 
--    year varchar2(10), 
--    price number(6)
--);
--ALTER TABLE BOOKS ADD CONSTRAINT BOOKS_ID_PK PRIMARY KEY(ID);
--
--CREATE SEQUENCE BOOKS_ID_SEQ
--START WITH 1
--INCREMENT BY 1;
--
--DESC BOOKS;
--SELECT * FROM user_cons_columns WHERE TABLE_NAME = 'BOOKS';
--
--INSERT INTO books VALUES (BOOKS_ID_SEQ.nextval, 'Operating System Concepts', 'Wiley', '2003',30700);
--INSERT INTO books VALUES (BOOKS_ID_SEQ.nextval, 'Head First PHP and MYSQL', 'OReilly', '2009', 58000);
--INSERT INTO books VALUES (BOOKS_ID_SEQ.nextval, 'C Programming Language', 'Prentice-Hall', '1989', 35000);
--INSERT INTO books VALUES (BOOKS_ID_SEQ.nextval, 'Head First SQL', 'OReilly', '2007', 43000);
--commit;
--
--SELECT * FROM BOOKS;
--
--DELETE FROM BOOKS WHERE ID = 5;
--
--ROLLBACK;
--
--UPDATE BOOKS SET TITLE = 'KKK', PUBLISHER = 'JAVA JAVA JAVA', YEAR = '2024', PRICE = '33000' WHERE ID = 3;
--commit;

-- 학생 정보
-- employees
SELECT * FROM EMPLOYEES;
desc employees;

-- students
DROP TABLE students;

CREATE TABLE students (
    id number(4), 
    title varchar2(50), 
    publisher varchar2(30), 
    year varchar2(10), 
    price number(6)
);
ALTER TABLE students ADD CONSTRAINT students_ID_PK PRIMARY KEY(ID);

CREATE SEQUENCE STUDENT_ID_SEQ
START WITH 1
INCREMENT BY 1;

DESC BOOKS;
SELECT * FROM user_cons_columns WHERE TABLE_NAME = 'BOOKS';

INSERT INTO books VALUES (STUDENT_ID_SEQ.nextval, '1', '5', '홍길동', 'male');
INSERT INTO books VALUES (STUDENT_ID_SEQ.nextval, '1', '5', '홍길동', 'male');
INSERT INTO books VALUES (STUDENT_ID_SEQ.nextval, '1', '5', '홍길동', 'male');
INSERT INTO books VALUES (STUDENT_ID_SEQ.nextval, '1', '5', '홍길동', 'male');
commit;

SELECT * FROM BOOKS;

DELETE FROM BOOKS WHERE ID = 5;

ROLLBACK;

UPDATE BOOKS SET TITLE = 'KKK', PUBLISHER = 'JAVA JAVA JAVA', YEAR = '2024', PRICE = '33000' WHERE ID = 3;
commit;