-- 1. �̸��Ͽ� lee�� �����ϴ� ����� ��� ������ ����ϼ���.
select * from employees where email like '%LEE%';

-- 2. �Ŵ��� ���̵� 103�� ������� �̸��� �޿�, ���� ���̵� ����ϼ���
select first_name, salary, job_id
from employees
where manager_id = 103;

-- 3. 80�� �μ��� �ٹ��ϸ鼭 ������ SA_MAN�� ����� ������ 20�� �μ��� �ٹ��ϸ鼭 �Ŵ��� ���̵� 100�� ����� ������ ����ϼ���.
select * from employees
where (department_id = 80 and job_id = 'SA_MAN') or (department_id = 20 and manager_id = 100);

-- 4. ��� ����� ��ȭ��ȣ�� ###-####-#### �������� ����ϼ���
select regexp_replace(phone_number, '^[[:digit:]]{3}.[[:digit:]]{3}.[[:digit:]]{4}$', '###-###-####') from employees;

-- 5. ������ IT_PROG�� ��� �߿��� �޿��� 5000 �̻��� ������� �̸�(full name), �޿� ���޾�, �Ի���(2005-02-15 ����), �ٹ��� �ϼ��� ���
-- �̸������� ����, �̸��� �ִ� 20�ڸ�, ���� �ڸ��� *�� ä���
-- �޿� ���޾��� �Ҽ��� 2�ڸ��� ������ �ִ� 8�ڸ�, $ǥ��, ���� �ڸ��� 0���� ä�� ����ϼ���
select rpad(first_name || ' ' || last_name, 20, '*') as FULL_NAME, 
    to_char(coalesce (salary + salary + commission_pct, salary), '$009,999.99') as SALARY,  
    to_char(hire_date, 'YYYY-MM-DD') as HIRE_DATE,
    round(sysdate - hire_date) as WORK_DAY
from employees
where job_id = 'IT_PROG' and salary >= 5000
order by FULL_NAME;

-- 6
select rpad(first_name || ' ' || last_name, 20, '*') as FULL_NAME,
    to_char(salary, '$009,999.99') as SALARY,
    to_char(hire_date, 'YYYY"��" MM"��" DD"��"') as HIRE_DATE,
--    trunc((sysdate - hire_date)/12) as MONTH,
    trunc(months_between(sysdate, hire_date)) as MONTH
from employees
where department_id = 30
order by SALARY desc;

-- 7
select rpad(first_name || ' ' || last_name, 17, '*') as �̸�,
    to_char(coalesce (salary + salary * commission_pct, salary), '$99,999.99') as �޿�
from employees
where department_id = 80 and salary > 10000;

-- 8
select first_name || ' ' || last_name as �̸�,
    decode(trunc(trunc(months_between(sysdate, hire_date)/12)/5), 
        1, '5����',
        2, '10����',
        3, '15����',
        '��Ÿ') as �ٹ����
from employees
where department_id = 60;

-- 9
select hire_date + 1000
from employees
where first_name = 'Lex';

-- 10
select first_name, hire_date
from employees
where to_char(hire_date, 'MM') = 05;

-- 11
select first_name, salary, to_char(hire_date, 'YYYY"�� �Ի�"') as YEAR,
    to_char(hire_date, 'DAY') as DAY, 
    case when to_number(to_char(hire_date, 'YYYY')) >= 2010 then to_char(salary * 1.5, '$999,999')
        when to_number(to_char(hire_date, 'YYYY')) >= 2005 then to_char(salary * 1.05, '$999,999')
        else to_char(salary, '$999,999')
    end as INCREASING_SALARY
from employees;

-- 12
select first_name, salary, to_char(hire_date, 'YYYY"�� �Ի�"') as YEAR,
    case when to_number(to_char(hire_date, 'YYYY')) = 2010 then salary * 1.1
        when to_number(to_char(hire_date, 'YYYY')) = 2005 then salary * 1.05
        else salary
    end as INCREASING_SALARY2
from employees;

-- 13
select country_id,nvl(state_province, country_id) as state
from locations;