-- 1 
SELECT  MAX(sal) - MIN(sal) AS "차이" ,MAX(sal) , MIN(sal) 
FROM emp; 

-- 2 . emp table에서 전체 월급이 5000을 초과하는 각 업무에 대해 업무와 월 급여 합계를 출력 하시오. 단 판매원은 제외하고 월 급여 합계로 내림차순 정렬하시오.
SELECT  job , SUM(sal)
FROM emp 
WHERE job <> 'salESMAN'
GROUP BY job
HAVING SUM(sal) > 5000 
ORDER BY SUM(sal);

select job from emp;









