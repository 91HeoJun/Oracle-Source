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