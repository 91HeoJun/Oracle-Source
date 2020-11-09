
CREATE TABLE dept_temp2 AS SELECT * FROM dept;


-- DEPT_TEMP2�� �ִ� LOC ��� ����
SELECT * FROM dept_temp2;


UPDATE dept_temp2 -- ���̺� ����
SET LOC = 'SEOUL'; -- ������ ����
WHERE deptno = 10;


-- EMP_TEMP ���̺��� ����� �� �޿��� 3000 ������ ����� �߰����� 50���� ����

CREATE TABLE EMP_TEMP AS SELECT * FROM emp;


SELECT
    *
FROM emp_temp;

UPDATE emp_temp 
SET comm = 50
WHERE SAL<=3000;

-- ���������� �̿��� ������ ����
-- 40�� �μ��� �μ���� ���� ����

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

