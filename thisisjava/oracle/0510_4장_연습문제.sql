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
select to_char(hire_date, 'YYYY') as 입사년도, 
    round(avg(salary),0) as 급여평균, 
    count(*) as 사원수
from employees
group by to_char(hire_date, 'YYYY')
order by 입사년도;

-- 9
select to_char(hire_date, 'YYYY') as 입사년도, 
    to_char(hire_date, 'MM') as 입사월,
    round(avg(salary),0) as 급여평균, 
    count(*) as 사원수
from employees
group by rollup (to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by 입사년도;

-- 10
select 
    decode(grouping(to_char(hire_date, 'YYYY')),1 , '합계',
        to_char(hire_date, 'YYYY')) as 입사년도, 
    decode(grouping_id(to_char(hire_date, 'YYYY'),
        to_char(hire_date, 'MM')),
        1, '소계',
        3, '합계',
        to_char(hire_date, 'MM')) as 입사월,
    round(avg(salary),0) as 급여평균, 
    count(*) as 사원수
from employees
group by cube (to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by 입사년도, 입사월;

-- 11
select
    nvl(to_char(hire_date, 'YYYY'),
        decode(grouping(to_char(hire_date, 'YYYY')), 1, '합계')) as 입사년도,
    nvl(to_char(hire_date, 'MM'),
        decode(grouping(to_char(hire_date, 'MM')), 1, '소계')) as 입사월,
    grouping_id(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM')) as GID,
    round(avg(salary)) as 급여평균,
    count(*) as 사원수
from employees
group by
    cube(to_char(hire_date, 'YYYY'), to_char(hire_date, 'MM'))
order by 입사년도, 입사월;