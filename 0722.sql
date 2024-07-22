/*
	Author : Hong InPyo
    Date : 2024.07.22
    Objective :  Basic SELECT
    Environment : Windows 10 , MySQL Workbench 8.0.38 , MySql 8.0.63
*/

SELECT CONCAT(ename, '의 봉급은' , sal , '입니다.')
FROM emp;

SELECT 'aaa'
FROM emp;

SELECT DISTINCT job
FROM emp;

SELECT DISTINCT deptno
FROM emp;

SELECT *
FROM emp
WHERE ename = UPPER('smith');

-- 1980년 입사한 직원  , where 에 조건이 오면 비표준조인 
select empno , ename, hiredate
from emp
where  hiredate >= '1980-01-01' AND hiredate <= '1980-12-31';


SELECT version();

-- 1987년에 입사한 사람 봉급과 입사날을 출력하십시오.
SELECT ename, sal, hiredate
FROM  emp
WHERE hiredate BETWEEN '1987-01-01' AND '1987-12-31';
/* WHERE hiredate >= '1987-01-01' AND hiredate <= '1987-12-31'; */

-- 회사 직원중에서 직무가 회사원이거나 분석가인 사원의 사원이름, 사원의 직무를 출력허시오.
SELECT ename, job
FROM emp
WHERE job IN('CLERK' , 'ANALYST');  -- job = 'clerk' or 'analyze' / or 대신 쓰는 방법 or이 계속 길어질 수 있음. 


SELECT  ename
FROM emp
WHERE ename LIKE 'SMIT_'; -- 'SMI%' , '%T' , '%I%' 

-- 우리 회사 직원중에 보너스를 받는 사람은?
SELECT empno , ename , comm , deptno 
FROM emp
WHERE comm IS NOT NULL;

-- 입사일 기준 내림차순
SELECT  empno , ename , hiredate , sal
FROM emp 
ORDER BY hiredate DESC , sal;

-- 우리 회사 직원 중  20번 부서 또는 30번 부서의 연봉 내림차순으로 출력하시오. // 추출 속성 - 칼람이 없는걸 계산해서 별칭을 만듬 
SELECT deptno , ename,  (sal + IFNULL(comm, 0)) * 12 AS Annual 
FROM emp 
WHERE deptno IN(20,30)
ORDER BY Annual DESC;

