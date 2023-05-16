-- 1¹ø
create or replace view sal_gap_by_job
as select
    e.first_name as name,
    a.job_id,
    round(a.avg_sal - e.salary) as job_Sal_gap
    from employees e
    join (select job_id, (max_salary + min_salary) / 2 as avg_sal from jobs) a
    on a.job_id = e.job_id;
    
select * from sal_gap_by_job;

-- 2¹ø
create or replace view emp_view
as select
        e.employee_id as id,
        e.first_name as name,
        d.department_name as department,
        j.job_title as job
    from employees e
    left join departments d on e.department_id = d.department_id
    join jobs j on e.job_id = j.job_id;
    
select * from emp_view;