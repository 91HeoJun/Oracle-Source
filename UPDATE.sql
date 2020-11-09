
CREATE TABLE dept_temp2 AS SELECT * FROM dept;


-- DEPT_TEMP2에 있는 LOC 모두 수정
SELECT * FROM dept_temp2;


UPDATE dept_temp2 -- 테이블 수정
SET LOC = 'SEOUL'; -- 수정할 내용
WHERE deptno = 10;


-- EMP_TEMP 테이블의 사원들 중 급여가 3000 이하인 사원만 추가수당 50으로 수정

CREATE TABLE EMP_TEMP AS SELECT * FROM emp;


SELECT
    *
FROM emp_temp;

UPDATE emp_temp 
SET comm = 50
WHERE SAL<=3000;

-- 서브쿼리를 이용한 테이터 수정
-- 40번 부서의 부서명과 지역 수정

UPDATE dept_temp2
SET (dname, loc) = (SELECT dname, loc FROM dept WHERE deptno = 30)
WHERE deptno = 40;

UPDATE dept_temp2
SET  LOC = 'SEOUL'
WHERE deptno = (SELECT deptno FROM dept WHERE dname = 'OPERATIONS');

SELECT
    *
FROM dept_temp2;

COMMIT;

