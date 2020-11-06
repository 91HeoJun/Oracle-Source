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

-- 조인
SELECT *
FROM emp, dept
ORDER BY empno;

SELECT * 
FROM dept; -- 4행

SELECT * 
FROM emp; -- 14행

-- 나올 수 있는 모든 조합 조회
SELECT COUNT(*)
FROM emp, dept -- 총 행 수
ORDER BY empno;

-------------------------------------------------------------------------------------------
-- 1. 내부조인(등가조인)
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno -- 조인의 기준 ex) emp의 deptno와 dept의 deptno가 같으면 호출
ORDER BY empno;

SELECT *
FROM emp INNER JOIN dept
ON emp.deptno = dept.deptno  -- 조인의 기준
ORDER BY empno;

SELECT *
FROM emp E, dept D -- FROM 테이블에 별칭부여 가능
WHERE E.deptno = D.deptno -- 별칭으로 조인기준 반영 가능
ORDER BY empno;

SELECT *
FROM emp E, dept D
WHERE E.deptno = D.deptno -- 조인의 기준 ex) emp의 deptno와 dept의 deptno가 같으면 호출
ORDER BY empno;

-- 두 테이블에 같은 이름의 필드가 존재하는 경우
-- 어느 테이블에 있는 필드를 호출할지 정확히 명시해야
SELECT empno, ename, job, D.deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno -- 조인의 기준 ex) emp의 deptno와 dept의 deptno가 같으면 호출
ORDER BY empno;

-- EMP 테이블과 DEPT 테이블을 조인하여 empno, ename, sal, deptno, dname, loc조회(급여 3000이상만 정렬)
SELECT E.empno, e.ename, e.sal, D.deptno, D.dname, D.loc
FROM emp E, dept D
WHERE E.deptno = D.deptno AND SAL >= 3000;

-- emp 테이블의 별칭을 e로 dept 별칭 d로, 급여 2500 이하, 사원번호 9999이하 사원정보 출력
SELECT *
FROM emp E INNER JOIN dept D
ON E.deptno = D.deptno AND sal <=2500 AND E.deptno <= 9999
ORDER BY empno;

-- emp 테이블의 별칭을 e로 salgrade 별칭 s로, 각 사원 정보랑 등급 출력
SELECT *
FROM emp E, salgrade S
WHERE E.sal BETWEEN S.losal AND S.hisal;

-------------------------------------------------------------------------------------------

-- 2. 셀프조인(자체조인) : 조인테이블이 자기 자신 테이블일때
SELECT * FROM emp;

-- ↓ 출력 시 President 와 같은 NULL은 출력되지 않음 -> 이 경우 외부조인으로 추출 할 것
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1, emp E2
WHERE E1.mgr = E2.empno;

-------------------------------------------------------------------------------------------

-- 3. 아우터조인(외부조인) : 조건을 만족하지 않는 데이터 추출
SELECT * FROM emp;

-- 3-1 LEFT OUTER JOIN
-- 방법 1 ## 표준
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1 LEFT OUTER JOIN emp E2
ON E1.mgr = E2.empno;

-- 방법2 ## 구형
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1, emp E2
WHERE E1.mgr = E2.empno(+);

-- 3-2 RIGHT OUTER JOIN
-- 방법 1 ## 표준
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1 RIGHT OUTER JOIN emp E2
ON E1.mgr = E2.empno;

-- 방법2 ## 구형
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1, emp E2
WHERE E1.mgr(+) = E2.empno;

-------------------------------------------------------------------------------------------

-- 실습1
SELECT E.deptno, D.dname, E.empno, E.Ename, sal 
FROM emp E INNER JOIN dept D
ON E.deptno = D.deptno AND sal > 2000
ORDER BY E.deptno;

-- 실습2
SELECT E.deptno, D.dname, FLOOR(AVG(E.sal)) AS AVG_SAL, MAX(E.sal) AS MAX_SAL, MIN(E.sal) AS MIN_SAL, COUNT(E.empno) AS CNT
FROM emp E INNER JOIN dept D
ON E.deptno =  D.deptno
group by E.deptno, D.dname;

-- 실습3
SELECT E.deptno, D.dname, E.empno, E.ename, E.job, E.sal
FROM emp E RIGHT OUTER JOIN dept D
ON E.deptno = D.deptno
ORDER BY E.deptno, E.empno ASC;

-- 실습4
-- 방법1
SELECT E1.deptno, D1.dname, E1.empno, E1.ename, E1.mgr, E1.sal, E1.deptno, S.losal, S.hisal, S.grade, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1
RIGHT OUTER JOIN dept D1 ON E1.deptno = D1.deptno
LEFT OUTER JOIN salgrade S ON E1.sal BETWEEN S.losal AND S.hisal
LEFT OUTER JOIN emp E2 ON E1.mgr = E2.empno
ORDER BY D1.deptno, E1.empno;

--방법2
SELECT E1.deptno, D1.dname, E1.empno, E1.ename, E1.mgr, E1.sal, E1.deptno, S.losal, S.hisal, S.grade, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1, dept D1, salgrade S, emp E2
WHERE E1.deptno(+) = D1.deptno AND E1.sal BETWEEN S.losal(+) AND S.hisal(+) AND E1.mgr = E2.empno(+)
ORDER BY D1.deptno;
