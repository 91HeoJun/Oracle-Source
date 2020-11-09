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

-------------------------------------------------------------------------------------------------------------------------------------

-- 실습

SELECT LAST_NAME, SALARY, 
    CASE
        WHEN SALARY BETWEEN 0 AND 1999 THEN 0
        WHEN SALARY BETWEEN 2000 AND 3999 THEN 0.09
        WHEN SALARY BETWEEN 4000 AND 5999 THEN 0.2
        WHEN SALARY BETWEEN 6000 AND 7999 THEN 0.3
        WHEN SALARY BETWEEN 8000 AND 9999 THEN 0.4
        WHEN SALARY BETWEEN 10000 AND 11999 THEN 0.42
        WHEN SALARY BETWEEN 12000 AND 13999 THEN 0.44
        WHEN SALARY >= 14000 THEN 0.45
        END AS TAX_RATE
FROM employees
WHERE department_id IN(80);

-- 실습 <- 강사님 코드 / 디코드로 할 경우
SELECT LAST_NAME, SALARY, 
    DECODE(TRUNC(salary/2000,0),
        0, 0.00,
        1, 0.09,
        2, 0.20,
        3, 0.30,
        4, 0.40,
        5, 0.42,
        6, 0.44,
        0.45) AS TAX_RATE
FROM employees
WHERE department_id IN(80);

-- 다중행 함수 연습--------------------------------------------------------------------------------------------------------------------

-- 사내 최대연봉 및 최소연봉 차이 조회
SELECT MAX(salary), MIN(salary), MAX(salary) - MIN(salary) AS RESULT
FROM employees;

-- 매니저 사원 수 조회 / MANAGER_ID가 중복된 사람이 있으므로 DISTINCT로 중복인원 제외
SELECT COUNT(DISTINCT manager_id) AS MANAGERS
FROM employees;

-------------------------------------------------------------------------------------------------------------------------------------

-- 부서별 직원 합을 구하고 부서별 오름차순 정렬
SELECT department_id AS DEPT, COUNT(employee_id) AS COUNT
FROM employees GROUP BY department_id
ORDER BY department_id ASC;

-- 부서별 평균연봉을 정수로만 출력하고 부서번호의 오름차순으로 정렬
SELECT department_id AS DEPT, ROUND(AVG(salary),0) AS AVERAGE_SALARY
FROM employees GROUP BY department_id
ORDER BY department_id ASC;

-- 동일 직업 사원 수 조회
SELECT job_id AS JOB, COUNT(employee_id)
FROM employees GROUP BY job_id;

--------------------------------------------------------------------------------------------------------------------

-- Join 실습
-- 자신의 담당 매니저의 고용일보다 빠른 입사자를 찾아 / hire_date, last_name, manager_id 출력
-- EMPLOYEES 셀프조인 -> 37행
SELECT E1.last_name, E1.hire_date AS 내입사일, E1.manager_id, E2.hire_date AS 매니저입사일
FROM employees E1 INNER JOIN employees E2
ON E1.manager_id = E2.employee_id AND E1.hire_date < E2.hire_date;

-- 도시 이름이 T로 시작하는 지역에 사는 사원의 사번, last_name, 부서번호
-- EMPLOYEES. DEMARTMENT_ID + DEMPARTMENTS.DEPARTMENT_ID 후 DEMPARTMENTS.LOCATION_ID + LOCATIONS.LOCATION_ID -> 2행
SELECT employee_id, last_name, D.department_id
FROM EMPLOYEES E
LEFT OUTER JOIN DEPARTMENTS D ON E.department_id = D.department_id
RIGHT OUTER JOIN LOCATIONS L ON D.location_id = L.location_id AND L.city LIKE 'T%';

-- 도시 이름이 T로 시작하는 지역에 사는 사원의 /사번 / last_name, /부서번호 ## 강사님 코딩
SELECT E.employee_id, E.last_name, D.department_id
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L
WHERE E.department_id = D.department_id AND D.location_id = L.location_id AND L.city LIKE 'T%';

-- 위치 id가 1700인 동일한 사원들의 employee_id, last_name, department_id, salary 조회
-- EMPLOYEES + DEMPARTMENTS -> 18행
SELECT E.employee_id, E.last_name, D.department_id, salary
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.department_id = D.department_id AND D.location_id = 1700;

-- department_name, location_id, 각 부서별 사원수, 평균연봉 조회
-- EMPLOYEES + DEMPARTMENTS -> 11행
SELECT D.department_name, D.location_id, COUNT(employee_id), ROUND(AVG(salary))
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.department_id = D.department_id
GROUP BY D.department_name, D.location_id;

-- EXECUTIVE 부서에 근무하는 전사원 department_id, last_name, job_id 조회
-- EMPLOYEES + DEMPARTMENTS -> 3행
SELECT last_name, D.department_id, job_id
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.department_id = D.department_id AND D.department_name = 'Executive';

-- 기존 직업을 유지하고있는 사원의 사번, job_id 조회
-- EMPLOYEES + JOB_HISTORY
SELECT E.employee_id, E.job_id
FROM EMPLOYEES E, job_history JH
WHERE E.employee_id = JH.employee_id AND E.job_id = JH.job_id;

-- 각 사원 별 소속부서에서 자신보다 나중에 고용되었으나, 보다많은 연봉을 받는 사원이 있는 사원의 last_name을 조회
-- EMPLOYEES 셀프조인
SELECT E1.department_id, E1.first_name ||''|| E1.last_name AS NAME
FROM EMPLOYEES E1, EMPLOYEES E2
WHERE E1.department_id = E2.department_id AND E1.hire_date < E2.hire_date AND E1.salary < E2.salary
ORDER BY E1.department_id ASC;

--------------------------------------------------------------------------------------------------------------------

-- 서브쿼리 실습
-- 회사 전체 평균연봉보다 더 많이 받는 사원들의  LAST_NAME, SALARY 조회
SELECT last_name, salary
FROM employees
WHERE salary > ANY (SELECT AVG(salary) FROM employees);

-- LAST_NAME에 u가 포함된 사원들과 동일부서에 근무하는 직원들의 employee_id, last_name 조회
SELECT employee_id, last_name
FROM employees
WHERE department_id IN (SELECT DISTINCT department_id FROM employees WHERE last_name LIKE '%U%');

-- NOT EXISTS 연산자를 사용하여 매니저가 아닌 사원 이름을 조회
SELECT first_name, last_name
FROM employees E1
WHERE NOT EXISTS (SELECT DISTINCT manager_id FROM employees E2 WHERE E1.employee_id = E2.manager_id);

SELECT first_name, last_name
FROM employees E1
WHERE E1.employee_id NOT IN (SELECT DISTINCT manager_id FROM employees E2 WHERE E1.employee_id = E2.manager_id);

