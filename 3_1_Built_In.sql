
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






