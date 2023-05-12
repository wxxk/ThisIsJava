-- p193 서브쿼리
select first_name, salary
from employees
where salary > (select salary
                from employees
                where first_name = 'Nancy');
                
-- p194 단일행 서브쿼리
select first_name, job_id, hire_date
from employees
where job_id = (select job_id
                from employees
                where employee_id = 103);
                
-- p195 다중행 서브쿼리
select first_name, salary
from employees
where salary > any (select salary
                from employees
                where first_name = 'David');
                
select first_name, department_id, job_id
from employees
where department_id in (select department_id
                        from employees
                        where first_name = 'David');
    
select first_name, department_id, job_id
from employees e
where exists (select *
            from departments d
            where d.manager_id = e.employee_id);
            
select first_name, e.department_id, job_id
from departments d
join employees e
on d.manager_id = e.employee_id
order by e.department_id;

-- p198 상호연관 서브쿼리
select first_name, salary
from employees a
where salary > (select avg(salary)
                from employees b
                where b.department_id = a.department_id);
                
-- p199 스칼라 서브쿼리
select first_name, 
    (select department_name
    from departments d
    where d.department_id = e.department_id) department_name
from employees e
order by first_name;

select first_name, department_name
from employees e
join departments d on (e.department_id = d.department_id)
order by first_name;

-- p200 인라인뷰
select row_number, first_name, salary
from (select first_name, salary,
    row_number() over (order by salary desc) as row_number
    from employees)
where row_number between 1 and 10;

-- p201 3중 쿼리와 Top-N 쿼리
select rownum, first_name, salary
from (select first_name, salary
    from employees
    order by salary desc)
where rownum between 1 and 10;

-- rownum 의사열을 이용하여 조회 조건을 작성할 경우 rownum은 반드시 첫 번쨰 행부터 조회!
select first_name, salary
from (select first_name, salary
    from employees
    order by salary desc)
where rownum between 11 and 20;

select rnum, first_name, salary
from (select first_name, salary, rownum as rnum
    from (select first_name, salary
        from employees
        order by salary desc)
    )
where rnum between 11 and 20;

-- p203 계층형 쿼리
select employee_id,
    lpad(' ', 3*(level-1)) || first_name || ' ' || last_name,
    level
from employees
start with manager_id is null
connect by prior employee_id = manager_id;

select employee_id,
    lpad(' ', 3 * (level - 1)) || first_name || ' ' || last_name,
    level
from employees
start with manager_id is null
connect by prior employee_id = manager_id
order siblings by first_name;

select employee_id,
    lpad(' ', 3 * (level - 1)) || first_name || ' ' || last_name,
    level
from employees
start with manager_id is null
connect by prior employee_id = manager_id
order by first_name;

select employee_id,
    lpad(' ', 3*(level-1)) || first_name || ' ' || last_name,
    level
from employees
start with employee_id = 113
connect by prior manager_id = employee_id;