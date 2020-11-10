
-- ������ ���� : �����ͺ��̽� �޸�, ����, �����, ����, ��ü�� ���� ����Ŭ ��� �ʿ��� �߿��� �����Ͱ� ������ ���

-- SCOTT �������� ��� ������ ������ ����

SELECT * FROM DICT;

SELECT * FROM USER_TABLES;

SELECT * FROM ALL_TABLES;

-- �� : ���� ���̺�

CREATE VIEW vm_emp20 AS (SELECT empno, ename, job, deptno
                        FROM emp WHERE deptno=20);

SELECT * FROM vm_emp20; -- ������ ���������� ������ �ʵ带 �״�� ������.

-- �� Ȯ�� 
SELECT * FROM USER_VIEWS; 

CREATE VIEW vm_emp30all AS SELECT * FROM emp;

-- ������ �並 ���� INSERT �۾�
INSERT INTO vm_emp30all
VALUES(7777, 'KIM', 'JUNKI', NULL, '20/10/19', 2650, NULL, 20);

SELECT * FROM vm_emp30all;
SELECT * FROM emp;

-- ��� SELECT�� �����ϵ��� ����
CREATE VIEW vm_emp_read AS SELECT empno, ename, job 
FROM emp
WITH READ ONLY;

-- ������ �信 ������ �����Ѱ�?
SELECT * 
FROM user_updatable_columns
WHERE table_name = 'VM_EMP30ALL';

SELECT * 
FROM SYS.user_updatable_columns
WHERE table_name = 'VM_EMP_READ';

-- �並 ����ϴ� ����
-- 1. ���� : ���� ���̺��� ������ �ΰ��� ���� ����
SELECT * FROM EMP; -- ex) SAL, COMM
-- 2. ��������, ���ΰ� ���� ������ ���� ����� �����Ͽ� ���
-- 3. �ε��� : ���̴��̱� ������ SELECT���� ȿ���� ����

-- SCOTT ������ ������ �ε��� ���� ����
SELECT * FROM user_indexes;

-- �⺻Ű ���� => �ڵ� �ε����� ��
-- �ε��� ����(emp ���̺��� sal ���� �ε��� ����)
CREATE INDEX idx_emp_sql ON emp(sal);
SELECT * FROM emp WHERE sal=1250;


CREATE TABLE USERTBL(
    userID CHAR(8) NOT NULL PRIMARY KEY,
    userNAME NVARCHAR2(10) NOT NULL,
    birthyear NUMBER(4) NOT NULL,
    mobile CHAR(3)
);

SELECT * FROM user_indexes;

-- ������ : Ư�� ��Ģ�� �´� ���� ���� ����
-- �� �Խñ� ��ȣ / ��ǰ��ȣ / �ֹ���ȣ.... �� ����
CREATE SEQUENCE DEPT_SEQ
INCREMENT BY 10     -- 10�� ����
START WITH 10       -- ó�� ���� ����
MAXVALUE 90         -- ������ ����
MINVALUE 0          -- START ������ �۰� ����
NOCYCLE CACHE 2;    -- �ݺ����� ���� / CACHE = �̸� ������ ������ ����

CREATE TABLE DEPT_SEQ_TBL AS SELECT * FROM DEPT WHERE 1<>1;

-- �������� �̿��Ͽ� ����
SELECT * FROM dept_seq_tbl;
INSERT INTO dept_seq_tbl VALUES(DEPT_SEQ.nextval, 'DATABASE', 'SEOUL');

-- ������ ����
ALTER SEQUENCE DEPT_SEQ INCREMENT BY 3 MAXVALUE 99 CYCLE;

-- ������ ����� ������ Ȯ���ϱ�
SELECT DEPT_SEQ.CURRVAL FROM DUAL;

--------------------------------------------------------------------------------------------------------------------

-- SYNONYM(���Ǿ�) : ���� ��Ī
-- ���̺�, ��, ������ �� ��ü�鿡�� ��� ����Ҽ� �ִ� �̸� �ο�

CREATE SYNONYM E FOR emp;

SELECT * FROM E;

DROP SYNONYM E;

--------------------------------------------------------------------------------------------------------------------
-- �ǽ�1
--EMP���̺�� ���� ������ �����͸� �����ϴ� EMPIDX ���̺��� �����Ͻÿ�.
CREATE TABLE EMPIDX AS SELECT * FROM emp WHERE 1<>1;
SELECT * FROM EMPIDX;
-- ������ EMPIDX ���̺��� EMPNO ���� IDX_EMPIDX_EMPNO �ε����� �����Ͻÿ�.
CREATE INDEX IDX_EMPIDX_EMPNO ON EMPIDX(empno);
-- �ε����� �� �����Ǿ����� ������ ���� �並 ���� Ȯ���Ͻÿ�.
CREATE VIEW IDX_EMPIDX_EMPNO_VIEW AS SELECT *
FROM EMPIDX;
-- Ȯ��
SELECT * FROM USER_VIEWS;

-- �ǽ� 2
-- �ǽ�1���� ������ EMPIDX ���̺��� ������ �� �޿��� 1500 �ʰ��� ����鸸 ����ϴ� EMPIDX_OVER15K �並 ����
-- (�����ȣ, ����̸�, ��å,�μ���ȣ,�޿�,�߰����� ���)
CREATE VIEW EMPIDX_OVER15K AS SELECT empno, ename, job, deptno, sal, comm
FROM EMP WHERE SAL > 1500;
SELECT * FROM EMPIDX_OVER15K;

-- �ǽ� 3
DROP TABLE DEPTSEQ;
-- DEPT ���̺�� ���� ���� �� ������ ������ DEPTSEQ ���̺��� �ۼ��Ͻÿ�.
CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT;
SELECT * FROM DEPTSEQ;
-- ������ DEPTSEQ ���̺��� DEPTNO ���� ����� �������� �Ʒ��� ���õ� Ư���� ���� ������ ���ÿ�.
CREATE SEQUENCE DEPTSEQ_SEQ 
START WITH 1
INCREMENT BY 1
MAXVALUE 99
MINVALUE 1
NOCYCLE NOCACHE;

-- ���������� ������ DEPTSEQ�� ����Ͽ� �Ʒ��ʰ� ���� �� �� �μ��� ���ʴ�� �߰��Ѵ�.
INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ.nextval, 'DATABASE', 'SEOUL');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ.nextval, 'WEB', 'BUSAN');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ.nextval, 'MOBILE', 'ILSAN');

SELECT * FROM DEPTSEQ;
