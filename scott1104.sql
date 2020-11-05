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
SELECT CONCAT (empno, ename), CONCAT(empno, CONCAT(':',ename))
-- CONCAT�� 2������ �����ϹǷ� �߰��� �� �� ��� CONCAT �ȿ� CONCAT�� �����Ұ�
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

-------------------------------------------------------------------------------------------

-- 2. ���� �Լ� : ROUND(�ݿø�) / TRUNC(����) / CEIL(�Էµ� ���ڿ� ����� ū ����) / FLOOR(�Էµ� ���ڿ� ����� ���� ����), MOD(������)

-- ROUND(�ݿø�)
SELECT ROUND(1234.5678) AS ROUND,
    ROUND(1234.5678, 0) AS ROUND_1,
    ROUND(1234.5678, 1) AS ROUND_1,
    ROUND(1234.5678, -1) AS ROUND_MINUS,
    ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

-- TRUNC(����)
SELECT TRUNC(1234.5678) AS TRUNC,
TRUNC(1234.5678, 0) AS TRUNC_1,
TRUNC(1234.5678, 1) AS TRUNC_2,
TRUNC(1234.5678, -1) AS TRUNC_MINUS,
TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

-- CEIL / FLOOR
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(3.14)
FROM DUAL;

-- MOD
SELECT MOD(15,6), MOD(10,2), MOD(11,2)
FROM DUAL;

-------------------------------------------------------------------------------------------
-- 3. ��¥�Լ� : SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP, ADD_MONTHS

SELECT sysdate, current_date, current_timestamp
FROM DUAL;

-- ��¥ �����ʹ� ������ ������ : ��¥ ������ +1, -1, ��¥������ - ��¥������
-- ��¥ ������ + ��¥�����ʹ� �Ұ�
SELECT SYSDATE AS NOW, SYSDATE - 1 AS YESTERDAY, SYSDATE + 1 AS TOMORROW
FROM DUAL;

-- ADD_MONTHS
SELECT SYSDATE AS NOW, ADD_MONTHS (SYSDATE, 3)
FROM DUAL;

-- �Ի� 10�ֳ� ��� ��ȸ
SELECT empno, ename, hiredate, ADD_MONTHS(hiredate, 120)
FROM emp;

-- �Ի� 38�� �̸� ��� ��ȸ
SELECT empno, ename, hiredate
FROM emp
WHERE ADD_MONTHS(hiredate, 456) > SYSDATE;

-- ��¥�Լ� : MONTHS_BETWEEN(@, @) - �� ��¥ ������ ����
SELECT empno, ename, hiredate
FROM emp
WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 456;

SELECT empno, ename, hiredate, SYSDATE, MONTHS_BETWEEN(hiredate, SYSDATE) AS MONTHS1,
    MONTHS_BETWEEN(SYSDATE, hiredate) AS MONTHS2,
    TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate))
FROM emp;

-- ��¥�Լ� : NEXT_DAY, LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE, '������'), LAST_DAY(SYSDATE)
FROM DUAL;

-------------------------------------------------------------------------------------------

-- 4. ����ȯ �Լ� : TO_CHAR(��¥, ���ڵ����� �� ����) / TO_NUMBER(���ڵ����� �� ����) / TO_DATE(���ڵ����� �� ��¥)

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS ���糯¥
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MM') AS ���糯¥ -- ��ü ��¥�� ���� ������, ����� MM or DD��
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON') AS ���糯¥ -- �� + ���� ���
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') AS ���糯¥ -- ���� ���
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS ���糯¥ -- Defult�� 12�ð���
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH12:MI:SS') AS ���糯¥
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS ���糯¥ -- 24�ð��� ����
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS PM') AS ���糯¥ -- 24�ð��� + AM or PM �Է� �� ����, ���� ��� ����
FROM DUAL;

-- �ǽ� : ���� ��¥�� �� / �� / �� / �� : �� : �� ���
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/SS HH:MI:SS') AS ���糯¥�ð�
FROM DUAL;

SELECT 1300 - TO_NUMBER('1500'), to_number('1300') + 1500
FROM DUAL;

SELECT 1,300 - '1500', '1300' + 1,500 -- �ʵ� ������ ','�� �ϱ⿡ TO_NUMBER�� ���ں�ȯ �� �����ϴ� ���� ��Ȯ��
FROM DUAL;

-- SELECT TO_NUMBER('1,300') - TO_NUMBER('1,500') FROM DUAL; <- X
SELECT TO_NUMBER('1,300', '999,999,999') - to_number('1,500', '999,999')
FROM DUAL;

SELECT SAL, TO_CHAR(SAL, '$999,999') AS SAL_$,
    TO_CHAR(SAL, 'L999,999') AS SAL_L,      -- L:����ȭ�� ��ȭ��ȣ
    TO_CHAR(SAL, '$999,999') AS SAL_1,      -- $:�޷� ��ȭ��ȣ
    TO_CHAR(SAL, '000,999,999.00') AS SAL_2,-- ���ڸ��� 0���� ä�� 
    TO_CHAR(SAL, '000999,999.99') AS SAL_3, -- ���ڸ��� 0���� ä��
    TO_CHAR(SAL, '999,999,00') AS SAL_4     -- 
FROM emp;


SELECT TO_DATE('2020-11-05', 'YYYY/MM/DD') AS TODATE1,
    TO_DATE('20201105', 'YYYY-MM-DD') AS TODATE2
FROM DUAL;

-- 1981-06-01 ���� �Ի��� ���� ��ȸ
SELECT *
FROM emp
WHERE hiredate > TO_DATE('19810601', 'YYYY/MM/DD');

SELECT TO_DATE('2019-12-20') - TO_DATE('2019-10-20')
FROM DUAL;

-------------------------------------------------------------------------------------------

-- 5. NULLó�� �Լ� : NVL, NVL2
SELECT empno, ename, sal, comm, sal+comm
FROM emp;

-- NVL �Լ��� ���� null�� ��� �������� ���
SELECT empno, ename, sal, comm, sal+comm, NVL(comm, 0), sal+NVL(comm, 0)
FROM emp;

-- NVL2 �Լ��� null�� �ƴѰ�� ������1��  ����ϰ�, null�� ��� ������2�� ���
SELECT empno, ename, sal, comm, NVL2(comm, '0', 'X'), sal+NVL2(comm, sal*12+comm, sal*12) AS ANNSAL
FROM emp;

-------------------------------------------------------------------------------------------

-- 6. DECODE�Լ��� CASE�� (JAVA������ if / else if / SWITCH&CASE �� ����� ���)
-- JOB �� MANAGER, SALESMAN, ANALYST �� ��� ������ �ٸ� ������ ������ ���

-- DECODE
SELECT empno, ename, job, sal, DECODE(job, 'MANAGER', SAL*1.1, 
                                        'SALESMAN', SAL*1.05,
                                        'ANALYST', SAL,
                                        SAL*1.03) AS UPSAL
FROM emp;

-- CASE
SELECT empno, ename, job, sal, CASE job
                                    WHEN 'MANAGER' THEN SAL*1.1
                                    WHEN 'SALESMAN' THEN SAL*1.05
                                    WHEN 'ANALYST' THEN SAL
                                    ELSE SAL*1.03
                                END AS UPSAL
FROM emp;


SELECT empno, ename, job, sal, CASE
                                    WHEN comm IS NULL THEN '�ش���� ����'
                                    WHEN comm = 0 THEN '���� ����'
                                    WHEN comm > 0 THEN '���� : ' || comm
                                END AS COMM_TEXT
FROM emp;
