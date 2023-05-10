-- �׷��Լ�
-- p117 AVG, SUM, MIN, MAX
select avg(salary), max(salary), min(salary), sum(salary)
from employees
where job_id like 'SA%';

select min(hire_date), max(hire_date)
from employees;

select min(first_name), max(last_name)
from employees;

select max(salary)
from employees;

-- p118 count
select count(*) from employees;

select count(commission_pct) from employees;

-- stddev, variance
select sum(salary) as �հ�,
    round(avg(salary), 2) as ���,
    round(stddev(salary), 2) as ǥ������,
    round(variance(salary), 2) as �л�
from employees;

-- p114 �׷� �Լ��� null ��
select round(avg(salary*commission_pct), 2) as avg_bonus
from employees;

select
    round(sum(salary*commission_pct), 2) as sum_bonus,
    count(*) count,
    round(AVG(salary*commission_pct), 2) as avg_bonus1,
    round(sum(salary*commission_pct)/count(*), 2) as avg_bonus2
from employees;

select avg(nvl(salary*commission_pct, 0))
from employees;

-- group by
-- p121 group by ���
select department_id, avg(salary)
from employees
group by department_id;

-- p122 �ϳ� �̻��� ���� �׷�ȭ
select department_id, job_id, sum(salary)
from employees
group by department_id, job_id;

-- p123 �׷� �Լ��� �߸� ����� ����
select department_id, count(first_name)
from employees
group by department_id;

-- HAVING
-- having ���
select department_id, round(avg(salary), 2)
from employees
group by department_id
having avg(salary) > 8000;

select job_id, avg(salary) PAyROLL
from employees
where job_id not like 'SA%'
group by job_id
having avg(salary) > 8000
order by avg(salary);

-- GRUOPING SETS
SELECT TO_CHAR(department_id), round(avg(salary), 2)
from employees
group by department_id
union all
select job_id, round(avg(salary), 2)
from employees
group by job_id
order by 1;

select department_id, job_id, round(avg(salary), 2)
from employees
group by grouping sets (department_id, job_id)
order by department_id, job_id;

select department_id, job_id, manager_id,
    round(avg(salary), 2) as avg_sal
from employees
group by
    grouping sets ((department_id, job_id),
        (job_id, manager_id))
order by department_id, job_id, manager_id;

-- p128 ROLLUP, CUBE
select department_id, job_id, round(avg(salary), 2), count(*)
from employees
group by department_id, job_id
order by department_id, job_id;

select department_id, job_id, round(avg(salary), 2), count(*)
from employees
group by rollup(department_id, job_id)
order by department_id, job_id;

select department_id, job_id, round(avg(salary), 2), count(*)
from employees
group by cube(department_id, job_id)
order by department_id, job_id;

-- p131 GROUPING
select
    decode(grouping(department_id), 1, '�Ұ�',
        to_char(department_id)) as �μ�,
    decode(grouping(job_id), 1, '�Ұ�', job_id) as ����,
    round(avg(salary), 2) as ���,
    count(*) as ����Ǽ�
from employees
group by cube(department_id, job_id)
order by �μ�, ����;

select
    decode(grouping_id(department_id, job_id),
        2, '�Ұ�', 3, '�հ�',
        to_char(department_id)) as �μ���ȣ,
    decode(grouping_id(department_id, job_id),
        1, '�Ұ�', 3, '�հ�',job_id) as ����,
    grouping_id(department_id, job_id) as GID,
    round(avg(salary), 2) as ���,
    count(*) as ����Ǽ�
from employees
group by cube(department_id, job_id)
order by �μ���ȣ, ����;