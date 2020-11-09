-- �������� �޿� ���޴� �ο� ���
-- �����޿�
SELECT sal
FROM emp
WHERE ename = 'JONES';
-- �������� ���� �޿� ���
SELECT *
FROM emp
WHERE sal >2975;

-------------------------------------------------------------------------------------------

-- ���� ���� : ������ �ƿ� �ٸ� �������� �����ϴ� ����
-- ������ ��������
SELECT *
FROM emp
WHERE sal > ( SELECT sal FROM emp WHERE ename = 'JONES');

-- ��� �̸��� ALLEN�� �߰����纸�� ���� �޴� ��� ���
SELECT *
FROM emp
WHERE comm > ( SELECT comm FROM emp WHERE ename = 'ALLEN' );

-- WARD�� �Ի��Ϻ��� ���� �Ի��� ��� ���
SELECT *
FROM emp
WHERE hiredate < ( SELECT hiredate FROM emp WHERE ename = 'WARD' );

-- 20�� �μ� �Ҽ� ��� �� ��ü��� ��ձ޿� ���� ���� �޿��� �޴� ��� ���
SELECT *
FROM emp
WHERE deptno = 20 AND sal > ( SELECT AVG(sal) FROM emp );

-- 20�� �μ� �Ҽ� ��� �� ��ü��� ��ձ޿� ���� ���� �޿��� �޴� ��� ���
-- �μ���, ������ġ�� ���
SELECT *
FROM emp E, dept D
WHERE E.deptno = 20 AND E.deptno = D.deptno AND sal > ( SELECT AVG(sal) FROM emp );

-------------------------------------------------------------------------------------------

-- ������ ��������

-- �������� ����� 2���̻� ���ð�� ������ �������� �����ڴ� ���Ұ�.
-- ORA-01427: ���� �� ���� ���ǿ� 2�� �̻��� ���� ���ϵǾ����ϴ�.
SELECT *
FROM emp E, dept D
WHERE E.deptno = 20 AND E.deptno = D.deptno AND sal > ( SELECT AVG(sal) FROM emp );

-- IN
SELECT *
FROM emp
WHERE sal IN (SELECT MAX(sal) FROM emp GROUP BY deptno);

-- ANY(SOME) : �տ� �����ڰ� �;� ��
-- =ANY : IN�� ������� ����. ��, IN�� �� ���� ����� 
SELECT *
FROM emp
WHERE sal  = ANY (SELECT MAX(sal) FROM emp GROUP BY deptno);
-- WHERE sal  = SOME (SELECT MAX(sal) FROM emp GROUP BY deptno);

-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���
SELECT *
FROM emp
WHERE sal < ANY (SELECT MAX(sal) FROM emp WHERE deptno = 30);

SELECT *
FROM emp
WHERE sal < ANY (SELECT sal FROM emp WHERE deptno = 30);
-- �������� ��� Ȯ��
SELECT DISTINCT sal FROM emp WHERE deptno = 30;

-- 30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���
SELECT *
FROM emp
WHERE sal > ANY (SELECT sal FROM emp WHERE deptno = 30);

-- ALL : ���������� ����� ��� �����ϴ� �������� ���� �� ���
-- �μ���ȣ�� 30���� ������� �ּ� �޿����� �� ���� �޿��� �޴� ��� ���
SELECT * 
FROM emp
WHERE  sal < ALL (SELECT sal FROM emp WHERE deptno = 30);

-- EXISTS : IN�� ����� ����. ��, IN ���� ������ ����� ## EXISTS�� ���������� WHERE ������ �߿��ϴ�
-- �������� ����� �����ϸ� �������� ����� ���
SELECT * 
FROM emp
WHERE EXISTS (SELECT dname FROM dept WHERE deptno = 20);

SELECT * 
FROM emp
WHERE NOT EXISTS (SELECT dname FROM dept WHERE deptno = 20);

SELECT empno, deptno
FROM emp
WHERE EXISTS (SELECT deptno FROM dept WHERE deptno IN(20, 30) AND emp.deptno = dept.deptno);

SELECT empno, deptno
FROM emp
WHERE NOT EXISTS (SELECT 1 FROM dept WHERE deptno IN(20, 30) AND emp.deptno = dept.deptno);

-------------------------------------------------------------------------------------------

-- ��ü ��� �� ALLEN�� ���� ��å�� ������� �������, �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�
SELECT E.empno, E.ename, D.deptno
FROM emp E, dept D
WHERE E.deptno = D.deptno AND e.job IN (SELECT job FROM emp WHERE ename = 'ALLEN');

-- ��ü ����� ��� �޿����� ���� �޿��� �޴� ������� �������, �μ�����, �޿� ��� ������ ����ϴ� SQL�� �ۼ�
-- ��, ����� �� �޿��� ���� ������ �����ϵ� �޿��� ���� ��쿡�� ��� ��ȣ�� �������� ������������ �����ϱ�)
SELECT E.empno, E.ename, D.dname, E.hiredate, D.loc, E.sal, S.grade
FROM emp E, salgrade S, dept D
WHERE D.deptno = E.deptno AND E.sal BETWEEN S.losal AND S.hisal AND E.sal > (SELECT AVG(sal) FROM emp)
ORDER BY E.sal DESC, E.empno ASC;

-------------------------------------------------------------------------------------------

-- ���߿� �������� : ���������� SELECT���� ���� Į���� ������ ������ ���
SELECT *
FROM emp
WHERE (deptno, sal) IN (SELECT deptno, MAX(sal) FROM emp GROUP BY deptno);
-- �� ������������ 2�� ���� �� -> �������� WHERE���� ������ �������� �����Ұ�.

-- FROM ���� ����ϴ� ��������(�ζ��� ��)
SELECT E.empno, E.ename, D.deptno, D.dname, D.LOC
FROM (SELECT * FROM emp WHERE deptno=10) E, (SELECT * FROM dept) D
WHERE E.deptno = D.deptno;

-- SELECT ���� ����ϴ� �������� - ��Į�� ��������

-- 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ���� ������� �������, �μ� ������ ������ ���� ����ϴ� SQL���� �ۼ��Ͻÿ�.
SELECT E.empno, E.ename, E.job, D.deptno, D.dname, D.LOC
FROM emp E, dept D
WHERE E.deptno = D.deptno AND E.job NOT IN ( SELECT job FROM emp WHERE deptno = 30) AND E.deptno = 10;

--SELECT E.empno, E.ename, E.job, D.deptno, D.dname, D.LOC
--FROM emp E, dept D
--WHERE E.deptno = D.deptno AND NOT EXISTS (SELECT 1 FROM dept WHERE deptno IN(20, 30) AND emp.deptno = dept.deptno);

-- ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� ������� �������, �޿���� ������ ���
--(��, ���������� Ȱ���� �� ������ �Լ��� ����ϴ� ����� ������� �ʴ� ����� ���� �����ȣ�� ���� �������� �����Ͽ� ���)

SELECT empno, ename,  sal, (SELECT grade FROM salgrade WHERE sal BETWEEN losal AND hisal) AS GRADE
FROM emp
WHERE sal > (SELECT MAX(sal) FROM emp WHERE JOB='SALESMAN');

SELECT empno, ename,  sal
FROM emp
WHERE sal > ALL (SELECT sal FROM emp WHERE JOB='SALESMAN');
