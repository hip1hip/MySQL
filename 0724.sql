/*
	date : 2024-07-24
*/
SELECT * FROM dept;

INSERT INTO dept
VALUES(50, 'Dewign' , 'Busan');

INSERT INTO dept(deptno , dname , loc) VALUES(60, 'Development', 'Taeheon');

INSERT INTO dept(deptno, dname , loc ) VALUES(70, NULL,'Inchon'); -- 명시적 널 

INSERT INTO dept(deptno, loc) VALUES(80, 'SEoul'); -- 묵시적 널

INSERT INTO dept(dname, loc) VALUES('Account' , 'Yongin'); -- 프라이머리 키인 부서넘버를 안넣었음. 

INSERT INTO emp(empno , deptno) VALUES(9999,99); -- 제약조건 오류 , deptno 이 없는 번호 

INSERT INTO emp(empno , ename , hiredate , deptno) VALUES (9999,'Jimin' , NOW() , 80); -- 오류 now 는 시분초까지 나옴 , 형식이 맞지 않음 
 
INSERT INTO emp(empno , ename , hiredate , deptno) VALUES (9998,'Jimin' , CURDATE() , 80); 


CREATE TABLE emp_copy 
AS
SELECT empno , ename , sal , hiredate 
FROM emp 
WHERE deptno = 10;  -- 카피 하는거임. 


CREATE TABLE emp_copy1
AS
SELECT *
FROM emp 
WHERE 0 = 1;  -- 테이블의 구조만 복사 , 데이터는 복사가 안됨 , 말이 안되는 조건을 쓰면! 

SELECT * FROM emp_copy1;

INSERT INTO emp_copy1(empno ,ename) VALUES(1111, '한지민');

SELECT *FROM dept;

UPDATE dept SET dname = 'FINANCE' WHERE deptno = 70;

UPDATE dept SET dname = 'HR' , loc = 'Busan' WHERE deptno = 70;










