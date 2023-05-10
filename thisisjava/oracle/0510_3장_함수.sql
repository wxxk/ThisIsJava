-- NULL 치환 함수 NVL, NVL2, COALESCE
-- NVL 함수
select first_name,
        salary + salary * nvl(commission_pct, 0) as ann_sal
from employees;
--NVL2 함수
select first_name,
        nvl2(commission_pct, salary+salary*commission_pct, salary) as ann_sal
from employees;
-- COALESCE 함수
select first_name,
        coalesce(salary + (salary * commission_pct), salary) as ann_sal
from employees;


-- 기타 변환 함수
-- LNNVL 함수
select first_name, coalesce(salary * commission_pct, 0) as bonus
from employees
where salary * commission_pct < 650;

select first_name, coalesce(salary * commission_pct, 0) as bonus
from employees
where coalesce(salary * commission_pct, 0) < 650;

select first_name, coalesce(salary * commission_pct, 0) as bonus
from employees
where lnnvl(salary * commission_pct >= 650);

select first_name, coalesce(salary * commission_pct, 0)
from employees
where salary * commission_pct < 650
union all
select first_name, coalesce(salary * commission_pct, 0)
from employees
where salary * commission_pct is null;

-- DECODE 함수
select job_id, salary,
        decode(job_id, 'IT_PROG', salary * 1.10,
                        'FI_MGR', salary * 1.15,
                        'FI_ACCOUNT', salary * 1.20,
                        salary)
        as revised_salary
from employees;

-- CASE 문
select job_id, salary,
    case job_id when 'IT_PROG' then salary * 1.10
                when 'FI_MGR'   then salary * 1.15
                when 'FI_MANAGER'   then salary * 1.20
        else salary
    end as REVISED_SALARY
from employees;

select job_id, salary,
    case when salary < 5000 then salary * 1.2
        when salary < 10000 then salary * 1.10
        when salary < 15000 then salary * 1.05
    end as revised_salary
from employees;

-- 변환 함수 실전 문제
-- 1월부터 12월까지 각 월의 마지막 날짜를 출력
select
    to_char(last_day(to_date('01', 'MM')), 'dd') as "1",
    to_char(last_day(to_date('02', 'MM')), 'dd') as "2",
    to_char(last_day(to_date('03', 'MM')), 'dd') as "3",
    to_char(last_day(to_date('04', 'MM')), 'dd') as "4",
    to_char(last_day(to_date('05', 'MM')), 'dd') as "5",
    to_char(last_day(to_date('06', 'MM')), 'dd') as "6",
    to_char(last_day(to_date('07', 'MM')), 'dd') as "7",
    to_char(last_day(to_date('08', 'MM')), 'dd') as "8",
    to_char(last_day(to_date('09', 'MM')), 'dd') as "9",
    to_char(last_day(to_date('10', 'MM')), 'dd') as "10",
    to_char(last_day(to_date('11', 'MM')), 'dd') as "11",
    to_char(last_day(to_date('12', 'MM')), 'dd') as "12"
from dual;

-- 집합 연산자
-- UNION
select employee_id, first_name
from employees
where hire_date like '04%'
union
select employee_id, first_name
from employees
where department_id=20;

-- UNION ALL
select employee_id, first_name
from employees
where hire_date like '04%'
union all
select employee_id, first_name
from employees
where department_id = 20;

-- INTERSECT
select employee_id, first_name
from employees
where hire_date like '04%'
intersect
select employee_id, first_name
from employees
where department_id = 20;

-- minus
select employee_id, first_name
from employees
where hire_date like '04%'
minus
select employee_id, first_name
from employees
where department_id = 20;