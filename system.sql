-- scott 계정 암호 지정/계정 해제하기
ALTER USER scott identified by tiger account unlock;

-- HR 계정 암호 지정/계정 해제하기
alter user HR identified by 12345 account unlock;

-- 대소문자 구분 없음
-- 키워드는 대문자로 쓰는 경향이 있음


-- 데이터 사전
-- DBA : SYS, SYSTEM만 볼 수 있음(DB관리를 위한 정보)
SELECT *
FROM DBA_TABLES;

-- SCOTT에게 CREATE VIEW 권한 부여
-- DCL
GRANT CREATE VIEW TO SCOTT;
GRANT CREATE SYNONYM TO SCOTT;
GRANT CREATE PUBLIC SYNONYM TO SCOTT;

-- 새로운 사용자 생성 (= 새로운 스키마(데이터베이스) 생성)
CREATE USER TEST IDENTIFIED BY 12345;

-- 접속 권한 부여(개별권한 부여)
GRANT CREATE SESSION TO TEST;

-- 여러 작업 권한을 가지고 있는 롤 부여
GRANT CONNECT, RESOURCE TO TEST;