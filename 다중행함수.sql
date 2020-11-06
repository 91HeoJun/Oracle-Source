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

-- ����
SELECT *
FROM emp, dept
ORDER BY empno;

SELECT * 
FROM dept; -- 4��

SELECT * 
FROM emp; -- 14��

-- ���� �� �ִ� ��� ���� ��ȸ
SELECT COUNT(*)
FROM emp, dept -- �� �� ��
ORDER BY empno;

-------------------------------------------------------------------------------------------
-- 1. ��������(�����)
SELECT *
FROM emp, dept
WHERE emp.deptno = dept.deptno -- ������ ���� ex) emp�� deptno�� dept�� deptno�� ������ ȣ��
ORDER BY empno;

SELECT *
FROM emp INNER JOIN dept
ON emp.deptno = dept.deptno  -- ������ ����
ORDER BY empno;

SELECT *
FROM emp E, dept D -- FROM ���̺� ��Ī�ο� ����
WHERE E.deptno = D.deptno -- ��Ī���� ���α��� �ݿ� ����
ORDER BY empno;

SELECT *
FROM emp E, dept D
WHERE E.deptno = D.deptno -- ������ ���� ex) emp�� deptno�� dept�� deptno�� ������ ȣ��
ORDER BY empno;

-- �� ���̺� ���� �̸��� �ʵ尡 �����ϴ� ���
-- ��� ���̺� �ִ� �ʵ带 ȣ������ ��Ȯ�� ����ؾ�
SELECT empno, ename, job, D.deptno, dname
FROM emp E, dept D
WHERE E.deptno = D.deptno -- ������ ���� ex) emp�� deptno�� dept�� deptno�� ������ ȣ��
ORDER BY empno;

-- EMP ���̺�� DEPT ���̺��� �����Ͽ� empno, ename, sal, deptno, dname, loc��ȸ(�޿� 3000�̻� ����)
SELECT E.empno, e.ename, e.sal, D.deptno, D.dname, D.loc
FROM emp E, dept D
WHERE E.deptno = D.deptno AND SAL >= 3000;

-- emp ���̺��� ��Ī�� e�� dept ��Ī d��, �޿� 2500 ����, �����ȣ 9999���� ������� ���
SELECT *
FROM emp E INNER JOIN dept D
ON E.deptno = D.deptno AND sal <=2500 AND E.deptno <= 9999
ORDER BY empno;

-- emp ���̺��� ��Ī�� e�� salgrade ��Ī s��, �� ��� ������ ��� ���
SELECT *
FROM emp E, salgrade S
WHERE E.sal BETWEEN S.losal AND S.hisal;

-------------------------------------------------------------------------------------------

-- 2. ��������(��ü����) : �������̺��� �ڱ� �ڽ� ���̺��϶�
SELECT * FROM emp;

-- �� ��� �� President �� ���� NULL�� ��µ��� ���� -> �� ��� �ܺ��������� ���� �� ��
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1, emp E2
WHERE E1.mgr = E2.empno;

-------------------------------------------------------------------------------------------

-- 3. �ƿ�������(�ܺ�����) : ������ �������� �ʴ� ������ ����
SELECT * FROM emp;

-- 3-1 LEFT OUTER JOIN
-- ��� 1 ## ǥ��
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1 LEFT OUTER JOIN emp E2
ON E1.mgr = E2.empno;

-- ���2 ## ����
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1, emp E2
WHERE E1.mgr = E2.empno(+);

-- 3-2 RIGHT OUTER JOIN
-- ��� 1 ## ǥ��
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1 RIGHT OUTER JOIN emp E2
ON E1.mgr = E2.empno;

-- ���2 ## ����
SELECT E1.empno, E1.ename, E1.mgr, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1, emp E2
WHERE E1.mgr(+) = E2.empno;

-------------------------------------------------------------------------------------------

-- �ǽ�1
SELECT E.deptno, D.dname, E.empno, E.Ename, sal 
FROM emp E INNER JOIN dept D
ON E.deptno = D.deptno AND sal > 2000
ORDER BY E.deptno;

-- �ǽ�2
SELECT E.deptno, D.dname, FLOOR(AVG(E.sal)) AS AVG_SAL, MAX(E.sal) AS MAX_SAL, MIN(E.sal) AS MIN_SAL, COUNT(E.empno) AS CNT
FROM emp E INNER JOIN dept D
ON E.deptno =  D.deptno
group by E.deptno, D.dname;

-- �ǽ�3
SELECT E.deptno, D.dname, E.empno, E.ename, E.job, E.sal
FROM emp E RIGHT OUTER JOIN dept D
ON E.deptno = D.deptno
ORDER BY E.deptno, E.empno ASC;

-- �ǽ�4
-- ���1
SELECT E1.deptno, D1.dname, E1.empno, E1.ename, E1.mgr, E1.sal, E1.deptno, S.losal, S.hisal, S.grade, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1
RIGHT OUTER JOIN dept D1 ON E1.deptno = D1.deptno
LEFT OUTER JOIN salgrade S ON E1.sal BETWEEN S.losal AND S.hisal
LEFT OUTER JOIN emp E2 ON E1.mgr = E2.empno
ORDER BY D1.deptno, E1.empno;

--���2
SELECT E1.deptno, D1.dname, E1.empno, E1.ename, E1.mgr, E1.sal, E1.deptno, S.losal, S.hisal, S.grade, E2.empno AS MGR_EMPNO, E2.ename AS MGR_ENAME
FROM emp E1, dept D1, salgrade S, emp E2
WHERE E1.deptno(+) = D1.deptno AND E1.sal BETWEEN S.losal(+) AND S.hisal(+) AND E1.mgr = E2.empno(+)
ORDER BY D1.deptno;
