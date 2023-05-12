-- 1��
select department_name
from employees e join departments d
using (department_id)
where employee_id = 103;

-- 2��
select first_name
from employees e join departments d
on e.employee_id = d.manager_id and d.department_id = 60;

-- 3��
select l.city || l.postal_code
from locations l join departments d
on d.location_id = l.location_id
where d.department_name = 'IT';

-- 4��
select m.first_name
from employees e
join employees m -- manager
on e.manager_id = m.employee_id
where e.first_name = 'Alexander' and e.last_name = 'Hunold';

-- 5��
select city
from locations l
join departments d on l.location_id = d.location_id
join employees e on d.department_id = e.department_id
where e.employee_id = 107;