
-- 데이터 사전 : 데이터베이스 메모리, 성능, 사용자, 권한, 객체와 같은 오라클 운영에 필요한 중요한 데이터가 보관된 장소

-- SCOTT 계정에서 사용 가능한 데이터 사전

SELECT * FROM DICT;

SELECT * FROM USER_TABLES;

SELECT * FROM ALL_TABLES;

-- 뷰 : 가상 테이블

CREATE VIEW vm_emp20 AS (SELECT empno, ename, job, deptno
                        FROM emp WHERE deptno=20);

SELECT * FROM vm_emp20; -- 내용은 서브쿼리로 지정한 필드를 그대로 가져옴.

-- 뷰 확인 
SELECT * FROM USER_VIEWS; 

CREATE VIEW vm_emp30all AS SELECT * FROM emp;

-- 생성된 뷰를 통해 INSERT 작업
INSERT INTO vm_emp30all
VALUES(7777, 'KIM', 'JUNKI', NULL, '20/10/19', 2650, NULL, 20);

SELECT * FROM vm_emp30all;
SELECT * FROM emp;

-- 뷰는 SELECT만 가능하도록 생성
CREATE VIEW vm_emp_read AS SELECT empno, ename, job 
FROM emp
WITH READ ONLY;

-- 생성된 뷰에 수정이 가능한가?
SELECT * 
FROM user_updatable_columns
WHERE table_name = 'VM_EMP30ALL';

SELECT * 
FROM SYS.user_updatable_columns
WHERE table_name = 'VM_EMP_READ';

-- 뷰를 사용하는 목적
-- 1. 보안 : 원본 테이블이 보유한 민감한 정보 제한
SELECT * FROM EMP; -- ex) SAL, COMM
-- 2. 서브쿼리, 조인과 같은 복잡한 쿼리 결과를 저장하여 사용
-- 3. 인덱스 : 색이니이기 떄문에 SELECT문의 효과를 높임

-- SCOTT 계정이 소유한 인덱스 정보 보기
SELECT * FROM user_indexes;

-- 기본키 생성 => 자동 인덱스가 됨
-- 인덱스 생성(emp 테이블의 sal 열에 인덱스 생성)
CREATE INDEX idx_emp_sql ON emp(sal);
SELECT * FROM emp WHERE sal=1250;


CREATE TABLE USERTBL(
    userID CHAR(8) NOT NULL PRIMARY KEY,
    userNAME NVARCHAR2(10) NOT NULL,
    birthyear NUMBER(4) NOT NULL,
    mobile CHAR(3)
);

SELECT * FROM user_indexes;

-- 시퀀스 : 특정 규칙에 맞는 연속 숫자 생성
-- ┗ 게시글 번호 / 상품번호 / 주문번호.... 에 쓰임
CREATE SEQUENCE DEPT_SEQ
INCREMENT BY 10     -- 10씩 증가
START WITH 10       -- 처음 시작 숫자
MAXVALUE 90         -- 마지막 숫자
MINVALUE 0          -- START 값보다 작게 설정
NOCYCLE CACHE 2;    -- 반복하지 않음 / CACHE = 미리 생성할 것인지 여부

CREATE TABLE DEPT_SEQ_TBL AS SELECT * FROM DEPT WHERE 1<>1;

-- 시퀀스를 이용하여 삽입
SELECT * FROM dept_seq_tbl;
INSERT INTO dept_seq_tbl VALUES(DEPT_SEQ.nextval, 'DATABASE', 'SEOUL');

-- 시퀀스 수정
ALTER SEQUENCE DEPT_SEQ INCREMENT BY 3 MAXVALUE 99 CYCLE;

-- 마지막 발행된 시퀀스 확인하기
SELECT DEPT_SEQ.CURRVAL FROM DUAL;

--------------------------------------------------------------------------------------------------------------------

-- SYNONYM(동의어) : 공식 별칭
-- 테이블, 뷰, 시퀀스 등 객체들에게 대신 사용할수 있는 이름 부여

CREATE SYNONYM E FOR emp;

SELECT * FROM E;

DROP SYNONYM E;

--------------------------------------------------------------------------------------------------------------------
-- 실습1
--EMP테이블과 같은 구조의 데이터를 저장하는 EMPIDX 테이블을 생성하시오.
CREATE TABLE EMPIDX AS SELECT * FROM emp WHERE 1<>1;
SELECT * FROM EMPIDX;
-- 생성한 EMPIDX 테이블의 EMPNO 열에 IDX_EMPIDX_EMPNO 인덱스를 생성하시오.
CREATE INDEX IDX_EMPIDX_EMPNO ON EMPIDX(empno);
-- 인덱스가 잘 생성되었는지 데이터 사전 뷰를 통해 확인하시오.
CREATE VIEW IDX_EMPIDX_EMPNO_VIEW AS SELECT *
FROM EMPIDX;
-- 확인
SELECT * FROM USER_VIEWS;

-- 실습 2
-- 실습1에서 생성한 EMPIDX 테이블의 데이터 중 급여가 1500 초과인 사원들만 출력하는 EMPIDX_OVER15K 뷰를 생성
-- (사원번호, 사원이름, 직책,부서번호,급여,추가수당 출력)
CREATE VIEW EMPIDX_OVER15K AS SELECT empno, ename, job, deptno, sal, comm
FROM EMP WHERE SAL > 1500;
SELECT * FROM EMPIDX_OVER15K;

-- 실습 3
DROP TABLE DEPTSEQ;
-- DEPT 테이블과 같은 열과 행 구성을 가지는 DEPTSEQ 테이블을 작성하시오.
CREATE TABLE DEPTSEQ AS SELECT * FROM DEPT;
SELECT * FROM DEPTSEQ;
-- 생성한 DEPTSEQ 테이블의 DEPTNO 열에 사용할 시퀀스를 아래에 제시된 특성에 맞춰 생성해 보시오.
CREATE SEQUENCE DEPTSEQ_SEQ 
START WITH 1
INCREMENT BY 1
MAXVALUE 99
MINVALUE 1
NOCYCLE NOCACHE;

-- 마지막으로 생성한 DEPTSEQ를 사용하여 아래쪽과 같이 세 개 부서를 차례대로 추가한다.
INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ.nextval, 'DATABASE', 'SEOUL');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ.nextval, 'WEB', 'BUSAN');
INSERT INTO DEPTSEQ VALUES(DEPTSEQ_SEQ.nextval, 'MOBILE', 'ILSAN');

SELECT * FROM DEPTSEQ;
