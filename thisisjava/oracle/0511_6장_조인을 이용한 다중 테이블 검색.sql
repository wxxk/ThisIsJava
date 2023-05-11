-- CARTESIAN PRODUCT
select first_name, employees.department_id, department_name
from employees, departments;

-- EQUI JOIN
select e.first_name, e.department_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id;

select e.first_name, e.salary, m.first_name, m.salary
from employees e, employees m
where e.manager_id = m.employee_id and e.salary > m.salary;

-- SELF JOIN
select e.first_name as employee_name,
    m.first_name as manager_name
from employees e, employees m
where e.manager_id = m.employee_id and e.employee_id = 103;

-- NON-EQUI JOIN
select e.first_name, e.salary, j.job_title
from employees e, jobs j
where e.salary
between j.min_salary and j.max_salary
order by e.first_name;

-- OUTER JOIN
select e.employee_id, e.first_name, e.hire_date,
    j.start_date, j.end_date, j.job_id, j.department_id
from employees e, job_history j
where e.employee_id = j.employee_id
order by j.employee_id;

select e.employee_id, e.first_name, e.hire_Date,
    j.start_date, j.end_date, j.job_id, j.department_id
from employees e, job_history j
where e.employee_id = j.employee_id(+)
order by j.employee_id;