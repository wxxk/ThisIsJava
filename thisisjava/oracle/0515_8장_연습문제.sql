-- 1번
create table emp_salary_info as
    select employee_id, first_name, salary, commission_pct
    from employees;
create table emp_hiredate_info as
    select employee_id, first_name, hire_date, department_id
    from employees;

-- 2번    
insert into employees
values (1030, 'KilDong', 'Hong', 'HONGKD',
    '010-1234-5678', '18/03/20', 'IT_PROG', 6000, 0.2, 103, 60);
    
-- 3번
update employees 
set salary = salary * 1.1
where employee_id = 1030;

-- 4번
delete from employees
where employee_id = 1030;

-- 5번
create table emp_yr_2001(
    employee_id number(6, 0),
    first_name varchar2(20),
    hire_date date,
    yr varchar2(20));
create table emp_yr_2002(
    employee_id number(6,0),
    first_name varchar2(20),
    hire_date date,
    yr varchar2(20));
create table emp_yr_2003(
    employee_id number(6,0),
    first_name varchar2(20),
    hire_date date,
    yr varchar2(20));

insert all
    when to_char(hire_date, 'YYYY') = '2001' then
        into emp_yr_2001 values (employee_id, first_name, hire_date, yr)
    when to_char(hire_date, 'YYYY') = '2002' then
        into emp_yr_2002 values (employee_id, first_name, hire_date, yr)
    when to_char(hire_date, 'YYYY') = '2003' then
        into emp_yr_2003 values (employee_id, first_name, hire_date, yr)
select employee_id, first_name, hire_date,
    to_char(hire_date, 'YYYY') as yr from employees;

-- 6번
insert first
    when hire_date <= '01/12/31' then
        into emp_yr_2001 values (employee_id, first_name, hire_date, yr)
    when hire_date <= '02/12/31' then
        into emp_yr_2002 values (employee_id, first_name, hire_date, yr)
    when hire_date <= '03/12/31' then
        into emp_yr_2003 values (employee_id, first_name, hire_date, yr)
select employee_id, first_name, hire_date,
    to_char(hire_date, 'YYYY') as yr from employees;
    
-- 7번
create table emp_personal_info as
    select employee_id, first_name, last_name, email, phone_number
    from employees
    where 1=2;
create table emp_office_info as
    select employee_id, hire_date, salary, commission_pct,
        manager_id, department_id
    from employees
    where 1=2;
    
insert all
    into emp_personal_info
        values(employee_id, first_name, last_name, email, phone_number)
    into emp_office_info
        values(employee_id, hire_date, salary, commission_pct, manager_id, department_id)
    select * from employees;

-- 8번
CREATE	TABLE	emp_comm	AS	SELECT	*	FROM	employees	WHERE	1=2;
CREATE	TABLE	emp_nocomm	AS	SELECT	*	FROM	employees	WHERE	1=2;

insert all
    when commission_pct is null then
        into emp_comm
        values(employee_id, first_name, last_name, email,
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
    when commission_pct is not null then
        into emp_comm
        values(employee_id, first_name, last_name, email,
            phone_number, hire_date, job_id, salary,
            commission_pct, manager_id, department_id)
    select * from employees;