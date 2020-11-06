-- 단일행 SELECT과 같이 쓰면 에러남
SELECT SUM(sal)
FROM emp;

-- SUM : 합계
SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal)
FROM emp;

-- COUNT : 개수
SELECT COUNT(*)
FROM emp;

-- 부서 번호가 30번인 직원 수
SELECT COUNT(*)
FROM emp
WHERE deptno = 30;

-- MAX(최대값), MIN(최소값)
SELECT MAX(sal), MIN(sal)
FROM emp;

-- 부서번호 20인 사원 입사일 중 가장 최근 입사일 구하기 | 날짜 데이터는 숫자가 클수록 데이터가 큼
SELECT MAX(hiredate)
FROM emp
WHERE deptno = 20;

-- AVERAGE : 평균
SELECT AVG(sal)
FROM emp;

-- 30번 부서의 평균
SELECT AVG(sal)
FROM emp
WHERE deptno = 30;

-- 중복 값 제외 평균
SELECT AVG(DISTINCT sal)
FROM emp;

-- 부서별 월급의 평균을 알고싶다면?
SELECT AVG(sal)
FROM emp
WHERE deptno = 30;
SELECT AVG(sal)
FROM emp
WHERE deptno = 20;
SELECT AVG(sal)
FROM emp
WHERE deptno = 10;

-- GROUP BY : 결과 값을 원하는 열로 묶어 출력
SELECT deptno, AVG(sal)
FROM emp GROUP BY deptno;

--부서번호 별 추가수당 평균
SELECT deptno, AVG(comm)
FROM emp GROUP BY deptno;

-- 부서번호, 직책 별 급여 평균
SELECT deptno,job, AVG(sal)
FROM emp GROUP BY deptno, job
ORDER BY deptno, job;

-- GROUP BY 에 포함 안되는 열을 SELECT에 포함하면 에러!
SELECT ename, deptno, AVE(sal)
FROM emp GROUP BY deptno;

-- emp 테이블의 부서별 직책 평균급여 500 이상 직원의 부서번호 / 직책 / 부서별 직책의 평균급여 출력
SELECT deptno, job, AVG(sal)
FROM emp
GROUP BY deptno, job
HAVING AVG(sal) >= 500
ORDER BY deptno ASC;

SELECT deptno, job, AVG(sal)
FROM emp
WHERE sal <= 3000 
GROUP BY deptno, job
HAVING AVG(sal) >= 2000
ORDER BY deptno, job ASC;

-------------------------------------------------------------------------------------------

