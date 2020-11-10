

-------------------------- ### DDL ### --------------------------
-- DB ? 데이터 관리를 위한 테이블을 포함한 여러객체의 생성 / 수정 / 삭제 명령어
-- 생성 : CREATE / 수정 : ALTER / 삭제 : DROP 등등

---- # CREATE (생성) ----
-- 규칙 : 문자로 시작 / 30BYTE 이하 / 동일 사용자 소유 테이블명 중복 불가 / SQL 키워드 테이블명 불가

-- CREATE [키워드 or 소유계정.테이블명] (필드명1 자료형, 필드명2 자료형)
-- ┗ 키워드 : TALBE / USER / VIEW / SEQUENCE / INDEX ..
-- ┗ 자료형 : NUMBER / DATE / CHAR / VARCHAR2 / NCHAR / NVARCHAR2 ...

---- # ALTER (수정) ----
-- 규칙 : 이미 생성된 DB객체 변경 시 사용

-- 필드 추가
-- ALTER TABLE 테이블명 ADD [필드명] [자료형];
-- 필드명 변경
-- ALTER TALBE 테이블명 RENAME COLUMN [변경대상 필드명] TO [새이름];
-- 필드 자료형 변경
-- ALTER TABLE 테이블명 MODIFIY [필드명] [바꿀 데이터타입]
-- 특정 필드 삭제
-- ALTER TABLE 테이블명 DROP COLUMN 삭제할 필드명;

---- # RENAME (테이블 이름변경) ----
-- RENAME 테이블명 TO 새이름;

---- # TRUNCATE (테이블 데이터 삭제) ----
-- 대상 테이블 내 모든 데이터 삭제 / 테이블 구조는 보존
-- TRUNCATE TABLE 테이블명;

---- #DROP(테이블 객체 삭제) ----
-- DB 객체 삭제 / 테이블 자체를 삭제함.
-- DROP TABLE 테이블명;



--------------------------- ##### DML ##### --------------------------
-- DB ? 테이블의 데이터를 저장 / 수정 / 변경 / 삭제 하는 명령어 
-- 선택 : SELECT / 삽입 : INSERT / 변경 : UPDATE / 삭제 : DELETE

---------------------- ### DML - SELECT ### ----------------------
-- SELECT 필드 FROM 테이블;                 : 데이터 단순 SELECT
-- SELECT DISTINCT 필드 ~~;                : 중복데이터 삭제
-- SELECT 필드명 AS 별칭 ~~;                : 별칭부여(ALIAS)
-- SELECT 필드 FROM 테이블 ORDER BY 필드명(다중지정 가능) [ASC/DESC] : 순서로 정렬출력 ##메모리 많이 먹음

-- # SELECT 필드 FROM 테이블 WHERE 조건식 : 조건에 부합한 테이터 출력
-- ┗ WHERE 조건1 AND 조건2 / 조건1 OR 조건2 : JAVA ? AND/OR 동일
-- ┗ WHERE 조건식 - 산술연산자[ +, -, *, / ] 사용 可
-- ┗ WHERE 조건식 - 비교연산자[ >, >=, <, <=, =, !=, <>, ^= ] 사용 可
-- ┗ WHERE 조건식 - NOT / IN(특정 열에 여러개 조건 지정 가능) 
-- ┗ WHERE 조건식 - BETWEEN [A] AND [B] : A ~ B 사이의 범위 내 값 추출
-- ┗ WHERE 조건식 - LIKE [_] : 1개 문자데이터 / [%] 모든 문자데이터
-- ┗ WHERE 조건식 - IS NULL : 값 NULL인 행 추출

----------------------  # 연산자 & 함수 # ----------------------
-- # 집합연산자
-- SELECT 필드 FROM 테이블 WHERE 조건식 
-- 집합연산자 [UNION(중복값 제거 합집합) / UNION ALL(중복 포함 합집합) / MINUS(차집합) / INTERSECT(교집합)]
-- SELECT 필드 FROM 테이블 WHERE 조건식 

-- @ 오라클 함수
--  # 문자 함수
-- 대문자/소문자     :SELECT [UPPER(대문자)/LOWER(소문자)/INITCAP(첫글자 대문자)]필드명 ~~;
-- 문자열 수         :SELECT LENGTH(문자열) ~~; 문자열 글자 수  / LENGTH(문자열) ~~; 문자열 바이트 수
-- 특정위치 문자 출력 : SELECT 필드 SUBSTR(필드, $, *) ~~;  : $번째 글자부터 *개 글자 위치 출력
-- 특정문자 위치 확인 : SELECT 필드 INSTR('문자열', '대상 데이터', $) : $번째부터 대상데이터 추출
-- 문자열 대체출력    : SELECT '문자열' REPLACE('문자열', '추출문자', '대체문자') ~~;  ## 데이터 원본은 변경없이 출력만 대체
-- 문자열 연결       : SELECT CONCAT(필드, 필드) ~~; : CONCAT 내 CONCAT 가능
-- 특정문자 지우기    : SELECT '문자열1' || (L/R)TRIM ([LEADING/TRAILING/BOTH FROM]'문자열2') ||'문자열3' ~~;

--  # 숫자 함수
-- 반올림        : SELECT ROUND(숫자, 반올림위치) 
-- 버림          : SELECT TRUNC(숫자, 버림위치)
-- 작은 정수 반환 : SELECT CEIL(숫자)
-- 큰 정수 반환   : SELECT FLOOR(숫자)
-- 나머지값 반환  : SELECT MOD(나눗셈 될 숫자, 나눌 숫자)

--  # 날짜 함수
-- SELECT 날짜 데이터 + 숫자
-- SELECT 날짜 데이터 - 숫자
-- SELECT 날짜 데이터 - 날짜 데이터 : 날짜간 일 수 차이
-- XXX SELECT 날짜 데이터 - 날짜 데이터 XXX

-- SELECT ADD_MONTHS(날짜 데이터, 더할 개월 수)
-- SELECT MONTHS_BETWEEN(날짜 데이터1, 날짜 데이터2) : 데이터 간 날짜차이 개월수로 출력
-- SELECT NEXT_DAY(날짜 데이터, 요일문자) : 날짜 데이터 기준으로 돌아오는 요일 출력
-- SELECT LAST_DAY(날짜데이터) : 특정 날짜가 속한 달의 마지막날짜 출력

--  # 형 변환 함수
-- SELECT TO_CHAR   : 숫자 or 날짜 데이터 → 문자 데이터 변환
-- SELECT TO_NUMBER : 문자 데이터 → 숫자 데이터 변환
-- SELECT TO_NUMBER : 문자 데이터 → 날짜 데이터 변환

--  # NULL 처리 함수
-- SELECT NVL(검사대상 데이터 or 열, NULL일 경우 반환할 데이터)
-- SELECT NVL2(검사대상 데이터 or 열, NULL이 아닐 경우 반환할 데이터 or 계산식, NULL일경우 반화환할 데이터 or 계산식)

-- # DECODE / CASE : JAVA의 IF / ELSE IF / SWITCH CASE 와 비슷
-- SELECT 출력필드명 DECODE (대상필드, '조건값', '출력값') ~~;
-- ┗ '조건값'과 '출력값'은 필드 내 있는 데이터만큼 다중반영 가능

-- SELECT 출력필드명 CASE WHEN 조건식 THEN 출력값 END ~~;
-- ┗ 조건식 내 연산자 사용 가능

-- # 다중행 함수 : 여러 행을 종합하여 하나의 결과를 도출하는 함수
-- SUM : 합계 / COUNT : 개체 수 / MAX : 최대값 / MIN : 최소값 / AVG : 평균값
-- 다중행 함수([DISTINCT or ALL or 지정X] 필드)

-- # GROUP BY / HAVING
-- GROUP BY 필드명 (여러개 지정 가능) : 결과값을 필드명별로 묶음
-- HAVING 조건식 : GROUP BY로 그룹화된 결과값의 범위설정 / ##GROUP BY 절이 있어야 사용가능.

---------------------- # DML - JOIN # ----------------------
-- 조인 한 테이블에 같은 이름의 필드가 존재하는 경우 어느 테이블에 있는 필드인지 정확히 명시 할 것.

-- # INNER JOIN [내부조인(= 등가조인, 단순조인)] : 동일한 필드로 조인 (테이블A + 테이블B)
-- 방법1 | SELECT 필드명 FROM 테이블1 INNER JOIN 테이블2 ON 조인조건 WHERE 검색 조건;
-- 방법2 | SELECT 필드명 FROM 테이블1, 테이블2 WHERE 조인조건 AND 검색 조건;

-- # SELF JOIN [자체조인] : 동일 테이블끼리 조인 (테이블A + 테이블A)
-- 방법1 | SELECT 필드명 FROM 테이블 별칭1 INNER JOIN 테이블 별칭2 ON 조인조건 WHERE 검색 조건;
-- 방법2 | SELECT 필드명 FROM 테이블1, 테이블2 WHERE 조인조건 AND 검색 조건;

-- # OUTER JOIN [외부조인] : 테이블 조인 (테이블A + 테이블B)
-- (LEFT / RIGHT / FULL) OUTER JOIN -> LEFT / RIGHT OUTER JOIN의 개념 중 기준이 되는 테이블에 대한 이미지를 잡고 개념 이해 필요.
-- 표기법1 (신형표준) | SELECT 필드 FROM 테이블 (LEFT / RIGHT) OUTER JOIN 테이블 ON 조인조건;
-- 표기법2 (구형)    |  SELECT 필드 FROM 테이블, 테이블 WHERE 조인조건; <- 조인조건 내 필드명(+)로 LEFT / RIGHT 설정

---------------------- # DML - 서브쿼리 # ----------------------
-- 객체 안의 객체 개념 이해 필요.
-- SELECT / FROM 문 내부의 SELECT문

-- IN : "메인쿼리의 데이터"가 서브쿼리 결과 중 "하나라도 일치"할 경우 TRUE
-- ANY : "메인쿼리의 조건식"을 서브쿼리의 결과 중 "하나 이상 만족" 할 경우 TRUE
-- ALL : "메인쿼리 조건식"을 서브쿼리의 "결과가 모두 만족"하면 TRUE 
-- (NOT)EXISTS : 서브쿼리의 결과가 존재(데이터가 1개 이상일 경우)하면 TRUE


---------------------- ### DML - INSERT & UPDATE & DELETE ### ----------------------
-- 데이터 추가 : INSERT INTO 테이블(필드1, 필드2..) VALUES(필드1-데이터.. 필드2-데이터..);

-- 데이터 변경 : UPDATE 테이블 SET 대상필드1 = 데이터, 대상필드2 = 데이터.. WHERE 변경대상 지정조건식;

-- 데이터 삭제 : DELETE FORM 테이블 WHERE 삭제대상 지정 조건식;

---------------------- ### DML - 트랜잭션 ### ----------------------
-- ROLLBACK : CREATE 후 INTSERT / UPDATE / DELETE 작업내용 취소
-- COMMIT   : CREATE 후 INTSERT / UPDATE / DELETE 작업내용 확정

-- COMMIT 된 후 ROLLBACK 해도 이미 작업내용이 확정되었기 때문에 작업 전으로 돌아갈 수 없음.

-------------------------- ### DCL ### --------------------------
-- 데이터 사용 권한에 관한 명령어
-- 권한부여 : GRANT / 권한해제 : REVOKE



