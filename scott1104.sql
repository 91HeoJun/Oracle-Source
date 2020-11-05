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

-- 부서번호의 ASC(오름차순)이며, 부서번호 동일 시 급여의 DESC(내림차순) 조회
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

-- JOB MANAGER or SALESMAN or CLERK
SELECT * FROM emp WHERE job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';

-- 등가연산자 : 양쪽 항목이 같은지 검사(==, !=, !)
-- SAL !3000 사원 출력 | 하기 내용 동일 결과 ---
SELECT * FROM emp WHERE sal != 3000;
SELECT * FROM emp WHERE sal <> 3000;
SELECT * FROM emp WHERE sal ^= 3000;

-------------------------------------------------------------------------------------------

-- IN 연산자
SELECT * FROM emp WHERE job IN('MANAGER','SALESMAN','CLERK');
SELECT * FROM emp WHERE job = 'MANAGER' OR job = 'SALESMAN' OR job = 'CLERK';
SELECT * FROM emp WHERE deptno IN(10, 20);

-- NOT IN 연산자
SELECT * FROM emp WHERE job NOT IN('MANAGER','SALESMAN','CLERK');
SELECT * FROM emp WHERE job != 'MANAGER' AND job != 'SALESMAN' AND job != 'CLERK';

-------------------------------------------------------------------------------------------

-- BETWEEN a AND b
-- 급여 2000 이상, 3000 이하인 사원 조회
-- 방법1 : 등가연산자를 통한 표현
SELECT * FROM emp WHERE sal >= 2000 AND sal <= 3000;
-- 방법2 : BETWEEN 표현
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000;

-- 급여 2000 이상 3000 이하가 아닌 사원 조회
-- 방법 : NOT + BETWEEN
SELECT * FROM emp WHERE sal NOT BETWEEN 2000 AND 3000;

-------------------------------------------------------------------------------------------

-- LIKE 문자열 검색 사용 (S로 시작하는 @@, H로 끝나는 @@, 가운데에 T가 있으면 @@)
-- 사원 이름 S로 시작하는 모든 사원 조회하기 ('' 내용은 대소문자 구분함)
SELECT * FROM emp WHERE ename LIKE 'S%';

-- 사원이름 두 번째 글자가 L인 사원만 조회
SELECT * FROM emp WHERE ename LIKE '_L%';

-- 사원 이름에 AM이 포함된 사원 조회
SELECT * FROM emp WHERE ename LIKE '%AM%';

-- 사원 이름에 AM이 포함되지 않은 사원 조회
SELECT * FROM emp WHERE ename NOT LIKE '%AM%';

-------------------------------------------------------------------------------------------

-- IS NULL
SELECT * FROM emp WHERE comm = null; -- 불가
SELECT * FROM emp WHERE comm IS null; -- 가능

-- mgr 이 NULL 인 사원 조회
SELECT * FROM emp WHERE mgr IS null;

-- mgr 이 NULL 이 아닌 사원 조회
SELECT * FROM emp WHERE mgr IS NOT null;

-------------------------------------------------------------------------------------------

-- 집합연산자 : 합집합(UNION), 교집합(INTERSECT), 차집합(MINUS)

-- 합집합(UNION) : DEPTNO가 10인 테이블과 DEPTNO가 20인 결과를 합해서 출력
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10
UNION -- UNION [ALL(중복까지 전체 출력) / SELECT / WITH]
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 20;

-- 차집합(MINUS) : 부서번호가 10이 아닌 사원 조회
SELECT empno, ename, sal, deptno FROM emp
MINUS
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

-- 교집합(INTERSECT) : 부서 번호가 10인 사원 조회
SELECT empno, ename, sal, deptno FROM emp
INTERSECT
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

-- 20, 30번 부서번호 보유 사원 중 SAL이 2000 초과인 사원의 사번, 이름, 급여, 부서번호 출력 | SELECT문 두 가지 사용 
-- 집합 연산자 미사용
SELECT empno, ename, sal, deptno FROM emp WHERE deptno IN(20, 30) AND sal > 2000;

-- 집합 연산자 미사용
-- 차집합
SELECT empno, ename, sal, deptno FROM emp WHERE sal > 2000
MINUS
SELECT empno, ename, sal, deptno FROM emp WHERE deptno = 10;

-- 합집합
SELECT empno, ename, sal, deptno FROM emp WHERE sal > 2000 AND deptno = 20
UNION
SELECT empno, ename, sal, deptno FROM emp WHERE sal > 2000 AND deptno = 30;

-- 합집합 
SELECT empno, ename, sal, deptno FROM emp
INTERSECT
SELECT empno, ename, sal, deptno FROM emp WHERE deptno IN(20, 30) AND sal > 2000;

-------------------------------------------------------------------------------------------

-- 오라클 함수
-- 1. 문자 함수 : UPPER / LOWER / INITCAP / LENGTH / LENGTHB / SUBSTR / INSTR / REPLACE / CONCAT / TRIM / REVERSE

-- ENAME 을 UPPER / LOWER / INITCAP 로 변환 조회
SELECT ename, UPPER(ename), LOWER(ename), INITCAP(ename) FROM emp;

-- DUAL 테이블 이용 (SYS 내장 테이블로 임시연산 혹은 함수 결과 값 확인 용도로 이용)
SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;

-- 직책 6글자 이상 사원 조회
SELECT * FROM emp WHERE LENGTH(job) >= 6;

-- SUBSTR(문자열 추출)
SELECT job, SUBSTR(job, 1, 2 ), SUBSTR(job, 3, 2), SUBSTR(job, 5) FROM emp;
-- -LENGTH(JOB) = -5
SELECT job, SUBSTR(job, -LENGTH(JOB)), SUBSTR(job, -LENGTH(JOB),2), SUBSTR(job, -3) FROM emp;

-- INSTR (특정문자 위치 찾기)
SELECT INSTR('HELLO, ORACLE!','L') AS INSTR_1,
INSTR('HELLO, ORACLE!','L', 5) AS INSTR_2,
INSTR('HELLO, ORACLE!','L', 2, 2) AS INSTR_3
FROM DUAL;

-- REPLACE(찾아서 바꾸기)
SELECT REPLACE('이것이 Oracle이다','이것이','THIS IS')
FROM DUAL;

SELECT '010-1234-5678' AS REPLACE_BEFORE,
REPLACE('010-1234-5678', '-', ' ') AS REPLACE_1,
REPLACE('010-1234-5678', '-') AS REPLACE_2
FROM DUAL;

-- CONCAT(연결)
-- empno, ename을 연결하여 조회
SELECT CONCAT (empno, ename), CONCAT(empno, CONCAT(':',ename)) -- CONCAT은 2개까지 가능하므로 추가로 더 할 경우 CONCAT 안에 CONCAT을 생성할것
FROM emp
WHERE ename = 'SCOTT';

-- || : 연결의 의미로 사용됨
SELECT empno || ename, empno || ':' || ename
FROM emp
WHERE ename = 'SCOTT';

-- TRIM(공백 제거), LTRIM(좌측 공백 제거), RTRIM(우측 공백 제거)
SELECT '   이것이   ', TRIM('      이것이      ')
FROM DUAL;

-- REVERSE(문자열 역출력)
SELECT REVERSE('Oracle') FROM DUAL;

