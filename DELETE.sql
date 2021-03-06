
CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

-- JOB 이 MANAGER 인 데이터 삭제하기
DELETE EMP_TEMP2
WHERE JOB='MANAGER';

ROLLBACK;

--- EMP_TEMP2 테이블의 사원들 중에서 급여가 5000이상인 사원을 삭제 해주세요
DELETE EMP_TEMP2
WHERE SAL>=5000;
COMMIT;


DELETE FROM emp_temp2 
WHERE empno IN (SELECT E.empno FROM emp_temp2 E, salgrade S WHERE E.sal BETWEEN S.losal AND S.hisal AND S.grade = 3 AND deptno = 30);

