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

-- 안시조인
-- CROSS JOIN
select employee_id, department_name
from employees
cross join departments;

-- p178 NATURAL JOIN
select first_name, job_title
from employees
natural join jobs;

select first_name, department_name
from employees
natural join departments;

-- P179 USING JOIN
select first_name, department_name
from employees
join departments
using (department_id);

-- p180 ON JOIN
select department_name, street_address, city, state_province
from department d
join location l
on d.location_id = l.location_id;

select department_name, first_name
from departments d
join employees e on d.manager_id = e.employee_id;

select e.first_name, d.department_name,
    l.street_address || ', ' || l.city || ', ' || l.state_province as address
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;

-- where 절과의 혼용
select e.first_name as name,
    d.department_name as department
from employees e
join departments d
on e.department_id = d.department_id
where employee_id = 103;

select e.first_name as name, d.department_name as department,
    l.street_Address || ', ' || l.city || ', ' || l.state_province as address
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id
where employee_id = 103;

-- p183 on 절에 where 절의 조건 추가
select e.first_name as name,
    d.department_name as department
from employees e
join departments d
on e.department_id = d.department_id and employee_id = 103;

select e.first_name as name, d.department_name as department,
    l.street_address || ', ' || l.city || ', ' || l.state_province as address
from employees e
join departments d
on e.department_id = d.department_id and employee_id = 103
join locations l
on d.location_id = l.location_id;

select e.first_name as name, d.department_name as department,
    l.street_address || ', ' || l.city || ', ' || l.state_province as address
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id and employee_id = 103;

-- p184
select e.employee_id, e.first_name, e.hire_date,
    j.start_date, j.end_date, j.job_id, j.department_id
from employees e
left outer join job_history j
on e.employee_id = j.employee_id
order by e.employee_id;

-- p185
-- LEFT OUTER JOIN
select department_name, first_name
from departments d
left join employees e on d.manager_id = e.employee_id;

-- RIGHT OUTER JOIN
select department_name, first_name
from employees e
right join departments d on d.manager_id = e.employee_id;