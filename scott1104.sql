-- SCOTT 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- 테이블의 구조를 확인 : DESC
DESC emp;

-- emp 테이블의 모든 내용 조회
SELECT * FROM emp;

-- emp 테이블의 틀정 필드만 조회
SELECT ename, job, sal FROM emp;

-- 중복 레코드 제거 : DISTINCT
SELECT DISTINCT deptno FROM emp;

-- 별칭(ALAIS)부여 : AS 
SELECT empno AS 사원번호 FROM emp;

-- SELECT 시 연산자를 이용한 연산 가능
SELECT ename AS 이름, sal AS 급여, sal*12+comm AS 연봉, comm AS 보너스 FROM emp;

-- 쿼리문에 바로 띄어쓰기 입력 시 에러 -> 띄어쓰기 할 시 "" 로 입력할 것.
SELECT ename AS 이름, job AS "직 책" FROM emp;

-- 정렬하여 조회(오름차순) : ODER BY
-- 하나의 열로 기준을 주어 오름차순(ASC) 조회
SELECT ename, sal FROM emp ORDER BY sal ASC;
-- 전체 데이터 조회(사원번호 오름차순)
SELECT * FROM emp ORDER BY empno ASC;

-- 하나의 열로 기준을 주어 내림차순 조회
SELECT ename, sal FROM emp ORDER BY sal DESC;

-- 부서번호의 오름차순이며, 부서번호 동일 시 급여의 내림차순 조회
SELECT * FROM emp ORDER BY deptno ASC, sal DESC;

-- 실습 1번
SELECT * FROM emp;

-- 실습 2, 3번
SELECT empno AS EMPLOYEE_NO, ename AS EMPLOYEE_NAME, job, mgr AS MANAGER, hiredate, sal AS SALARY, comm AS COMMISSION, deptno AS DEPARTMENT_NO FROM emp ORDER BY deptno DESC, ename ASC;

-- 조회 시 기준 부여 : WHERE
SELECT * FROM emp WHERE deptno = 30;
SELECT * FROM emp WHERE empno = 7782;

-- AND 실습
SELECT * FROM emp WHERE deptno = 30 AND job = 'SALESMAN';
SELECT * FROM emp WHERE empno = 7499 AND deptno = 30;

-- OR 실습
SELECT * FROM emp WHERE deptno = 30 OR job = 'CLERK';
SELECT * FROM emp WHERE deptno = 20 OR job = 'SALESMAN';

-- 산술연산자를 이용한 조회(+ ,-, /, *)
SELECT * FROM emp WHERE sal*12=36000;

-- 관계연산자를 이용한 조회(<, >, =)
SELECT * FROM emp WHERE sal > 3000;
SELECT * FROM emp WHERE sal >= 3000;

-- 관계연산자(알파벳 순서)
SELECT * FROM emp WHERE ename >= 'F';

-- 논리연산자 : AND, OR
-- SAL 2500 AND JOB ANALYST
SELECT * FROM emp WHERE 25 <= 2500 AND job = 'ANALYST';

-- JOB MANAGER, SALESMAN, CLERK
SELECT * FROM emp WHERE job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';
