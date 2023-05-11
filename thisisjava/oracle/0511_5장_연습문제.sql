-- 1
select
    department_id,
    first_name,
    salary,
    rank() over (partition by department_id order by salary desc) as sal_rank,
    lag(salary, 1, 0) over (partition by department_id order by salary desc) as prev_salary,
    first_value(salary) over (partition by department_id order by salary desc
        rows 1 preceding) as prev_salary2
from employees
order by department_id;

--2 
select first_name
from employees
where employee_id = (
    select before_id
    from
        (
        select employee_id,
        lag(employee_id, 1, 0) over (order by employee_id) as before_id
        from employees
        )
    where employee_id = 170
);

-- 3
select employee_id, department_id,
    first_value(salary)
        over (partition by department_id
            order by salary
            rows between unbounded preceding and unbounded following) as lower_sal,
    salary as my_sal,
    LAST_VALUE(salary)
        over (partition by department_id
            order by salary
            rows between unbounded preceding and unbounded following) as higher_sal,
    last_value(salary)
        over (partition by department_id
            order by salary
            rows between unbounded preceding and unbounded following) - salary as diff_sal
from employees;