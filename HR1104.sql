-- HR 계정이 가지고 있는 모든 테이블 보기
select * from tab;

-- 테이블의 구조를 확인 키워드 DESC
DESC EMPLOYEES;

-- employees 테이블 전체 내용 조회
SELECT * FROM employees; 

-- employees 테이블의 first_name, last_name, job_id 만 조회
SELECT first_name, last_name, job_id FROM employees;

SELECT last_name, department_id FROM employees WHERE employee_id = 176;

SELECT last_name, salary FROM employees WHERE salary >= 12000;

SELECT last_name, SALARY FROM employees WHERE SALARY < 5000 OR SALARY > 12000;

-------------------------------------------------------------------------------------------------------------------------------------

-- 실습 1 : 
SELECT last_name, department_id FROM employees WHERE department_id IN(20, 50) ORDER BY FIRST_NAME ASC;

-- 실습 2 : 커미션 버는 직원 LAST_NAME, SALALY,COMMITION 조회 (연봉 기준 and 커미션 및 정렬)
SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct > 0 ORDER BY salary DESC, commission_pct;

-- 실습 3 : 연봉 2500 / 3500 / 7000이 아니며 직업이 SA_REP or ST_CLERK
SELECT * FROM employees WHERE job_id IN('SA_REP', 'ST_CLERK') AND salary NOT IN(2500, 3500, 7000);

-- 실습 3 : 2008/02/20 ~ 2008/05/01 고용된 사원 LAST_NAME, 사원번호, 고용일자 조회 (고용일자 기준 내림차순 정렬)
SELECT last_name, employee_id, hire_date FROM employees WHERE hire_date >= '20080220' AND hire_date <= '20080501' ORDER BY hire_date DESC;

-- 2004 고용된 사람 전부 LAST_NAEM 및 고용일 조회 (입사일 기준 오름차순 정렬)
SELECT last_name, hire_date FROM employees WHERE hire_date > '20040101' AND hire_date < '20050101' ORDER BY hire_date ASC;