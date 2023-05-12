-- 1번
select *
from employees
where manager_id in (select distinct manager_id
                    from employees
                    where department_id = 20);
                    
-- 2번
select first_name
from employees
where salary = (select max(salary)
                from employees);
                
-- 3번
select rnum, first_name, salary
from (select first_name, salary, rownum as rnum
    from (select first_name, salary
        from employees
        order by salary desc)
    )
where rnum between 3 and 5;

-- 4번
select 
    department_id, first_name, salary,
    (select round(avg(salary))
    from employees c
    where c.department_id = a.department_id) as avg_sal
from employees a
where salary >= (select avg(salary)
                from employees b
                where b.department_id = a.department_id)
order by department_id;