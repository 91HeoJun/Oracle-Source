

CREATE TABLE Usertbl(
    NO NUMBER(8) CONSTRAINT pk_usertbl PRIMARY KEY,
    USERNAME NCHAR(4) NOT NULL,
    BIRTHYEAR NUMBER(4) NOT NULL,
    ADDR NVARCHAR2(2) NOT NULL,
    MOBILE NCHAR(14)
);

CREATE SEQUENCE USERTBL_SEQ;

INSERT INTO USERTBL
VALUES (USERTBL_SEQ.NEXTVAL, 'ȫ�浿', 1955, '����', '010-1234-5678');
INSERT INTO USERTBL
VALUES (USERTBL_SEQ.NEXTVAL, '������', 1965, '�λ�', '010-4565-7896');
INSERT INTO USERTBL
VALUES (USERTBL_SEQ.NEXTVAL, '�ս¿�', 1975, '�뱸', '010-1122-4455');
INSERT INTO USERTBL
VALUES (USERTBL_SEQ.NEXTVAL, '�ŵ���', 1985, '��õ', '010-3322-4455');
INSERT INTO USERTBL
VALUES (USERTBL_SEQ.NEXTVAL, '�輮ȣ', 1995, '�Ȼ�', '010-9999-8751');

SELECT * FROM USERTBL;