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






