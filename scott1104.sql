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
SELECT CONCAT (empno, ename), CONCAT(empno, CONCAT(':',ename))
-- CONCAT은 2개까지 가능하므로 추가로 더 할 경우 CONCAT 안에 CONCAT을 생성할것
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

-------------------------------------------------------------------------------------------

-- 2. 숫자 함수 : ROUND(반올림) / TRUNC(버림) / CEIL(입력된 숫자와 가까운 큰 정수) / FLOOR(입력된 숫자와 가까운 작은 정수), MOD(나머지)

-- ROUND(반올림)
SELECT ROUND(1234.5678) AS ROUND,
    ROUND(1234.5678, 0) AS ROUND_1,
    ROUND(1234.5678, 1) AS ROUND_1,
    ROUND(1234.5678, -1) AS ROUND_MINUS,
    ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

-- TRUNC(버림)
SELECT TRUNC(1234.5678) AS TRUNC,
TRUNC(1234.5678, 0) AS TRUNC_1,
TRUNC(1234.5678, 1) AS TRUNC_2,
TRUNC(1234.5678, -1) AS TRUNC_MINUS,
TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

-- CEIL / FLOOR
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(3.14)
FROM DUAL;

-- MOD
SELECT MOD(15,6), MOD(10,2), MOD(11,2)
FROM DUAL;

-------------------------------------------------------------------------------------------
-- 3. 날짜함수 : SYSDATE, CURRENT_DATE, CURRENT_TIMESTAMP, ADD_MONTHS

SELECT sysdate, current_date, current_timestamp
FROM DUAL;

-- 날짜 데이터는 연산이 가능함 : 날짜 데이터 +1, -1, 날짜데이터 - 날짜데이터
-- 날짜 데이터 + 날짜데이터는 불가
SELECT SYSDATE AS NOW, SYSDATE - 1 AS YESTERDAY, SYSDATE + 1 AS TOMORROW
FROM DUAL;

-- ADD_MONTHS
SELECT SYSDATE AS NOW, ADD_MONTHS (SYSDATE, 3)
FROM DUAL;

-- 입사 10주년 사원 조회
SELECT empno, ename, hiredate, ADD_MONTHS(hiredate, 120)
FROM emp;

-- 입사 38년 미만 사원 조회
SELECT empno, ename, hiredate
FROM emp
WHERE ADD_MONTHS(hiredate, 456) > SYSDATE;

-- 날짜함수 : MONTHS_BETWEEN(@, @) - 두 날짜 사이의 차이
SELECT empno, ename, hiredate
FROM emp
WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 456;

SELECT empno, ename, hiredate, SYSDATE, MONTHS_BETWEEN(hiredate, SYSDATE) AS MONTHS1,
    MONTHS_BETWEEN(SYSDATE, hiredate) AS MONTHS2,
    TRUNC(MONTHS_BETWEEN(SYSDATE, hiredate))
FROM emp;

-- 날짜함수 : NEXT_DAY, LAST_DAY
SELECT SYSDATE, NEXT_DAY(SYSDATE, '월요일'), LAST_DAY(SYSDATE)
FROM DUAL;

-------------------------------------------------------------------------------------------

-- 4. 형변환 함수 : TO_CHAR(날짜, 숫자데이터 → 문자) / TO_NUMBER(문자데이터 → 숫자) / TO_DATE(문자데이터 → 날짜)

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS 현재날짜
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MM') AS 현재날짜 -- 전체 날짜를 갖고 있으나, 출력은 MM or DD로
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON') AS 현재날짜 -- 월 + 요일 출력
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') AS 현재날짜 -- 요일 출력
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS 현재날짜 -- Defult는 12시간제
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH12:MI:SS') AS 현재날짜
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS 현재날짜 -- 24시간제 가능
FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS PM') AS 현재날짜 -- 24시간제 + AM or PM 입력 시 오전, 오후 출력 가능
FROM DUAL;

-- 실습 : 오늘 날짜를 년 / 월 / 일 / 시 : 분 : 초 출력
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/SS HH:MI:SS') AS 현재날짜시간
FROM DUAL;

SELECT 1300 - TO_NUMBER('1500'), to_number('1300') + 1500
FROM DUAL;

SELECT 1,300 - '1500', '1300' + 1,500 -- 필드 구분을 ','로 하기에 TO_NUMBER로 숫자변환 후 연산하는 것이 정확함
FROM DUAL;

-- SELECT TO_NUMBER('1,300') - TO_NUMBER('1,500') FROM DUAL; <- X
SELECT TO_NUMBER('1,300', '999,999,999') - to_number('1,500', '999,999')
FROM DUAL;

SELECT SAL, TO_CHAR(SAL, '$999,999') AS SAL_$,
    TO_CHAR(SAL, 'L999,999') AS SAL_L,      -- L:지역화폐 통화기호
    TO_CHAR(SAL, '$999,999') AS SAL_1,      -- $:달러 통화기호
    TO_CHAR(SAL, '000,999,999.00') AS SAL_2,-- 앞자리를 0으로 채움 
    TO_CHAR(SAL, '000999,999.99') AS SAL_3, -- 뒷자리를 0으로 채움
    TO_CHAR(SAL, '999,999,00') AS SAL_4     -- 
FROM emp;


SELECT TO_DATE('2020-11-05', 'YYYY/MM/DD') AS TODATE1,
    TO_DATE('20201105', 'YYYY-MM-DD') AS TODATE2
FROM DUAL;

-- 1981-06-01 이후 입사사원 정보 조회
SELECT *
FROM emp
WHERE hiredate > TO_DATE('19810601', 'YYYY/MM/DD');

SELECT TO_DATE('2019-12-20') - TO_DATE('2019-10-20')
FROM DUAL;

-------------------------------------------------------------------------------------------

-- 5. NULL처리 함수 : NVL, NVL2
SELECT empno, ename, sal, comm, sal+comm
FROM emp;

-- NVL 함수는 값이 null인 경우 지정값을 출력
SELECT empno, ename, sal, comm, sal+comm, NVL(comm, 0), sal+NVL(comm, 0)
FROM emp;

-- NVL2 함수는 null이 아닌경우 지정값1을  출력하고, null인 경우 지정값2을 출력
SELECT empno, ename, sal, comm, NVL2(comm, '0', 'X'), sal+NVL2(comm, sal*12+comm, sal*12) AS ANNSAL
FROM emp;

-------------------------------------------------------------------------------------------

-- 6. DECODE함수와 CASE문 (JAVA에서의 if / else if / SWITCH&CASE 와 비슷한 기능)
-- JOB 이 MANAGER, SALESMAN, ANALYST 인 경우 각각의 다른 비율을 적용할 경우

-- DECODE
SELECT empno, ename, job, sal, DECODE(job, 'MANAGER', SAL*1.1, 
                                        'SALESMAN', SAL*1.05,
                                        'ANALYST', SAL,
                                        SAL*1.03) AS UPSAL
FROM emp;

-- CASE
SELECT empno, ename, job, sal, CASE job
                                    WHEN 'MANAGER' THEN SAL*1.1
                                    WHEN 'SALESMAN' THEN SAL*1.05
                                    WHEN 'ANALYST' THEN SAL
                                    ELSE SAL*1.03
                                END AS UPSAL
FROM emp;


SELECT empno, ename, job, sal, CASE
                                    WHEN comm IS NULL THEN '해당사항 없음'
                                    WHEN comm = 0 THEN '수당 없음'
                                    WHEN comm > 0 THEN '수당 : ' || comm
                                END AS COMM_TEXT
FROM emp;
