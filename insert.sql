-- ȸ������, �Խù� ���, �Ա� ���

-- ������ dept ���̺��� �����ؼ� dept_temp ���̺� ����
CREATE TABLE dept_temp AS SELECT * FROM dept;

-- ���� ���̺� ��ȸ
SELECT
    *
FROM dept_temp;

-- ������ �߰��ϱ� (���1)
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES (50, 'DATABASE', 'SEOUL');

-- ������ �߰��ϱ� (���2)
INSERT INTO dept_temp
VALUES(60, 'NETWORK', 'BUSAN');

-- NULL �����ϱ�
-- ��������� NULL ����
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES (70, 'DATABASE', NULL);

INSERT INTO dept_temp(DEPTNO, LOC)
VALUES (90, 'INCHEON');

-- ���������� NULL ����
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES (80, 'MOBILE', '');

-- ���� 1. SQL ����: ORA-00947: ���� ���� ������� �ʽ��ϴ�
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES (50, 'DATABASE');
-- ���� 2. ORA-01438: �� ���� ���� ������ ��ü �ڸ������� ū ���� ���˴ϴ�.
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES (500, 'DATABASE', 'SEOUL');


-- EMP ���̺� �����ؼ� EMP_TEMP ���̺� ����
CREATE TABLE emp_temp AS SELECT * FROM emp;
-- ���� ���̺� ��ȸ
SELECT *
FROM emp_temp;

-- ���̺� ����
DROP TABLE emp_temp;

-- EMP ���̺��� �����Ͽ� EMP ���̺��� �����ϵ� ������ ����
CREATE TABLE emp_temp AS SELECT * FROM emp WHERE 1<>1;

DESC emp_temp;

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(9999, 'ȫ�浿', 'president', NULL, '20201109', 4000, NULL, 10 );

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(8888, '������', 'president', NULL, '20201008', 3000, NULL, 10 );

-- Ʈ�����
COMMIT;    -- <- �����ݿ�
ROLLBACK;  -- <- �ٽ� �ǵ�����

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(7777, '����ȣ', 'MANAGER', NULL, TO_DATE('07/01/2010', 'DD/MM/YYYY'), 4000, NULL, 20 );

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(7777, '�̼���', 'MANAGER', NULL, SYSDATE, 4000, NULL, 20 );

-- EMP ���̺��� SALGRADE ���̺��� �����Ͽ� �޿������ 1����� ����� EMP_TABLE�� �߰��ϰ� �ʹٸ�
-- �������� �ۼ��ϱ�(�����Ͱ� �߰��Ǵ� ���̺��� �� ������ ���������� �� ������ ��ġ)
INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp E, salgrade S
WHERE E.sal BETWEEN S.losal AND S.hisal AND S.grade =1;



