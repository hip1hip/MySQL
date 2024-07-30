
-- 1 
SELECT empno , ename , job , sal , deptno 
FROM emp
WHERE SUBSTR(ename , 1, 1) > 'K' AND SUBSTR(ename,1,1) < 'Y'
ORDER BY ename ;

-- 2
SELECT INSTR(ename , 'L') , ename
FROM emp;

-- 3 
SELECT empno, ename , LTRIM(sal, '1', '') AS sal , sal
FROM emp;

-- 4 
SELECT ename, hiredate,
    -- 입사일로부터 6개월 후 날짜
    DATE_ADD(hiredate, INTERVAL 6 MONTH) AS six_months_later,
    -- 입사일로부터 6개월 후의 요일
    DAYOFWEEK(DATE_ADD(hiredate, INTERVAL 6 MONTH)) AS day_of_week,
    -- 입사일로부터 6개월 후의 날짜에 남은 날들을 더하여 다음 월요일을 계산
    DATE_ADD(
        DATE_ADD(hiredate, INTERVAL 6 MONTH),
        INTERVAL ((8 - DAYOFWEEK(DATE_ADD(hiredate, INTERVAL 6 MONTH))) % 7) DAY
    ) AS next_monday
FROM  emp;

-- 5 
SELECt  ename , LPAD(sal, 15 ,'*') AS formatted_sak 
FROM emp; 

-- 6 
SELECT  ename , job , hiredate, DAYNAME(hiredate) as hire_day
FROM emp
WHERE YEAR(hiredate) IN(1981, 1982);

-- 7 
SELECT ename , sal , ROUND(sal * 0.15, 2) as fee
FROM emp 
WHERE sal BETWEEN 1500 AND 3000 ;

-- 8
SELECT ename , sal , FLOOR(sal * 1.5) 
FROM emp 
WHERE sal >= 2000;

-- 9 입사일부터 지금까지의 날짜수를 출력하라. 부서번호, 이름, 입사일, 현재일, 근무일수(소수점 이하 절삭), 근무년수, 근무월수(30일 기준), 근무주수를 출력하라.
SELECT deptno , ename , hiredate , CURDATE() ,  
DATEDIFF(CURDATE(), hiredate) AS total_days, 
FLOOR(DATEDIFF(CURDATE(), hiredate) / 365) ,
FLOOR(DATEDIFF(CURDATE(), hiredate) / 30) ,
FLOOR(DATEDIFF(CURDATE(), hiredate) / 7) 
FROM emp ;

-- 10 
SELECT ename , sal , (sal*0.9) AS txsal
FROM emp 
-- WHERE 
ORDER BY txsal desc; 

-- 11 
SELECT ename , hiredate, ADDDATE(hiredate ,  90 ) , sal
FROM emp; 
-- WHERE 

-- 12 
SELECT ename , hiredate, ADDDATE(hiredate ,  INTERVAL 6 MONTH ) , sal
FROM emp ;

-- 13 
SELECT deptno, ename , DATEDIFF(LAST_DAY(hiredate), hiredate) + 1 
FROM emp; 

-- 14 
SELECT ename , hiredate , DATE_ADD(hiredate, INTERVAL 60 DAY) AS after_60days,
 -- 60일 후의 날짜를 기준으로 다음 월요일을 계산
    DATE_ADD(DATE_ADD(hiredate, INTERVAL 60 DAY), INTERVAL (8 - DAYOFWEEK(DATE_ADD(hiredate, INTERVAL 60 DAY))) % 7 DAY) AS next_monday
FROM emp; 

-- 15 
SELECT ename , hiredate , DATEDIFF(CURDATE() , hiredate)
FROM emp ; 

-- 16 
SELECT ename , hiredate , CONCAT(DATE_FORMAT(hiredate , "%Y년 %m월 %d일 ") ,
CASE DAYOFWEEK(hiredate) 
	WHEN 1 THEN '일요일'
	WHEN 2 THEN '월요일'
	WHEN 3 THEN '화요일'
	WHEN 4 THEN '수요일'
	WHEN 5 THEN '목요일'
	WHEN 6 THEN '금요일'
	WHEN 7 THEN '토요일'
	END ) AS fom
FROM emp ;

-- 17 
SELECT LOWER(LEFT(ename, 3))
FROM emp
WHERE LENGTH(ename) >= 6;


where in( 'sotte ' , 'awd' ) ;

select *
from emp 
where hiredate between '1987-01-01' AND  '1987-12-12';

select *
from emp 
where ename = 'scott' or ename = 'miller';

select *
from emp 
where not deptno = 20 or deptno = 30;

select *
from emp 
where ename > 'B' AND ename <'j';








