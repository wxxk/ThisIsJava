-- 1
select job_id, avg(salary) AVERAGE
from employees
group by job_id;

-- 2
select department_id, count(*)
from employees
group by department_id;

-- 3
select department_id, job_id, count(*)
from employees
group by (department_id, job_id);

-- 4
select department_id, round(STDDEV(salary), 2)
from employees
group by department_id;

-- 5
select department_id, count(*)
from employees
group by department_id
having count(*) >= 4;

-- 6
select job_id, count(*)
from employees
where department_id = 50
group by job_id;

-- 7
select job_id, count(*)
from employees
where department_id = 50
group by job_id
having count(*) <= 10;

-- 8
select to_char(hire_date, 'YYYY') as �Ի�⵵, 
    round(avg(salary),0) as �޿����, 
    count(*) as �����
from employees
group by to_char(hire_date, 'YYYY')
order by �Ի�⵵;

-- 9
select to_char(hire_date, 'YYYY') as �Ի�⵵, 
    to_char(hire_date, 'MM') as �Ի��,
    round(avg(salary),0) as �޿����, 
    count(*) as �����
from employees
group by rollup (to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by �Ի�⵵;

-- 10
select 
    decode(grouping(to_char(hire_date, 'YYYY')),1 , '�հ�',
        to_char(hire_date, 'YYYY')) as �Ի�⵵, 
    decode(grouping_id(to_char(hire_date, 'YYYY'),
        to_char(hire_date, 'MM')),
        1, '�Ұ�',
        3, '�հ�',
        to_char(hire_date, 'MM')) as �Ի��,
    round(avg(salary),0) as �޿����, 
    count(*) as �����
from employees
group by cube (to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by �Ի�⵵, �Ի��;

-- 11
select
    nvl(to_char(hire_date, 'YYYY'),
        decode(grouping(to_char(hire_date, 'YYYY')), 1, '�հ�')) as �Ի�⵵,
    nvl(to_char(hire_date, 'MM'),
        decode(grouping(to_char(hire_date, 'MM')), 1, '�Ұ�')) as �Ի��,
    grouping_id(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM')) as GID,
    round(avg(salary)) as �޿����,
    count(*) as �����
from employees
group by
    cube(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by �Ի�⵵, �Ի��;