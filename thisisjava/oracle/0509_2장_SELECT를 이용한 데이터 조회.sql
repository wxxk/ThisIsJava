select first_name, job_id, department_id
from employees
where job_id = 'IT_PROG';

-- 2004�� ���� �Ի��� ����� �̸��� �޿�, �Ի����� ���
select first_name, salary, hire_date
from employees
where hire_date >= '04/01/01';

-- 2004�� �Ի��� ����� �̸�, �޿�, �Ի����� ����ϼ���
select first_name, salary, hire_date
from employees
where hire_date between '04/01/01' and '04/12/31';

-- 20, 30, 40 �� �μ��� ���ϴ� ����� �̸�, �������̵�, �μ����̵� ���
select first_name, job_id, department_id
from employees
where department_id in (20, 30, 40);

-- 3�� �Ի��� ������̸��� �Ի����� ���
select first_name, hire_date
from employees
where hire_date like '%/03/%';

-- Pseudo column
select ROWNUM, first_name, hire_date
from employees
order by hire_date DESC, first_name;

-- p40 ���õ� �� ����
-- where ���� ����Ͽ� ��ȯ�ϴ� ���� �����Ѵ�.
-- where ���� from �� ������ �´�.
-- where ���� �� �̸�, �� ������, ���� �� �̸� �Ǵ� �� ������� ����
select first_name, job_id, department_id
from employees
where job_id = 'IT_PROG';

-- p41 ���ڿ� ��¥
-- ����, ���ڿ�, ��¥�� ���� �ο��ȣ�� �ѷ��ο� �ִ�.
-- ���� ���� ��/�ҹ��ڸ� �����ϰ�, ��¥ ���� ��¥ ������ �����Ѵ�.
-- RR/MM/DD
select first_name, last_name, hire_date
from employees
where last_name = 'King';

-- p42 �� ������
-- �޿��� 15000 �̻��� ���
select first_name, salary, hire_date
from employees
where salary >= 15000;
-- �Ի����� 2004�� 1�� 30���� ���
select first_name, salary, hire_date
from employees
where hire_date = '04/01/30';
-- first_name�� Steven�� ���
select first_name, salary, hire_date
from employees
where first_name = 'Steven';

-- p43 BETWEEN ������
-- ���� ������ �ش��ϴ� ���� ����ϱ� ���� ���
-- ���Ѱ��� ���� ����ϳ�.
-- ���Ѱ��� ���Ѱ��� ��� �����Ѵ�.
select first_name, salary
from employees
where salary between 10000 and 12000;
-- 2003�� �Ի����� �̸�, �޿�, �Ի����� ���
select first_name, salary, hire_date
from employees
where hire_date between '03/01/01' and '03/12/31';
-- �̸��� A�Ǵ� B�� �����ϴ� ����� �̸�, �޿�, �Ի��� ���
select first_name, last_name, salary, hire_date
from employees
where last_name between 'A' and 'Bzzzzzzzzzzz';

-- p44 IN ������
-- ��Ͽ� �ִ� ����� ���ϱ� ���ؼ� IN �����ڸ� ����Ѵ�
-- �������� �����ȣ�� 101, 102, 103�� ��� ����� �����ȣ, �̸�, �޿�, �������� �����ȣ ���
select employee_id, first_name, salary, manager_id
from employees
where manager_id in (101, 102, 103);

select first_name, last_name, job_id, department_id
from employees
where job_id in ('IT_PROG', 'FI_MGR', 'AD_VP');

-- p45 LIKE ������
-- �˻� ���ڿ��� ���� ���ϵ�ī�� �˻��� ���ؼ� LIKE �����ڸ� ���
-- �˻� ������ ���ڳ� ��¥�� ������ �� �ִ�.
-- %�� 0�� �̻��� ���ڸ� ��ü�Ѵ�.
-- _�� �ϳ��� ���ڸ� ��ü�Ѵ�
select first_name, last_name, job_id, department_id
from employees
where job_id LIKE 'IT%';
-- 2003�� 1�� 1�ϰ� 12�� 31�� ���̿� �Ի��� ��� ����� �̸��� �Ի���
select first_name, hire_date
from employees
where hire_date like '03%';
-- �̸����� �ι�° ���ڰ� "A"�� ��� ����� �̸��� �̸��� ���
select first_name, email
from employees
where email like '_A%';
-- job_id�� "SA_M"�� �����ϴ� ����� �̸��� JOB_ID�� ���
select first_name, job_id
from employees
where job_id like 'SA/_M%' escape '/';

-- p49 IS NULL ������
select first_name, job_id, commission_pct
from employees
where commission_pct is null;

select first_name, job_id, commission_pct
from employees
where commission_pct is not null;

-- p50 ��������
-- AND�� ���� ������ ���̸� TRUE
-- OR�� ���� ������ ���̸� TRUE
-- NOT�� ���� ���ǿ� �ݴ�Ǵ� ����� ��ȯ
select first_name, job_id, salary
from employees
where job_id='IT_PROG' AND salary>=5000;

select first_name, job_id, salary
from employees
where job_id = 'IT_PROG' or salary >= 5000;

select first_name, department_id
from employees
where department_id not in (50, 60, 70, 80, 90, 100);

select first_name, department_id
from employees
where department_id not between 50 and 100;

-- p51 shsfl dustkswk dntjstnsdnl
-- AND, OR, NOT �������� �켱������ �� �������� ���Ͽ� ����
-- AND�����ڰ� OR�����ں��� �켱������ ����
select first_name, job_id, salary
from employees
where job_id = 'IT_PROG'
or job_id = 'FI_MGR'
and salary >= 6000;

select first_name, job_id, salary
from employees
where (job_id = 'IT_PROG' or job_id = 'FI_MGR')
and salary >= 6000;

-- p51 ������ ����
-- ���ǿ� ���� �˻��Ǵ� ���� ������ �� �ִ�
-- ORDER BY ���� SELECT ������ ���� �ڿ� �´�.
-- ASC : ������������ ����. �⺻��
-- DESE : ������������ ����
select first_name, hire_date
from employees
order by hire_date;

select first_name, hire_date
from employees
order by hire_date desc;

select first_name, salary*12 as annsal
from employees
order by annsal;

select first_name, salary*12 as annsal
from employees
order by 2;