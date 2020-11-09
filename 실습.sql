
-- �ǽ� 1 ���̺� ����
CREATE TABLE exam_emp AS SELECT * FROM emp;
CREATE TABLE exam_dept AS SELECT * FROM dept;
CREATE TABLE exam_salgrade AS SELECT * FROM salgrade;

SELECT * FROM exam_emp;
SELECT * FROM exam_dept;
SELECT * FROM exam_salgrade;

-- �ǽ� 2 exam_emp ���̺� ���� �Է�
INSERT INTO exam_emp
VALUES (7201, 'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, NULL, 50);
INSERT INTO exam_emp
VALUES (7202, 'TEST_USER2', 'CLERK', 7201, '2016-02-21', 1800, NULL, 50);
INSERT INTO exam_emp
VALUES (7203, 'TEST_USER3', 'ANALYST', 7201, '2016-04-11', 3400, NULL, 60);
INSERT INTO exam_emp
VALUES (7204, 'TEST_USER4', 'SALESMAN', 7201, '2016-05-31',2700, 300, 60);
INSERT INTO exam_emp
VALUES (7205, 'TEST_USER5', 'CLERK', 7201, '2016-07-20', 2600, NULL, 70);
INSERT INTO exam_emp
VALUES (7206, 'TEST_USER6', 'CLERK', 7201, '2016-09-08', 2600, NULL, 70);
INSERT INTO exam_emp
VALUES (7207, 'TEST_USER7', 'LECTURER', 7201, '2016-10-28', 2300, NULL, 80);
INSERT INTO exam_emp
VALUES (7208, 'TEST_USER8', 'STUDENT', 7201, '2016-03-09', 1200, NULL, 80);

COMMIT;

-- �ǽ� 3 EXAM_EMP�� ���� ��� �� 50�� �μ����� �ٹ��ϴ� ������� ��� �޿����� ���� �޿��� �ް� �ִ� �������
-- 70�� �μ��� �ű�� SQL �� �ۼ��ϱ�
UPDATE exam_emp
SET deptno = 70
WHERE SAL > (SELECT AVG(sal) FROM exam_emp WHERE deptno = 50);

-- �ǽ� 4 EXAM_EMP�� ���� ��� �� 60�� �μ��� ��� �߿��� �Ի����� ���� ���� ������� �ʰ� �Ի��� ����� �޿��� 10% �λ��ϰ�
-- 80�� �μ��� �ű�� SQL �� �ۼ��ϱ�

UPDATE exam_emp
SET sal = sal*1.1, deptno = 80
WHERE hiredate > (SELECT MIN(hiredate) FROM exam_emp WHERE deptno = 60);

-- �ǽ� 5 EXAM_EMP�� ���� ��� ��, �޿� ����� 5�� ����� �����ϴ� SQL���� �ۼ��ϱ�
DELETE FROM exam_emp
WHERE empno IN
(SELECT empno FROM exam_emp, salgrade WHERE sal BETWEEN losal AND hisal AND grade = 5);

COMMIT;

