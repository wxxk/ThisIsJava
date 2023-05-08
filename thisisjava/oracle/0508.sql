select first_name, last_name, job_id, salary
from employees --�ּ�
;
-- �ּ� ����

-- p28 SQL ���� �ۼ�
select first_name, last_name, salary
from employees;

-- p29 ��� �� ����
select * from departments;

select department_id, department_name, manager_id, location_id
from departments;

-- p30 Ư�� �� ����
select department_name, location_id
from departments;

select location_id, department_name
from departments;

-- p31 �⺻ ǥ�� ����
-- ��¥�� ���� �����ʹ� ���� ����
-- ���� �����ʹ� ������ ����
-- ����Ʈ �� ����� �빮�ڷ� ���
select first_name, hire_date, salary
from employees;

-- p32 ��� ǥ����
-- ��� ����� �����ϰų�, ����ϰ��� �� �� ��������� ǥ���� ��� ����
-- ǥ�õǴ� ���̸� AS�� �ٲ� �� �ִ�.
select first_name, last_name, salary, salary + 300 as salary2, salary * 1.1
from employees;

-- p33 ������ �켱����
-- ���ϱ�� ������� ���ϱ�� ���⺸�� �켱������ ����.
-- ���� �켱������ �����ڴ� �������� �������� ���
-- ��ȣ�� ������ ����� �켱������ �ٲٰų� ������ ����ϰ� �Ϸ��� ���
select first_name, last_name, salary, salary*1.1
from employees;

-- p34 NULL
-- Null�� �̿��� �� ���ų�, �������� �ʾҰų�, �� �� ���ų�, ������ �� ���� ��
-- Null�� ���� 0�̳� ������� �ٸ���
select first_name, department_id, commission_pct
from employees;

--p35 �� ��Ī ����
-- �� ��� �̸��� �����Ѵ�.
-- ����� �� �����Ѵ�
-- �� �̸��� �� �ڿ� �д�. 'AS'�� �ֱ⵵ �Ѵ�.
-- �����̳� Ư������ �Ǵ� ��/�ҹ��ڰ� ������ ""�� �ʿ��ϴ�
select first_name AS �̸�, salary �޿�
from employees;

select first_name "Employee name",
        salary*12 "Annual Salary"
from employees;

-- p36 ���ͷ� ���� ��Ʈ���� ���� ������
-- select ���� ���Ե� ���ͷ��� ���� ǥ���� �Ǵ� �����̴�.
-- ��¥�� ���� ���ͷ� ���� ''�� ������� �ʴ´�.
-- ������ ���� ��Ʈ���� ��ȯ�� �� �࿡ ���� ����̴�.
-- ||�� �̿��ϸ� ���� ������ �ش�.
select first_name || ' ' || last_name || '''s salary is $' || salary
-- '''s salary is $' : �ΰ��� ''�� �̿��ؼ� �ϳ��� '�� ��Ÿ����
-- ���ڿ� �ȿ� �ο� ��ȣ�� �������� �� ���� �ο� ��ȣ�� ����Ͽ� �ο� ��ȣ�� �̽�������(escape) �ؾ� �Ѵ�.
    AS "Employee Details"
from employees;

-- p37 �ߺ� ��� DISTINCT
-- ������ ����Ʈ ����� �ߺ��Ǵ� ���� �����ϴ� ��� ���̴�.
-- select ������ distinct Ű���带 ����Ͽ� �ߺ��Ǵ� ���� �����Ѵ�
select department_id
from employees;

select distinct department_id
from employees;

-- p38 ROWID< ROWNUM �ǻ翭
-- �ǻ翭�� ���� ���̺� ���� �������� select ���� ��ó�� ���Ǵ� ������ ���� �ǹ��Ѵ�.
-- select�� ��ȸ�� ���������� insert, update, delete�� ������ �� ����.
select ROWID, ROWNUM, employee_id, first_name
from employees;
