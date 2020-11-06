-- HR ������ ������ �ִ� ��� ���̺� ����
select * from tab;

-- ���̺��� ������ Ȯ�� Ű���� DESC
DESC EMPLOYEES;

-- employees ���̺� ��ü ���� ��ȸ
SELECT * FROM employees; 

-- employees ���̺��� first_name, last_name, job_id �� ��ȸ
SELECT first_name, last_name, job_id FROM employees;

SELECT last_name, department_id FROM employees WHERE employee_id = 176;

SELECT last_name, salary FROM employees WHERE salary >= 12000;

SELECT last_name, SALARY FROM employees WHERE salary < 5000 OR salary > 12000;
SELECT last_name, SALARY FROM employees WHERE salary BETWEEN 5000 AND 12000 ORDER BY salary;


-------------------------------------------------------------------------------------------------------------------------------------

-- �ǽ� 1 : 20�� 50�� �μ����� �ٹ��ϴ� ����� LAST_NAME�� �μ���ȣ ���ĺ� ������ ����
SELECT last_name, department_id FROM employees WHERE department_id IN(20, 50) ORDER BY last_name, department_id;
-- �ǽ� 1 - 1  : ���� 5000 ~ 12000 ���� �� 20�� 50�� �μ����� �ٹ��ϴ� ����� LAST_NAME�� ���� ��ȸ(���� ���� ��������)
SELECT last_name, salary FROM employees WHERE salary BETWEEN 5000 AND 12000 AND department_id IN(20, 50) ORDER BY salary;


-- �ǽ� 2 : Ŀ�̼� ���� ���� LAST_NAME, SALALY,COMMITION ��ȸ (���� ���� and Ŀ�̼� �� ����)
SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct > 0 ORDER BY salary DESC, commission_pct;

-- �ǽ� 3 : ���� 2500 / 3500 / 7000�� �ƴϸ� ������ SA_REP or ST_CLERK
SELECT * FROM employees WHERE job_id IN('SA_REP', 'ST_CLERK') AND salary NOT IN(2500, 3500, 7000);

-- �ǽ� 4 : 2008/02/20 ~ 2008/05/01 ���� ��� LAST_NAME, �����ȣ, ������� ��ȸ (������� ���� �������� ����)
SELECT last_name, employee_id, hire_date FROM employees WHERE hire_date >= '20080220' AND hire_date <= '20080501' ORDER BY hire_date DESC;

-- �ǽ� 5 : 2004 ���� ��� ���� LAST_NAEM �� ����� ��ȸ (�Ի��� ���� �������� ����)
SELECT last_name, hire_date FROM employees WHERE hire_date > '20040101' AND hire_date < '20050101' ORDER BY hire_date ASC;
SELECT last_name, hire_date FROM employees WHERE hire_date BETWEEN '20040101' AND '20050101' ORDER BY hire_date ASC;

-- �ǽ� 6 : ���� 5000 ~ 12000 ���� �̿� ������� LAST_NAME, SALARY ��ȸ
SELECT last_name, salary FROM employees WHERE salary NOT BETWEEN 5000 AND 12000 ORDER BY salary DESC;

-------------------------------------------------------------------------------------------------------------------------------------

-- �ǽ� 7 : 2004�⵵ ���� ��������� LAST_NAME �� ����� ��ȸ�Ͽ� �Ի��� ���� �������� ����
SELECT last_name, hire_date FROM employees WHERE hire_date LIKE '04%' ORDER BY hire_date;

-- �ǽ� 8 : LAST_NAME�� u�� ���Ե� ������� ��� �� LAST_NAME ��ȸ
SELECT employee_id, last_name FROM employees WHERE last_name LIKE '%u%'; 

-- �ǽ� 9 : LAST_NAME �� U�� ���Ե� ������� ��� & LAST_NAME ��ȸ
SELECT employee_id, last_name FROM employees WHERE last_name LIKE '%U%';

-- �ǽ� 10 : LAST_NAME�� 4���� ���ڰ� a�� ������� LAST_NAME ��ȸ
SELECT last_name FROM employees WHERE last_name LIKE '%___a%';

-- �ǽ� 11 : LAST_NAME�� a �Ǵ� e �� �ִ� ������� LAST_NAME ��ȸ(ASC)
SELECT last_name FROM employees WHERE last_name LIKE '%a%' OR last_name LIKE '%e%' ORDER BY last_name ASC; 

-- �ǽ� 12 : LAST_NAME�� a �Ǵ� e �� �ִ� ������� LAST_NAME ��ȸ(ASC) / 63, 64 �� ���� ���� ���
SELECT last_name FROM employees WHERE last_name LIKE '%a%' AND last_name LIKE '%e%' ORDER BY last_name ASC; 
SELECT last_name FROM employees WHERE last_name LIKE '%a%e%' OR last_name LIKE '%e%a%' ORDER BY last_name ASC; 

-------------------------------------------------------------------------------------------------------------------------------------

-- �ǽ� 13 : �Ŵ����� ���� ����� LAST_NAME, JOB_ID ��ȸ
SELECT last_name, job_id FROM employees WHERE manager_id IS NULL;

-- �ǽ� 14 : JOB_ID ST_CLERK�� ���� ����� ���� �μ���ȣ ��ȸ, �μ���ȣ NULL ����
SELECT DISTINCT department_id FROM employees WHERE job_id != 'ST_CLERK' AND department_id IS NOT null;

-- �ǽ� 15 : COMMISSION_PCT�� NULL �� �ƴ� ��� �� COMMISSION = SALARY * COMMISSION_PCT �� ���� EMPLOYEE_ID, FIRST_NAME, JOB_ID�� ���� ��ȸ
SELECT employee_id, first_name, job_id, salary * commission_pct AS COMMISSION FROM employees WHERE commission_pct IS NOT null;

-- �ǽ� 16 : FIRST_NAME �� CURTIS �� ����� FIRST_NAME, LAST_NAME, EMAIL,PHONE_NUMBER, JOB_ID�� ��ȸ. ��� �ҹ��� ���
SELECT first_name, last_name, email, phone_number, LOWER(job_id)
FROM employees
WHERE first_name = 'Curtis';


-- �ǽ� 17 : �μ���ȣ 70, 80, 90�� ������� EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, JOB_ID ��ȸ, JOB_ID�� IT_PROG�� ��� '���α׷���'�� ���� ���
SELECT Employee_Id, First_Name, Hire_Date, REPLACE (job_id, 'IT_PROG', '���α׷���')
FROM employees
WHERE department_id IN(60, 70, 80, 90);

-- �ǽ� 18 : JOB_ID�� AD_PRES, PU_CLERK�� ������� EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, JOB_ID ��ȸ. ����� FIRST_NAME�� LAST_NAME�� ���� ���
SELECT employee_id, first_name ||' '|| last_name, hire_date, job_id
FROM employees
WHERE job_id IN('AD_PRES', 'PU_CLERK');

-------------------------------------------------------------------------------------------------------------------------------------

-- �ǽ�

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

-- �ǽ� <- ����� �ڵ� / ���ڵ�� �� ���
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

-- ������ �Լ� ����--------------------------------------------------------------------------------------------------------------------

-- �系 �ִ뿬�� �� �ּҿ��� ���� ��ȸ
SELECT MAX(salary), MIN(salary), MAX(salary) - MIN(salary) AS RESULT
FROM employees;

-- �Ŵ��� ��� �� ��ȸ / MANAGER_ID�� �ߺ��� ����� �����Ƿ� DISTINCT�� �ߺ��ο� ����
SELECT COUNT(DISTINCT manager_id) AS MANAGERS
FROM employees;

-------------------------------------------------------------------------------------------------------------------------------------

-- �μ��� ���� ���� ���ϰ� �μ��� �������� ����
SELECT department_id AS DEPT, COUNT(employee_id) AS COUNT
FROM employees GROUP BY department_id
ORDER BY department_id ASC;

-- �μ��� ��տ����� �����θ� ����ϰ� �μ���ȣ�� ������������ ����
SELECT department_id AS DEPT, ROUND(AVG(salary),0) AS AVERAGE_SALARY
FROM employees GROUP BY department_id
ORDER BY department_id ASC;

-- ���� ���� ��� �� ��ȸ
SELECT job_id AS JOB, COUNT(employee_id)
FROM employees GROUP BY job_id;

--------------------------------------------------------------------------------------------------------------------

-- Join �ǽ�
-- �ڽ��� ��� �Ŵ����� ����Ϻ��� ���� �Ի��ڸ� ã�� / hire_date, last_name, manager_id ���
-- EMPLOYEES �������� -> 37��
SELECT E1.last_name, E1.hire_date AS ���Ի���, E1.manager_id, E2.hire_date AS �Ŵ����Ի���
FROM employees E1 INNER JOIN employees E2
ON E1.manager_id = E2.employee_id AND E1.hire_date < E2.hire_date;

-- ���� �̸��� T�� �����ϴ� ������ ��� ����� ���, last_name, �μ���ȣ
-- EMPLOYEES. DEMARTMENT_ID + DEMPARTMENTS.DEPARTMENT_ID �� DEMPARTMENTS.LOCATION_ID + LOCATIONS.LOCATION_ID -> 2��
SELECT E.employee_id, E.last_name, E.department_id
FROM EMPLOYEES E
LEFT OUTER JOIN DEPARTMENTS D ON E.department_id = D.department_id
LEFT OUTER JOIN LOCATIONS L ON D.location_id = L.location_id;




-- ��ġ id�� 1700�� ������ ������� employee_id, last_name, department_id, salary ��ȸ
-- EMPLOYEES + DEMPARTMENTS -> 18��

-- department_name, location_id, �� �μ��� �����, ��տ��� ��ȸ
-- EMPLOYEES + DEMPARTMENTS -> 11��


-- EXECUTIVE �μ��� �ٹ��ϴ� ����� department_id, last_name, job_id ��ȸ
-- EMPLOYEES + DEMPARTMENTS

-- ���� ������ �����ϰ��ִ� ����� ���, job_id ��ȸ
-- EMPLOYEES + JOB_HISTORY

-- �� ��� �� �ҼӺμ����� �ڽź��� ���߿� ���Ǿ�����, ���ٸ��� ������ �޴� ����� �ִ� ����� last_name�� ��ȸ
-- EMPLOYEES ��������


--------------------------------------------------------------------------------------------------------------------
