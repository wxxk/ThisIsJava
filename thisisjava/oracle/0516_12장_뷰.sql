-- 뷰 정보 확인
select * from user_views;

-- 뷰 생성
create view emp_view_dept60
as select employee_id, first_name, last_name, job_id, salary
    from employees
    where department_id=60;
    
desc emp_view_dept60;

select * from emp_view_dept60;

drop view emp_view_dept60;

-- 뷰 생성 서브쿼리에서 별칭 사용하기
create view emp_dept60_salary
as select
        employee_id as empno,
        first_name || ' ' || last_name as name,
        salary as monthly_salary
    from employees
    where department_id =60;
    
desc emp_dept60_salary;

select * from emp_dept60_salary;

-- 뷰 수정
create or replace view emp_dept60_salary
as select
        employee_id as empno,
        first_name || ' ' || last_name as name,
        job_id  as job,
        salary
    from employees
    where department_id = 60;
    
desc emp_dept60_salary;

-- 복합 뷰 생성
create view emp_view
as select
        e.employee_id as id,
        e.first_name as name,
        d.department_name as department,
        j.job_title as job
    from employees e
    left join departments d on e.department_id = d.department_id
    join jobs j on e.job_id = j.job_id; 
    
select * from emp_view;

select
    e.employee_id,
    e.job_id,
    e.manager_id,
    e.department_id,
    d.location_id,
    l.country_id,
    e.first_name,
    e.last_name,
    e.salary,
    e.commission_pct,
    d.department_name,
    j.job_title,
    l.city,
    l.state_province,
    c.country_name,
    r.region_name
from 
    employees e,
    departments d,
    jobs j,
    locations l,
    countries c,
    regions r
where e.department_id = d.department_id
    and d.location_id = l.location_id
    and l.country_id = c.country_id
    and c.region_id = r.region_id
    and j.job_id = e.job_id
;  

-- 뷰 삭제
drop view emp_dept60_salary;

-- 뷰을 이용한 DML 연산
create table emps as select * from employees;

-- 데이터 조작이 가능한 경우
create or replace view emp_dept60
as select * from emps where department_id=60;

select * from emp_dept60;
select * from emps where employee_id = 104;

delete from emp_dept60 where employee_id = 104;

select * from emps where employee_id = 104;

-- 행 제거가 안 되는 경우
create or replace view emp_dept60
as select distinct * from emps where department_id = 60;

select * from emp_dept60;
select * from emps where employee_id = 106;

delete from emp_dept60 where employee_id = 106; -- 삭제할 수 없다

-- 데이터 수정이 안 되는 경우
create or replace view emp_dept60
as select
        employee_id,
        first_name || ', ' || last_name as name,
        salary*12 as annual_salary
    from emps where department_id = 60;
    
select * from emp_dept60;
select * from emps where employee_id = 106;

update emp_dept60 set annual_salary*1.1
where employee_id = 106;    -- 수정할 수 없다

delete from emp_dept60 where employee_id = 106; -- 수정할 수 없어도 삭제는 가능

-- 데이터 입력이 안 되는 경우
create or replace view emp_dept60
as select
        employee_id,
        first_name,
        last_name,
        email,
        salary
    from emps where department_id = 60;
    
select * from emp_dept60;

insert into emp_dept60
values (500, 'JinKyoung', 'Heo', 'HEOJK', 8000);    -- not null 속성인 hire_date가 뷰의 열로 선택되지 않아서 입력 불가능

-- WITH CHECK OPTION
-- 뷰에 대한 DML 연산이 뷰의 조건을 만족시킬 떄 수행
create or replace view emp_dept60
as select employee_id, first_name, hire_date, salary, department_id
    from emps
    where department_id = 60
with check option;

-- with check option에 의해 수정 불가능
update emp_Dept60
set department_id = 10
where employee_id = 105;

-- WITH READ ONLY
create or replace view emp_dept60
as select employee_id, first_name, hire_Date, salary, department_id
    from emps
    where department_id = 60
with read only;

delete from emp_dept60
where employee_id = 105;


-- 인라인 뷰
select row_number, first_name, salary
from (select first_name, salary,
    row_number() over (order by salary desc) as row_number
    from employees)
where row_number between 1 and 10;