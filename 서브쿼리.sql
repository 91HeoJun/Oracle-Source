-- 존스보다 급여 더받는 인원 출력
-- 존스급여
SELECT sal
FROM emp
WHERE ename = 'JONES';
-- 존스보다 높은 급여 사원
SELECT *
FROM emp
WHERE sal >2975;

-------------------------------------------------------------------------------------------

-- 서브 쿼리 : 쿼리문 아에 다른 쿼리문을 포함하는 상태
-- 단일행 서브쿼리
SELECT *
FROM emp
WHERE sal > ( SELECT sal FROM emp WHERE ename = 'JONES');

-- 사원 이름이 ALLEN의 추가수당보다 많이 받는 사원 출력
SELECT *
FROM emp
WHERE comm > ( SELECT comm FROM emp WHERE ename = 'ALLEN' );

-- WARD의 입사일보다 빨리 입사한 사원 출력
SELECT *
FROM emp
WHERE hiredate < ( SELECT hiredate FROM emp WHERE ename = 'WARD' );

-- 20번 부서 소속 사원 중 전체사원 평균급여 보다 높은 급여를 받는 사원 출력
SELECT *
FROM emp
WHERE deptno = 20 AND sal > ( SELECT AVG(sal) FROM emp );

-- 20번 부서 소속 사원 중 전체사원 평균급여 보다 높은 급여를 받는 사원 출력
-- 부서명, 지역위치도 출력
SELECT *
FROM emp E, dept D
WHERE E.deptno = 20 AND E.deptno = D.deptno AND sal > ( SELECT AVG(sal) FROM emp );

-------------------------------------------------------------------------------------------

-- 다중행 서브쿼리

-- 서브쿼리 결과가 2개이상 나올경우 단일행 서브쿼리 연산자는 사용불가.
-- ORA-01427: 단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
SELECT *
FROM emp E, dept D
WHERE E.deptno = 20 AND E.deptno = D.deptno AND sal > ( SELECT AVG(sal) FROM emp );

-- IN
SELECT *
FROM emp
WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY deptno);

-- ANY(SOME) : 앞에 연산자가 와야 함
-- =ANY : IN과 결과값이 같음. 단, IN을 더 많이 사용함 
SELECT *
FROM emp
WHERE sal  = ANY (SELECT MAX(sal) FROM emp GROUP BY deptno);
-- WHERE sal  = SOME (SELECT MAX(sal) FROM emp GROUP BY deptno);

-- 30번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원 출력
SELECT *
FROM emp
WHERE sal < ANY (SELECT MAX(sal) FROM emp WHERE deptno = 30);

SELECT *
FROM emp
WHERE sal < ANY (SELECT sal FROM emp WHERE deptno = 30);
-- 서브쿼리 출력 확인
SELECT DISTINCT sal FROM emp WHERE deptno = 30;

-- 30번 부서 사원들의 최소 급여보다 많은 급여를 받는 사원 출력
SELECT *
FROM emp
WHERE sal > ANY (SELECT sal FROM emp WHERE deptno = 30);

-- ALL : 서브쿼리의 결과를 모두 만족하는 메인쿼리 추출 시 사용
-- 부서번호가 30번인 사원들의 최소 급여보다 더 적은 급여를 받는 사원 출력
SELECT * 
FROM emp
WHERE  sal < ALL (SELECT sal FROM emp WHERE deptno = 30);

-- EXISTS : IN과 비슷한 개념. 단, IN 보다 성능이 우수함 ## EXISTS는 서브쿼리의 WHERE 내용이 중요하다
-- 서브쿼리 결과가 존재하면 메인쿼리 결과도 출력
SELECT * 
FROM emp
WHERE EXISTS (SELECT dname FROM dept WHERE deptno = 20);

SELECT * 
FROM emp
WHERE NOT EXISTS (SELECT dname FROM dept WHERE deptno = 20);

SELECT empno, deptno
FROM emp
WHERE EXISTS (SELECT deptno FROM dept WHERE deptno IN(20, 30) AND emp.deptno = dept.deptno);

SELECT empno, deptno
FROM emp
WHERE NOT EXISTS (SELECT 1 FROM dept WHERE deptno IN(20, 30) AND emp.deptno = dept.deptno);

-------------------------------------------------------------------------------------------

-- 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보, 부서 정보를 다음과 같이 출력하는 SQL문을 작성하시오
SELECT E.empno, E.ename, D.deptno
FROM emp E, dept D
WHERE E.deptno = D.deptno AND e.job IN (SELECT job FROM emp WHERE ename = 'ALLEN');

-- 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보, 부서정보, 급여 등급 정보를 출력하는 SQL문 작성
-- 단, 출력할 때 급여가 많은 순으로 정렬하되 급여가 같을 경우에는 사원 번호를 기준으로 오름차순으로 정렬하기)
SELECT E.empno, E.ename, D.dname, E.hiredate, D.loc, E.sal, S.grade
FROM emp E, salgrade S, dept D
WHERE D.deptno = E.deptno AND E.sal BETWEEN S.losal AND S.hisal AND E.sal > (SELECT AVG(sal) FROM emp)
ORDER BY E.sal DESC, E.empno ASC;

-------------------------------------------------------------------------------------------

-- 다중열 서브쿼리 : 서브쿼리의 SELECT문에 비교할 칼럼이 여러개 나오는 방식
SELECT *
FROM emp
WHERE (deptno, sal) IN (SELECT deptno, MAX(sal) FROM emp GROUP BY deptno);
-- ↑ 서브쿼리에서 2개 추출 시 -> 메인쿼리 WHERE에서 동일한 내용으로 추출할것.

-- FROM 절에 사용하는 서브쿼리(인라인 뷰)
SELECT E.empno, E.ename, D.deptno, D.dname, D.LOC
FROM (SELECT * FROM emp WHERE deptno=10) E, (SELECT * FROM dept) D
WHERE E.deptno = D.deptno;

-- SELECT 절에 사용하는 서브쿼리 - 스칼라 서브쿼리

-- 10번 부서에 근무하는 사원 중 30번 부서에는 존재하지 않는 직책을 가진 사원들의 사원정보, 부서 정보를 다음과 같이 출력하는 SQL문을 작성하시오.
SELECT E.empno, E.ename, E.job, D.deptno, D.dname, D.LOC
FROM emp E, dept D
WHERE E.deptno = D.deptno AND E.job NOT IN ( SELECT job FROM emp WHERE deptno = 30) AND E.deptno = 10;

--SELECT E.empno, E.ename, E.job, D.deptno, D.dname, D.LOC
--FROM emp E, dept D
--WHERE E.deptno = D.deptno AND NOT EXISTS (SELECT 1 FROM dept WHERE deptno IN(20, 30) AND emp.deptno = dept.deptno);

-- 직책이 SALESMAN인 사람들의 최고 급여보다 높은 급여를 받는 사원들의 사원정보, 급여등급 정보를 출력
--(단, 서브쿼리를 활용할 때 다중행 함수를 사용하는 방법과 사용하지 않는 방법을 통해 사원번호를 기준 오름차순 정렬하여 출력)

SELECT empno, ename,  sal, (SELECT grade FROM salgrade WHERE sal BETWEEN losal AND hisal) AS GRADE
FROM emp
WHERE sal > (SELECT MAX(sal) FROM emp WHERE JOB='SALESMAN');

SELECT empno, ename,  sal
FROM emp
WHERE sal > ALL (SELECT sal FROM emp WHERE JOB='SALESMAN');
