
CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;

SELECT * FROM EMP_TEMP2;

-- JOB �� MANAGER �� ������ �����ϱ�
DELETE EMP_TEMP2
WHERE JOB='MANAGER';

ROLLBACK;

--- EMP_TEMP2 ���̺��� ����� �߿��� �޿��� 5000�̻��� ����� ���� ���ּ���
DELETE EMP_TEMP2
WHERE SAL>=5000;
COMMIT;


DELETE FROM emp_temp2 
WHERE empno IN (SELECT E.empno FROM emp_temp2 E, salgrade S WHERE E.sal BETWEEN S.losal AND S.hisal AND S.grade = 3 AND deptno = 30);

