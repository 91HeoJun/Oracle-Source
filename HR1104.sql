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