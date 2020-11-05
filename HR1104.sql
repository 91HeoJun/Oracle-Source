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

SELECT last_name, SALARY FROM employees WHERE salary < 5000 OR salary > 12000;
SELECT last_name, SALARY FROM employees WHERE salary BETWEEN 5000 AND 12000 ORDER BY salary;


-------------------------------------------------------------------------------------------------------------------------------------

-- 실습 1 : 20번 50번 부서에서 근무하는 사원들 LAST_NAME및 부서번호 알파벳 순으로 정렬
SELECT last_name, department_id FROM employees WHERE department_id IN(20, 50) ORDER BY last_name, department_id;
-- 실습 1 - 1  : 연봉 5000 ~ 12000 범위 안 20번 50번 부서에서 근무하는 사원들 LAST_NAME및 연봉 조회(연봉 기준 오름차순)
SELECT last_name, salary FROM employees WHERE salary BETWEEN 5000 AND 12000 AND department_id IN(20, 50) ORDER BY salary;


-- 실습 2 : 커미션 버는 직원 LAST_NAME, SALALY,COMMITION 조회 (연봉 기준 and 커미션 및 정렬)
SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct > 0 ORDER BY salary DESC, commission_pct;

-- 실습 3 : 연봉 2500 / 3500 / 7000이 아니며 직업이 SA_REP or ST_CLERK
SELECT * FROM employees WHERE job_id IN('SA_REP', 'ST_CLERK') AND salary NOT IN(2500, 3500, 7000);

-- 실습 4 : 2008/02/20 ~ 2008/05/01 고용된 사원 LAST_NAME, 사원번호, 고용일자 조회 (고용일자 기준 내림차순 정렬)
SELECT last_name, employee_id, hire_date FROM employees WHERE hire_date >= '20080220' AND hire_date <= '20080501' ORDER BY hire_date DESC;

-- 실습 5 : 2004 고용된 사람 전부 LAST_NAEM 및 고용일 조회 (입사일 기준 오름차순 정렬)
SELECT last_name, hire_date FROM employees WHERE hire_date > '20040101' AND hire_date < '20050101' ORDER BY hire_date ASC;
SELECT last_name, hire_date FROM employees WHERE hire_date BETWEEN '20040101' AND '20050101' ORDER BY hire_date ASC;

-- 실습 6 : 연봉 5000 ~ 12000 범위 이외 사람들의 LAST_NAME, SALARY 조회
SELECT last_name, salary FROM employees WHERE salary NOT BETWEEN 5000 AND 12000 ORDER BY salary DESC;

-------------------------------------------------------------------------------------------------------------------------------------

-- 실습 7 : 2004년도 고용된 모든사람들의 LAST_NAME 및 고용일 조회하여 입사일 기준 오름차순 정렬
SELECT last_name, hire_date FROM employees WHERE hire_date LIKE '04%' ORDER BY hire_date;

-- 실습 8 : LAST_NAME에 u가 포함된 사원들의 사번 및 LAST_NAME 조회
SELECT employee_id, last_name FROM employees WHERE last_name LIKE '%u%'; 

-- 실습 9 : LAST_NAME 상 U가 포함된 사원들의 사번 & LAST_NAME 조회
SELECT employee_id, last_name FROM employees WHERE last_name LIKE '%U%';

-- 실습 10 : LAST_NAME에 4번쨰 글자가 a인 사원들의 LAST_NAME 조회
SELECT last_name FROM employees WHERE last_name LIKE '%___a%';

-- 실습 11 : LAST_NAME에 a 또는 e 가 있는 사원들이 LAST_NAME 조회(ASC)
SELECT last_name FROM employees WHERE last_name LIKE '%a%' OR last_name LIKE '%e%' ORDER BY last_name ASC; 

-- 실습 12 : LAST_NAME에 a 또는 e 가 있는 사원들이 LAST_NAME 조회(ASC) / 63, 64 행 동일 내용 출력
SELECT last_name FROM employees WHERE last_name LIKE '%a%' AND last_name LIKE '%e%' ORDER BY last_name ASC; 
SELECT last_name FROM employees WHERE last_name LIKE '%a%e%' OR last_name LIKE '%e%a%' ORDER BY last_name ASC; 

-------------------------------------------------------------------------------------------------------------------------------------

-- 실습 13 : 매니저가 없는 사원의 LAST_NAME, JOB_ID 조회
SELECT last_name, job_id FROM employees WHERE manager_id IS NULL;

-- 실습 14 : JOB_ID ST_CLERK를 가진 사원이 없는 부서번호 조회, 부서번호 NULL 제외
SELECT DISTINCT department_id FROM employees WHERE job_id != 'ST_CLERK' AND department_id IS NOT null;

-- 실습 15 : COMMISSION_PCT가 NULL 이 아닌 사원 중 COMMISSION = SALARY * COMMISSION_PCT 를 구해 EMPLOYEE_ID, FIRST_NAME, JOB_ID와 같이 조회
SELECT employee_id, first_name, job_id, salary * commission_pct AS COMMISSION FROM employees WHERE commission_pct IS NOT null;

-- 실습 16 : FIRST_NAME 이 CURTIS 인 사람의 FIRST_NAME, LAST_NAME, EMAIL,PHONE_NUMBER, JOB_ID를 조회. 결과 소문자 출력
SELECT first_name, last_name, email, phone_number, LOWER(job_id)
FROM employees
WHERE first_name = 'Curtis';


-- 실습 17 : 부서번호 70, 80, 90인 사람들의 EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, JOB_ID 조회, JOB_ID가 IT_PROG인 경우 '프로그래머'로 변경 출력
SELECT Employee_Id, First_Name, Hire_Date, REPLACE (job_id, 'IT_PROG', '프로그래머')
FROM employees
WHERE department_id IN(60, 70, 80, 90);

-- 실습 18 : JOB_ID가 AD_PRES, PU_CLERK인 사원들의 EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, JOB_ID 조회. 사원명 FIRST_NAME과 LAST_NAME을 연결 출력
SELECT employee_id, first_name ||' '|| last_name, hire_date, job_id
FROM employees
WHERE job_id IN('AD_PRES', 'PU_CLERK');