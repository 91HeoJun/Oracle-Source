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