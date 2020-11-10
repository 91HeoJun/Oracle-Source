-- scott ���� ��ȣ ����/���� �����ϱ�
ALTER USER scott identified by tiger account unlock;

-- HR ���� ��ȣ ����/���� �����ϱ�
alter user HR identified by 12345 account unlock;

-- ��ҹ��� ���� ����
-- Ű����� �빮�ڷ� ���� ������ ����


-- ������ ����
-- DBA : SYS, SYSTEM�� �� �� ����(DB������ ���� ����)
SELECT *
FROM DBA_TABLES;

-- SCOTT���� CREATE VIEW ���� �ο�
-- DCL
GRANT CREATE VIEW TO SCOTT;
GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;

-- ���ο� ����� ���� (= ���ο� ��Ű��(�����ͺ��̽�) ����)
CREATE USER TEST IDENTIFIED BY 12345;

-- ���� ���� �ο�(�������� �ο�)
GRANT CREATE SESSION TO TEST;

-- ���� �۾� ������ ������ �ִ� �� �ο�
GRANT CONNECT, RESOURCE TO TEST;