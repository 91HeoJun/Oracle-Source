
CREATE TABLE TEST (
    ID NUMBER(4),
    NAME VARCHAR2(3)
    );
    
    DESC TEST;

-- 한글은 글자 하나당 2바이트 처리
INSERT INTO TEST VALUES (1000, '홍길동');
-- 영어는 글자 하나당 1바이트 처리
INSERT INTO TEST VALUES (1000, 'ASD');

SELECT * FROM TEST;

-- 언어마다 서로다른 바이트 처리를 보완하기 위해 nchar, nvarchar2 가 등장.
-- NCHAR, NVARCHAR2 차이 : 고정된 길이를 상시 보유성의 차이
-- NCHAR는 글자가 1만 입력되어도 4자리를 상시 유지.
CREATE TABLE TEST2 (
    ID NCHAR(4),
    NAME NVARCHAR2(3)
    );

INSERT INTO TEST2 VALUES ('황보강성', '홍길동');
SELECT * FROM TEST2;

CREATE TABLE TEST3 (
    ID NVARCHAR2(4),
    NAME NVARCHAR2(4),
    REG_DATE DATE
    );
    
INSERT INTO TEST3 VALUES ('황보강성', '홍길동', SYSDATE);
INSERT INTO TEST3 VALUES ('황보강성', '홍길동', '2020-11-09');
SELECT * FROM TEST3;

-- 테이블 생성하기
-- CREATE TABLE 테이블명 (열이름 타입, .....);
-- CREATE TABLE 테이블명 AS SELECT * FROM emp WHERE deptno = 20;
-- CREATE TABLE 테이블명 AS SELECT * FROM emp WHERE 1<>1;

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

-- ALTER : 테이블 변경
-- 컬럼 추가
ALTER TABLE emp_ddl ADD HP VARCHAR2(20);

-- 기존 컬럼명 변경
ALTER TABLE emp_ddl RENAME COLUMN HP TO TEL;

-- 기존 타입 변경
ALTER TABLE emp_ddl MODIFY empno NUMBER(5);

-- 기존 컬럼 삭제
ALTER TABLE emp_ddl DROP COLUMN TEL;

-- 테이블명 변경
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
VALUES ('HONG1234', '홍길동', '서울시 구로구 개봉동', '대한민국', 'hong123@naver.com', 25, null);
INSERT INTO MEMBER 
VALUES ('HONG1235', '이승기', '서울시 강서구 화곡동', '대한민국', 'asdf@naver.com', 26, null);
INSERT INTO MEMBER 
VALUES ('HONG1236', '강호동', '서울시 마포구 상수동', '대한민국', 'qwer@naver.com', 27, null);
INSERT INTO MEMBER 
VALUES ('HONG1237', '이수근', '경기도 부천시', '대한민국', 'fghj@naver.com', 28, null);
INSERT INTO MEMBER 
VALUES ('HONG1238', '서장훈', '서울시 강남구 대치동', '대한민국', 'vbnm@naver.com', 29, null);
INSERT INTO MEMBER 
VALUES ('HONG1239', '김영철', '서울시 도봉구 도봉동', '대한민국', 'ghkj@naver.com', 30, null);
INSERT INTO MEMBER 
VALUES ('HONG1210', '김장훈', '서울시 노원구 노원1동', '대한민국', 'tyui@naver.com', 33, null);
INSERT INTO MEMBER 
VALUES ('HONG1211', '임창정', '서울시 양천구 신월동', '대한민국', 'cvbn@naver.com', 34, null);
INSERT INTO MEMBER 
VALUES ('HONG1212', '김종국', '서울시 강남구 도곡동', '대한민국', 'sdfg@naver.com', 35, null);
INSERT INTO MEMBER 
VALUES ('HONG1213', '김범수', '경기도 일산동구 일산동', '대한민국', 'asdf@naver.com', 10, null);
INSERT INTO MEMBER 
VALUES ('HONG1214', '김경호', '인천시 서구 가좌동', '대한민국', 'qwer@naver.com', 50, null);
INSERT INTO MEMBER 
VALUES ('HONG1215', '민경훈', '경기도 수원시 수원1동', '대한민국', 'wert@naver.com', 60, null);
INSERT INTO MEMBER 
VALUES ('HONG1216', '바이브', '경기도 용인시 기흥구', '대한민국', 'etry@naver.com', 80, null);

SELECT
    *
FROM member;

commit;