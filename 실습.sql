
-- 실습 1 테이블 생성
CREATE TABLE exam_emp AS SELECT * FROM emp;
CREATE TABLE exam_dept AS SELECT * FROM dept;
CREATE TABLE exam_salgrade AS SELECT * FROM salgrade;

SELECT * FROM exam_emp;
SELECT * FROM exam_dept;
SELECT * FROM exam_salgrade;

-- 실습 2 exam_emp 테이블에 정보 입력
INSERT INTO exam_emp
VALUES (7201, 'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, NULL, 50);
INSERT INTO exam_emp
VALUES (7202, 'TEST_USER2', 'CLERK', 7201, '2016-02-21', 1800, NULL, 50);
INSERT INTO exam_emp
VALUES (7203, 'TEST_USER3', 'ANALYST', 7201, '2016-04-11', 3400, NULL, 60);
INSERT INTO exam_emp
VALUES (7204, 'TEST_USER4', 'SALESMAN', 7201, '2016-05-31',2700, 300, 60);
INSERT INTO exam_emp
VALUES (7205, 'TEST_USER5', 'CLERK', 7201, '2016-07-20', 2600, NULL, 70);
INSERT INTO exam_emp
VALUES (7206, 'TEST_USER6', 'CLERK', 7201, '2016-09-08', 2600, NULL, 70);
INSERT INTO exam_emp
VALUES (7207, 'TEST_USER7', 'LECTURER', 7201, '2016-10-28', 2300, NULL, 80);
INSERT INTO exam_emp
VALUES (7208, 'TEST_USER8', 'STUDENT', 7201, '2016-03-09', 1200, NULL, 80);

COMMIT;

-- 실습 3 EXAM_EMP에 속한 사원 중 50번 부서에서 근무하는 사원들의 평균 급여보다 많은 급여를 받고 있는 사원들을
-- 70번 부서로 옮기는 SQL 문 작성하기
UPDATE exam_emp
SET deptno = 70
WHERE SAL > (SELECT AVG(sal) FROM exam_emp WHERE deptno = 50);

-- 실습 4 EXAM_EMP에 속한 사원 중 60번 부서의 사원 중에서 입사일이 가장 빠른 사원보다 늦게 입사한 사원의 급여를 10% 인상하고
-- 80번 부서로 옮기는 SQL 문 작성하기

UPDATE exam_emp
SET sal = sal*1.1, deptno = 80
WHERE hiredate > (SELECT MIN(hiredate) FROM exam_emp WHERE deptno = 60);

-- 실습 5 EXAM_EMP에 속한 사원 중, 급여 등급이 5인 사원을 삭제하는 SQL문을 작성하기
DELETE FROM exam_emp
WHERE empno IN
(SELECT empno FROM exam_emp, salgrade WHERE sal BETWEEN losal AND hisal AND grade = 5);

COMMIT;

