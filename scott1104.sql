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

-- �μ���ȣ�� ���������̸�, �μ���ȣ ���� �� �޿��� �������� ��ȸ
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

-- JOB MANAGER, SALESMAN, CLERK
SELECT * FROM emp WHERE job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';
