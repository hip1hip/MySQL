/*
*/
SELECT ename , LENGTH(ename)  -- AVG(sal), SUM(sal), MAX(sal) , MIN(sal)
FROM emp
WHERE deptno = 20;
-- LENGTH 단일행으로 갯수가 맞지만 AVG 같은 다중행은 행이 달라짐으로 오류 

SELECT  AVG(comm), AVG(IFNULL(comm,0)) , SUM(IFNULL(comm,0)) / COUNT(*)  , SUM(comm)/COUNT(*)  
-- 앞에 껀 4명분의 평균 , 뒤에껀 모든사람 14명으로 나눈값이라서 다름 
FROM emp;


SELECT COUNT(DISTINCT job)
FROM emp; 

SELECT MIN(hiredate) , MAX(hiredate)
FROM emp;

SELECT deptno , avg(sal) , MAX(sal) , MIN(sal)
FROM emp
group by deptno;  -- 부서별 평균 급여 

SELECT job, SUM(sal)
FROM emp 
GROUP BY job;

SELECT YEAR(hiredate) , COUNT(*)
FROM emp 
group by year(hiredate)
ORDER BY YEAR(hiredate);

SELECT deptno , job , COUNT(*)
FROM emp
GROUP BY deptno , job 
ORDER BY deptno ASC;

SELECT deptno, job , SUM(sal)
FROM emp 
GROUP BY deptno , job
WITH ROLLUP;  -- 종 합계가 얼만지 나옴 

-- 카티션 
SElECT  emp.ename , emp.sal , dept.deptno , dept.loc , salgrade.grade
FROM emp CROSS JOIN dept CROSS JOIN salgrade;

SELECT ename , d.deptno , loc 
FROM dept d, emp e
WHERE d.deptno = e.deptno AND ename = 'SMITH';

SELECT deptno
FROM emp 
WHERE ename ='SMITH';

SELECT loc 
FROM dept
WHERE deptno = 20;


SELECT ename , loc
-- FROM emp NATURAL JOIN dept
-- FROM emp INNER JOIN dept USING(deptno)
FROM emp JOIN dept ON(emp.deptno = dept.deptno)
WHERE  ename = 'SMITH';


SELECT city.name, city.Population, country.IndepYear, countrylanguage.Language
FROM city JOIN country ON (city.countrycode = country.code)
	JOIN countrylanguage ON(country.code = countrylanguage.CountryCode) 
WHERE city.name = 'SEOUL';

SELECT  ename, sal , grade
FROM emp, salgrade
WHERE sal BETWEEN losal AND hisal;


SELECT emp.ename , emp.empno , dept.dname , dept.loc
FROM emp RIGHT OUTER JOIN dept ON(emp.deptno = dept.deptno);
-- FROM emp INNER JOIN dept ON(emp.depno = dept.deptno);


CREATE TABLE emp1
AS
SELECT * FROM emp;

INSERT INTO emp1(empno,ename, sal, job,deptno)
VALUES(8282, 'JACK',3000, 'ANALYST',50);



SELECT e.ename,e.job,e.sal,d.loc,d.dname
FROM emp1 e LEFT OUTER JOIN dept d
ON(e.deptno=d.deptno);


SELECT mgr
FROM emp
WHERE ename = 'SMITH'; -- 7902

SELECT ename 
FROM emp
WHERE empno = 7902; -- FORD 

-- self join
SELECT CONCAT(worker.ename, '의 관리자 이름은', manager.ename, '입니다.')
FROM emp worker JOIN emp manager
ON worker.mgr = manager.empno;
-- WHERE employee.ename = 'SMITH'; 



   SELECT job,deptno
    FROM emp
    WHERE sal>=3000
   UNION ALL
   SELECT job,deptno
    FROM emp
    WHERE deptno=10;


-- 사번 7566의 급여보다 많이 받는 사원의 이름
SELECT sal FROM emp WHERE empno = 7566; -- 2975.00
SELECT ename 
FROM emp 
WHERE sal > (SELECT sal FROM emp WHERE empno = 7566);

-- SMITH는 어디서 근무해?
SELECT deptno 
FROM emp 
WHERE ename = 'SMITH';

SELECT loc 
FROM dept 
WHERE deptno = (SELECT deptno 
				FROM emp 
				WHERE ename = 'SMITH');


   -- 부서에서 최소 급여를 받는 사원
-- IN(1300.00,800.00,950.00)
SELECT ename, deptno , sal 
FROM emp 
WHERE sal IN(SELECT   MIN(sal)
			FROM emp 
			GROUP BY deptno);







