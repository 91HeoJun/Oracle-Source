-- SCOTT ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- ���̺��� ������ Ȯ�� : DESC
DESC emp;

-- emp ���̺��� ��� ���� ��ȸ
SELECT * FROM emp;

-- emp ���̺��� Ʋ�� �ʵ常 ��ȸ
SELECT ename, job, sal FROM emp;

-- �ߺ� ���ڵ� ���� : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- ��Ī(ALAIS)�ο� : AS 
SELECT empno AS �����ȣ FROM emp;

-- SELECT �� �����ڸ� �̿��� ���� ����
SELECT ename AS �̸�, sal AS �޿�, sal*12+comm AS ����, comm AS ���ʽ� FROM emp;

-- �������� �ٷ� ���� �Է� �� ���� -> ���� �� �� "" �� �Է��� ��.
SELECT ename AS �̸�, job AS "�� å" FROM emp;

-- �����Ͽ� ��ȸ(��������) : ODER BY
-- �ϳ��� ���� ������ �־� ��������(ASC) ��ȸ
SELECT ename, sal FROM emp ORDER BY sal ASC;
-- ��ü ������ ��ȸ(�����ȣ ��������)
SELECT * FROM emp ORDER BY empno ASC;

-- �ϳ��� ���� ������ �־� �������� ��ȸ
SELECT ename, sal FROM emp ORDER BY sal DESC;

-- �μ���ȣ�� ASC(��������)�̸�, �μ���ȣ ���� �� �޿��� DESC(��������) ��ȸ
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

-- �ǽ� 1��
SELECT * FROM emp;

-- �ǽ� 2, 3��
SELECT empno AS EMPLOYEE_NO, ename AS EMPLOYEE_NAME, job, mgr AS MANAGER, hiredate, sal AS SALARY, comm AS COMMISSION, deptno AS DEPARTMENT_NO FROM emp ORDER BY deptno DESC, ename ASC;

-- ��ȸ �� ���� �ο� : WHERE
SELECT * FROM emp WHERE deptno = 30;
SELECT * FROM emp WHERE empno = 7782;

-- AND �ǽ�
SELECT * FROM emp WHERE deptno = 30 AND job = 'SALESMAN';
SELECT * FROM emp WHERE empno = 7499 AND deptno = 30;

-- OR �ǽ�
SELECT * FROM emp WHERE deptno = 30 OR job = 'CLERK';
SELECT * FROM emp WHERE deptno = 20 OR job = 'SALESMAN';

-- ��������ڸ� �̿��� ��ȸ(+ ,-, /, *)
SELECT * FROM emp WHERE sal*12=36000;

-- ���迬���ڸ� �̿��� ��ȸ(<, >, =)
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;

-- ���迬����(���ĺ� ����)
SELECT * FROM emp WHERE ename >= 'F';

-- �������� : AND, OR
-- SAL 2500 AND JOB ANALYST
SELECT * FROM emp WHERE 25 <= 2500 AND job = 'ANALYST';

-- JOB MANAGER or SALESMAN or CLERK
SELECT * FROM emp WHERE job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';

-- ������� : ���� �׸��� ������ �˻�(==, !=, !)
-- SAL !3000 ��� ��� | �ϱ� ���� ���� ��� ---
SELECT * FROM emp WHERE sal != 3000;
SELECT * FROM emp WHERE sal <> 3000;
SELECT * FROM emp WHERE sal ^= 3000;

-------------------------------------------------------------------------------------------

-- IN ������
SELECT * FROM emp WHERE job IN('MANAGER','SALESMAN','CLERK');
SELECT * FROM emp WHERE job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';
SELECT * FROM emp WHERE deptno IN(10, 20);

-- NOT IN ������
SELECT * FROM emp WHERE job NOT IN('MANAGER','SALESMAN','CLERK');
SELECT * FROM emp WHERE job != 'MANAGER' AND job != 'SALESMAN' AND job != 'CLERK';

-------------------------------------------------------------------------------------------

-- BETWEEN a AND b
-- �޿� 2000 �̻�, 3000 ������ ��� ��ȸ
-- ���1 : ������ڸ� ���� ǥ��
SELECT * FROM emp WHERE sal >= 2000 AND sal <= 3000;
-- ���2 : BETWEEN ǥ��
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000;

-- �޿� 2000 �̻� 3000 ���ϰ� �ƴ� ��� ��ȸ
-- ��� : NOT + BETWEEN
SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;

-------------------------------------------------------------------------------------------

-- LIKE ���ڿ� �˻� ��� (S�� �����ϴ� @@, H�� ������ @@, ����� T�� ������ @@)
-- ��� �̸� S�� �����ϴ� ��� ��� ��ȸ�ϱ� ('' ������ ��ҹ��� ������)
SELECT * FROM emp WHERE ename LIKE 'S%';

-- ����̸� �� ��° ���ڰ� L�� ����� ��ȸ
SELECT * FROM emp WHERE ename LIKE '_L%';

-- ��� �̸��� AM�� ���Ե� ��� ��ȸ
SELECT * FROM emp WHERE ename LIKE '%AM%';

-- ��� �̸��� AM�� ���Ե��� ���� ��� ��ȸ
SELECT * FROM emp WHERE ename NOT LIKE '%AM%';

-------------------------------------------------------------------------------------------

-- IS NULL
SELECT * FROM emp WHERE comm = null; -- �Ұ�
SELECT * FROM emp WHERE comm IS null; -- ����

-- mgr �� NULL �� ��� ��ȸ
SELECT * FROM emp WHERE mgr IS null;

-- mgr �� NULL �� �ƴ� ��� ��ȸ
SELECT * FROM emp WHERE mgr IS NOT null;

-------------------------------------------------------------------------------------------

-- ���տ����� : ������(UNION), ������(INTERSECT), ������(MINUS)

-- ������(UNION) : DEPTNO�� 10�� ���̺�� DEPTNO�� 20�� ����� ���ؼ� ���
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION -- UNION [ALL(�ߺ����� ��ü ���) / SELECT / WITH]
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;

-- ������(MINUS) : �μ���ȣ�� 10�� �ƴ� ��� ��ȸ
SELECT empno, ename, sal, deptno FROM emp
MINUS
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

-- ������(INTERSECT) : �μ� ��ȣ�� 10�� ��� ��ȸ
SELECT empno, ename, sal, deptno FROM emp
INTERSECT
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

-- 20, 30�� �μ���ȣ ���� ��� �� SAL�� 2000 �ʰ��� ����� ���, �̸�, �޿�, �μ���ȣ ��� | SELECT�� �� ���� ��� 
-- ���� ������ �̻��
SELECT empno, ename, sal, deptno FROM emp WHERE deptno IN(20, 30) AND sal > 2000;

-- ���� ������ �̻��
-- ������
SELECT empno, ename, sal, deptno FROM emp WHERE sal > 2000
MINUS
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

-- ������
SELECT empno, ename, sal, deptno FROM emp WHERE sal > 2000 AND deptno = 20
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE sal > 2000 AND deptno = 30;

-- ������ 
SELECT empno, ename, sal, deptno FROM emp
INTERSECT
SELECT empno, ename, sal, deptno FROM emp WHERE deptno IN(20, 30) AND sal > 2000;

-------------------------------------------------------------------------------------------

-- ����Ŭ �Լ�
-- 1. ���� �Լ� : UPPER / LOWER / INITCAP / LENGTH / LENGTHB / SUBSTR / INSTR / REPLACE / CONCAT / TRIM / REVERSE

-- ENAME �� UPPER / LOWER / INITCAP �� ��ȯ ��ȸ
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename) FROM emp;

-- DUAL ���̺� �̿� (SYS ���� ���̺�� �ӽÿ��� Ȥ�� �Լ� ��� �� Ȯ�� �뵵�� �̿�)
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM DUAL;

-- ��å 6���� �̻� ��� ��ȸ
SELECT * FROM emp WHERE LENGTH(job) >= 6;

-- SUBSTR(���ڿ� ����)
SELECT job, SUBSTR(job, 1, 2 ), SUBSTR(job, 3, 2), SUBSTR(job, 5) FROM emp;
-- -LENGTH(JOB) = -5
SELECT job, SUBSTR(job, -LENGTH(JOB)), SUBSTR(job, -LENGTH(JOB),2), SUBSTR(job, -3) FROM emp;

-- INSTR (Ư������ ��ġ ã��)
SELECT INSTR('HELLO, ORACLE!','L') AS INSTR_1,
INSTR('HELLO, ORACLE!','L', 5) AS INSTR_2,
INSTR('HELLO, ORACLE!','L', 2, 2) AS INSTR_3
FROM DUAL;

-- REPLACE(ã�Ƽ� �ٲٱ�)
SELECT REPLACE('�̰��� Oracle�̴�','�̰���','THIS IS')
FROM DUAL;

SELECT '010-1234-5678' AS REPLACE_BEFORE,
REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
REPLACE('010-1234-5678', '-') AS REPLACE_2
FROM DUAL;

-- CONCAT(����)
-- empno, ename�� �����Ͽ� ��ȸ
SELECT CONCAT (empno, ename), CONCAT(empno, CONCAT(':',ename)) -- CONCAT�� 2������ �����ϹǷ� �߰��� �� �� ��� CONCAT �ȿ� CONCAT�� �����Ұ�
FROM emp
WHERE ename = 'SCOTT';

-- || : ������ �ǹ̷� ����
SELECT empno || ename, empno || ':' || ename
FROM emp
WHERE ename = 'SCOTT';

-- TRIM(���� ����), LTRIM(���� ���� ����), RTRIM(���� ���� ����)
SELECT '   �̰���   ', TRIM('      �̰���      ')
FROM DUAL;

-- REVERSE(���ڿ� �����)
SELECT REVERSE('Oracle') FROM DUAL;

