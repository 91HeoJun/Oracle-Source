-- ������ SELECT�� ���� ���� ������
SELECT SUM(sal)
FROM emp;

-- SUM : �հ�
SELECT SUM(sal), SUM(DISTINCT sal), SUM(ALL sal)
FROM emp;

-- COUNT : ����
SELECT COUNT(*)
FROM emp;

-- �μ� ��ȣ�� 30���� ���� ��
SELECT COUNT(*)
FROM emp
WHERE deptno = 30;

-- MAX(�ִ밪), MIN(�ּҰ�)
SELECT MAX(sal), MIN(sal)
FROM emp;

-- �μ���ȣ 20�� ��� �Ի��� �� ���� �ֱ� �Ի��� ���ϱ� | ��¥ �����ʹ� ���ڰ� Ŭ���� �����Ͱ� ŭ
SELECT MAX(hiredate)
FROM emp
WHERE deptno = 20;

-- AVERAGE : ���
SELECT AVG(sal)
FROM emp;

-- 30�� �μ��� ���
SELECT AVG(sal)
FROM emp
WHERE deptno = 30;

-- �ߺ� �� ���� ���
SELECT AVG(DISTINCT sal)
FROM emp;

-- �μ��� ������ ����� �˰�ʹٸ�?
SELECT AVG(sal)
FROM emp
WHERE deptno = 30;
SELECT AVG(sal)
FROM emp
WHERE deptno = 20;
SELECT AVG(sal)
FROM emp
WHERE deptno = 10;

-- GROUP BY : ��� ���� ���ϴ� ���� ���� ���
SELECT deptno, AVG(sal)
FROM emp GROUP BY deptno;

--�μ���ȣ �� �߰����� ���
SELECT deptno, AVG(comm)
FROM emp GROUP BY deptno;

-- �μ���ȣ, ��å �� �޿� ���
SELECT deptno,job, AVG(sal)
FROM emp GROUP BY deptno, job
ORDER BY deptno, job;

-- GROUP BY �� ���� �ȵǴ� ���� SELECT�� �����ϸ� ����!
SELECT ename, deptno, AVE(sal)
FROM emp GROUP BY deptno;

-- emp ���̺��� �μ��� ��å ��ձ޿� 500 �̻� ������ �μ���ȣ / ��å / �μ��� ��å�� ��ձ޿� ���
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

