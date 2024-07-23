-- 1. 모든 사원에 대해 200$씩 급여차감을 계산한 후 출력결과를 새 열 "SAL-200"로 표시하는 SQL 문을 작성하시오.
SELECT sal-200 AS "SAL-200"
FROM emp;

-- 2. 모든 사원에 대해 사원의 이름, 급여 및 연간 총수입을 표시하는 SQL문을 작성하시오. 단 연간 
-- 총 수입은 년봉에 상여금 200$씩 합하여 출력해야 합니다.

SELECT ename , sal , (sal * 12 ) + 200
FROM emp ;

-- 3. 모든 사원에 대해 다음과 같은 출력이 나오도록SQL문을 작성하시오. 
SELECT CONCAT(ename, ' : 1 Month salary = ' , sal) AS "Monthly Salary"
FROM emp;

-- 4. 모든 사원에 대해 사번, 이름, 급여, 담당업무를 표시하되 각각 열이름을 한글로 출력하게 하는  SQL문을 작성하시오.
SELECT empno "사번" , ename "이름" , sal "급여" , job "담당업무"
FROM emp; 

-- 5. 모든 사원에 대해 사번, 이름, 급여, 보너스(comm), 보너스금액을 출력하는  SQL문을 
-- 작성하시오. 단 보너스금액은 실급여(급여와 보너스의 합)에 10%를 더해서 출력합니다.
SELECT empno, ename , sal , comm , (sal + IFNULL(comm,0)) * 1.1
FROM emp; 

-- 6. 부서에 대한 정보를 출력하되, 각 부서의 이름과 부서의 위치를 아래와 같은 형태로 출려하게 하는 SQL문을 작성하시오.
SELECT  concat(dname , 'is at', loc ) as "부서상세 정보"
FROM dept; 

-- 7
SELECT concat(ename , ' : 1 Year Salary', sal * 12 ) as "Annual Salary"
FROM emp;

-- 8
SELECT DISTINCT job
FROM emp;

-- 9 
SELECT DISTINCT deptno,  job 
FROM emp;

-- 10
SELECT empno , ename , sal * 12 as "년 봉" 
FROM emp;  

-- 11 1983년 이후에 입사한 사원의 사번 이름 입사일을 출력하시오 
SELECT empno,  ename , hiredate  
FROM emp
WHERE hiredate > '1983-01-01';
-- where hiredaye 'LIKE 1983%'

-- 12 
SELECT ename , sal , comm 
FROM emp 
WHERE sal < comm;

-- 13 
SELECT empno , ename , sal , mgr 
FROM emp
WHERE empno IN('7902', '7566' , '7788');

-- 14 
SELECT empno , ename  , mgr , deptno
FROM emp 
WHERE ename IN ('FORD' , 'ALLEN');

-- 15
SELECT empno, ename, job , sal 
FROM emp 
WHERE sal >= 1100 AND job = 'CLERK';

-- 16 
SELECT ename , job 
FROM emp
WHERE JOB NOT IN('CLERK' , 'MANAGER', 'ANALYST');

-- 17 ***********
SELECT ename , job , sal  
FROM emp 
WHERE job IN ('PRESIDENT' , 'SALESMAN') ;  

-- 18 
SELECT ename , job , sal  
FROM emp 
WHERE job IN ('PRESIDENT' , 'SALESMAN') AND sal >= 1500 ;  

-- 20
SELECT ename , sal, comm , sal + comm AS "총액"
FROM emp
WHERE comm IS NOT NULL 
ORDER BY comm ASC;

-- 21 
SELECT ename , sal , sal*1.13 as "보너스" , deptno 
FROM emp 
WHERE deptno = 10 ;

-- 22 
SELECT ename , empno , ((sal*11) + (sal*1.5)) as "연봉"
FROM emp 
WHERE deptno = 30;

-- 23 
SELECT ename , sal , ROUND(sal / (12 * 5), 1 ) AS "시간당임금"
FROM emp 
WHERE deptno = 20;

-- 24 
SELECT ename , sal , sal * 0.9 AS 실수령액 
FROM emp;

-- 25 
SELECT *
FROM dept; 

-- 26
SELECT  dname , loc 
FROM dept; 

-- 27
SELECT  ename , deptno 
FROM emp
where empno = 7788 ;

-- 28 
SELECT ename , sal , comm , sal + comm AS tot
FROM emp
WHERE comm IS NOT NULL
ORDER BY tot DESC;

-- 29
SELECT ename , sal , sal * 1.13 AS "보너스금액" , deptno
FROM emp 
WHERE deptno = 10;

-- 30
SELECT ename , deptno  , sal , (sal*11)+(sal*1.5) AS tot
FROM emp 
WHERE deptno =30; 

-- 31 
SELECT ename , sal , ROUND(sal / (12 * 5), 1) AS 시간당임금
FROM emp 
WHERE  deptno = 20; 

-- 32 
SELECT empno , ename , sal
FROM emp 
WHERE deptno =10 ;

-- 33
SELECT ename , hiredate , deptno
FROM emp 
WHERE empno = 7369; 

-- 34 
SELECT *
FROM emp 
WHERE ename = 'ALLEN'; 

-- 35 
SELECT ename , deptno , sal 
FROM emp 
WHERE hiredate = '1981-09-08' ;

-- 36 
SELECT *
FROM emp 
WHERE job != 'MANAGER';

-- 37 
SELECT *
FROM emp 
WHERE hiredate >= '1981-04-02' ;

-- 38 
SELECT ename , sal , empno 
FROM emp 
WHERE sal > 800;

-- 40 
SELECT *
FROM emp 
WHERE ename LIKE 'k%';

-- 41 
SELECT *
FROM emp 
WHERE hiredate < '1981-12-09'; 

-- 42 
SELECT empno , ename
FROM emp
WHERE empno <= 7698 ;

-- 43 
SELECT ename , sal , deptno, hiredate
FROM emp
WHERE hiredate BETWEEN '1981-04-02' AND '1982-12-09';


-- 45 
SELECT *
FROM emp
WHERE empno BETWEEN 7654 AND 7782;

-- 46 
SELECT *
FROM emp 
WHERE NOT hiredate LIKE '1981%';

-- 51 
SELECT *
FROM emp 
WHERE ename LIKE '_A%';

-- 54 
SELECT *
FROM emp 
WHERE comm IS NOT NULL ;

-- 58 
SELECT * 
FROM emp 
WHERE deptno =30 AND sal >= 1500 AND job = 'MANAGER';

-- 59 
SELECT *
FROM emp 
WHERE deptno = 30 
ORDER BY empno ;

SELECT *
FROM emp 
ORDER BY sal DESC ;

-- 61 
SELECT *
FROM emp 
ORDER BY deptno desc , ename asc , sal desc;

-- 63 
SELECT *
FROM emp
WHERE ename BETWEEN 'B' AND 'J';

