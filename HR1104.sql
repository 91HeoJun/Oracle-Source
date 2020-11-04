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

SELECT last_name, SALARY FROM employees WHERE SALARY < 5000 OR SALARY > 12000;

-------------------------------------------------------------------------------------------------------------------------------------

-- �ǽ� 1 : 
SELECT last_name, department_id FROM employees WHERE department_id IN(20, 50) ORDER BY FIRST_NAME ASC;

-- �ǽ� 2 : Ŀ�̼� ���� ���� LAST_NAME, SALALY,COMMITION ��ȸ (���� ���� and Ŀ�̼� �� ����)
SELECT last_name, salary, commission_pct FROM employees WHERE commission_pct > 0 ORDER BY salary DESC, commission_pct;

-- �ǽ� 3 : ���� 2500 / 3500 / 7000�� �ƴϸ� ������ SA_REP or ST_CLERK
SELECT * FROM employees WHERE job_id IN('SA_REP', 'ST_CLERK') AND salary NOT IN(2500, 3500, 7000);

-- �ǽ� 3 : 2008/02/20 ~ 2008/05/01 ���� ��� LAST_NAME, �����ȣ, ������� ��ȸ (������� ���� �������� ����)
SELECT last_name, employee_id, hire_date FROM employees WHERE hire_date >= '20080220' AND hire_date <= '20080501' ORDER BY hire_date DESC;

-- 2004 ���� ��� ���� LAST_NAEM �� ����� ��ȸ (�Ի��� ���� �������� ����)
SELECT last_name, hire_date FROM employees WHERE hire_date > '20040101' AND hire_date < '20050101' ORDER BY hire_date ASC;