
CREATE TABLE TEST (
    ID NUMBER(4),
    NAME VARCHAR2(3)
    );
    
    DESC TEST;

-- �ѱ��� ���� �ϳ��� 2����Ʈ ó��
INSERT INTO TEST VALUES (1000, 'ȫ�浿');
-- ����� ���� �ϳ��� 1����Ʈ ó��
INSERT INTO TEST VALUES (1000, 'ASD');

SELECT * FROM TEST;

-- ���� ���δٸ� ����Ʈ ó���� �����ϱ� ���� nchar, nvarchar2 �� ����.
-- NCHAR, NVARCHAR2 ���� : ������ ���̸� ��� �������� ����
-- NCHAR�� ���ڰ� 1�� �ԷµǾ 4�ڸ��� ��� ����.
CREATE TABLE TEST2 (
    ID NCHAR(4),
    NAME NVARCHAR2(3)
    );

INSERT INTO TEST2 VALUES ('Ȳ������', 'ȫ�浿');
SELECT * FROM TEST2;

CREATE TABLE TEST3 (
    ID NVARCHAR2(4),
    NAME NVARCHAR2(4),
    REG_DATE DATE
    );
    
INSERT INTO TEST3 VALUES ('Ȳ������', 'ȫ�浿', SYSDATE);
INSERT INTO TEST3 VALUES ('Ȳ������', 'ȫ�浿', '2020-11-09');
SELECT * FROM TEST3;

-- ���̺� �����ϱ�
-- CREATE TABLE ���̺�� (���̸� Ÿ��, .....);
-- CREATE TABLE ���̺�� AS SELECT * FROM emp WHERE deptno = 20;
-- CREATE TABLE ���̺�� AS SELECT * FROM emp WHERE 1<>1;

DESC EMP;

CREATE TABLE emp_ddl (
    empno NUMBER(4),
    ename varchar2(10),
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2)
    );
    
    DESC emp_ddl;

-- ALTER : ���̺� ����
-- �÷� �߰�
ALTER TABLE emp_ddl ADD HP VARCHAR2(20);

-- ���� �÷��� ����
ALTER TABLE emp_ddl RENAME COLUMN HP TO TEL;

-- ���� Ÿ�� ����
ALTER TABLE emp_ddl MODIFY empno NUMBER(5);

-- ���� �÷� ����
ALTER TABLE emp_ddl DROP COLUMN TEL;

-- ���̺�� ����
RENAME emp_ddl TO EMP_RENAME;
    DESC EMP_RENAME;
    
---------------------------------------------------------------------------

CREATE TABLE MEMBER (
    ID CHAR(8),
    NAME NVARCHAR2(10),
    ADDR NVARCHAR2(50),
    NATION NCHAR(4),
    EMAIL VARCHAR(50),
    AGE NUMBER(7)
    );
    
    DESC MEMBER;
    
ALTER TABLE MEMBER ADD BIGO VARCHAR2(20);
ALTER TABLE MEMBER MODIFY BIGO VARCHAR2(30);
ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;

INSERT INTO MEMBER 
VALUES ('HONG1234', 'ȫ�浿', '����� ���α� ������', '���ѹα�', 'hong123@naver.com', 25, null);
INSERT INTO MEMBER 
VALUES ('HONG1235', '�̽±�', '����� ������ ȭ�', '���ѹα�', 'asdf@naver.com', 26, null);
INSERT INTO MEMBER 
VALUES ('HONG1236', '��ȣ��', '����� ������ �����', '���ѹα�', 'qwer@naver.com', 27, null);
INSERT INTO MEMBER 
VALUES ('HONG1237', '�̼���', '��⵵ ��õ��', '���ѹα�', 'fghj@naver.com', 28, null);
INSERT INTO MEMBER 
VALUES ('HONG1238', '������', '����� ������ ��ġ��', '���ѹα�', 'vbnm@naver.com', 29, null);
INSERT INTO MEMBER 
VALUES ('HONG1239', '�迵ö', '����� ������ ������', '���ѹα�', 'ghkj@naver.com', 30, null);
INSERT INTO MEMBER 
VALUES ('HONG1210', '������', '����� ����� ���1��', '���ѹα�', 'tyui@naver.com', 33, null);
INSERT INTO MEMBER 
VALUES ('HONG1211', '��â��', '����� ��õ�� �ſ���', '���ѹα�', 'cvbn@naver.com', 34, null);
INSERT INTO MEMBER 
VALUES ('HONG1212', '������', '����� ������ ���', '���ѹα�', 'sdfg@naver.com', 35, null);
INSERT INTO MEMBER 
VALUES ('HONG1213', '�����', '��⵵ �ϻ굿�� �ϻ굿', '���ѹα�', 'asdf@naver.com', 10, null);
INSERT INTO MEMBER 
VALUES ('HONG1214', '���ȣ', '��õ�� ���� ���µ�', '���ѹα�', 'qwer@naver.com', 50, null);
INSERT INTO MEMBER 
VALUES ('HONG1215', '�ΰ���', '��⵵ ������ ����1��', '���ѹα�', 'wert@naver.com', 60, null);
INSERT INTO MEMBER 
VALUES ('HONG1216', '���̺�', '��⵵ ���ν� ���ﱸ', '���ѹα�', 'etry@naver.com', 80, null);

SELECT
    *
FROM member;

commit;