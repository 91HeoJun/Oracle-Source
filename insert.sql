-- 회원가입, 게시물 등록, 입금 등등

-- 기존의 dept 테이블을 복사해서 dept_temp 테이블 생성
CREATE TABLE dept_temp AS SELECT * FROM dept;

-- 현재 테이블 조회
SELECT
    *
FROM dept_temp;

-- 데이터 추가하기 (방법1)
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES (50, 'DATABASE', 'SEOUL');

-- 데이터 추가하기 (방법2)
INSERT INTO dept_temp
VALUES(60, 'NETWORK', 'BUSAN');

-- NULL 삽입하기
-- 명시적으로 NULL 삽입
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES (70, 'DATABASE', NULL);

INSERT INTO dept_temp(DEPTNO, LOC)
VALUES (90, 'INCHEON');

-- 묵시적으로 NULL 삽입
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES (80, 'MOBILE', '');

-- 에러 1. SQL 오류: ORA-00947: 값의 수가 충분하지 않습니다
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES (50, 'DATABASE');
-- 에러 2. ORA-01438: 이 열에 대해 지정된 전체 자릿수보다 큰 값이 허용됩니다.
INSERT INTO dept_temp(DEPTNO, DNAME, LOC)
VALUES (500, 'DATABASE', 'SEOUL');


-- EMP 테이블 복사해서 EMP_TEMP 테이블 생성
CREATE TABLE emp_temp AS SELECT * FROM emp;
-- 현재 테이블 조회
SELECT *
FROM emp_temp;

-- 테이블 삭제
DROP TABLE emp_temp;

-- EMP 테이블을 복사하여 EMP 테이블을 생성하되 구조만 복사
CREATE TABLE emp_temp AS SELECT * FROM emp WHERE 1<>1;

DESC emp_temp;

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(9999, '홍길동', 'president', NULL, '20201109', 4000, NULL, 10 );

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(8888, '성춘향', 'president', NULL, '20201008', 3000, NULL, 10 );

-- 트랜잭션
COMMIT;    -- <- 최종반영
ROLLBACK;  -- <- 다시 되돌리기

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(7777, '유승호', 'MANAGER', NULL, TO_DATE('07/01/2010', 'DD/MM/YYYY'), 4000, NULL, 20 );

INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
VALUES(7777, '이순신', 'MANAGER', NULL, SYSDATE, 4000, NULL, 20 );

-- EMP 테이블에서 SALGRADE 테이블을 참조하여 급여등급이 1등급인 사원만 EMP_TABLE에 추가하고 싶다면
-- 서브쿼리 작성하기(데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치)
INSERT INTO emp_temp(empno, ename, job, mgr, hiredate, sal, comm, deptno)
SELECT empno, ename, job, mgr, hiredate, sal, comm, deptno
FROM emp E, salgrade S
WHERE E.sal BETWEEN S.losal AND S.hisal AND S.grade =1;



