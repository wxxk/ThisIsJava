-- 분석함수
-- p143 순위 구하기 함수 - rank, dense_rank, row_number
select employee_id, department_id, salary,
    rank() over (order by salary desc) sal_rank,
    DENSE_RANK() over (order by salary desc) sal_dense_rank,
    row_number() over (order by salary desc) sal_number
from employees;

-- p144 가상순위와 분포 - CUME_DIST, PERCENT_RANK
select employee_id, department_id, salary,
    cume_dist() over (order by salary desc) sal_cume_dist,
    percent_rank() over (order by salary desc) sal_pct_rank
from employees;

select employee_id, department_id, salary,
    cume_dist() over (order by commission_pct desc)
comml_cume_dist,
    percent_rank() over (order by commission_pct desc)
    comm_pct_rank
from employees;

-- p145 비율 함수 - ratio to report
select first_name, salary,
    round(ratio_to_report(salary) OVER (), 4) as salary_ratio
from employees
where job_id = 'IT_PROG';

select department_id, salary,
    round(avg(salary) over (partition by department_id), 2)
from employees;

select department_id, round(avg(salary), 2)
from employees
group by department_id;

-- p146 분배 함수 - NTILE
select employee_id, department_id, salary,
    ntile(10) over (order by salary desc) sal_quart_tile
from employees
where department_id = 50;

-- p147 LAG, LEAD
select employee_id,
    lag(salary, 1, 0) over (order by salary) as lower_sal,
    salary,
    lead(salary, 1, 0) over (order by salary) as higher_sal
from employees
order by salary;

-- p148 LISTAGG
select department_id,
    listagg(first_name, ',') within group(order by first_name) as names
from employees
group by department_id;

-- p 150 윈도우 절 사용
select department_id, salary,
    sum(salary) over (partition by department_id
        order by salary
        rows between unbounded preceding
            and current row) as sum_rows
from employees;

-- p152 REGR_AVGS(y, x), REGR_AVGY(y, x)
select
    avg(salary),
    regr_avgx(commission_pct, salary)
from employees;

select avg(salary)
from employees
where commission_pct is not null;

-- p153 REGR_COUNT(y, x)
select
    distinct
        department_id,
        regr_count(manager_id, department_id)
            over (partition by department_id) "REGR_COUNT"
from employees
order by department_id;

select department_id, count(*)
from employees
group by department_id
order by department_id;

-- p154 REGR_SLOPE(y, x), REGR_INTERCEPT(y, x)
select
    job_id, employee_id, salary,
    round(sysdate-hire_date) "WORKING_DAY",
    round(regr_slope(salary, sysdate-hire_date)
        over (partition by job_id), 2) "REGR_SLOPE",
    round(regr_intercept(salary, sysdate-hire_date)
        over(partition by job_id), 2) "regr_intercept"
from employees
where department_id = 80
order by job_id, employee_id;

-- p155 REGR_R2(y, x)
select
    distinct
    job_id,
    round(regr_slope(salary, sysdate-hire_date)
        over (partition by job_id), 2) "REGR_SLOPE",
    round(regr_intercept(salary, sysdate-hire_date)
        over (partition by job_id), 2) "REGR_INTERCEPT",
    round(regr_r2(salary, sysdate-hire_date)
        over (partition by job_id), 2) "REGR_R2"
from employees
where department_id = 80;


-- 피벗 테이블
-- p156 관계형 데이터베이스 형식과 스프레드시트 형식
create table sales_log(
    employee_id number(6),
    week_id number(2),
    week_day varchar2(10),
    quantity number(8,2)
);

insert into sales_log values(1101, 4, 'SALES_MON', 100);
insert into sales_log values(1101, 4, 'SALES_TUE', 150);
insert into sales_log values(1101, 4, 'SALES_WED', 80);
insert into sales_log values(1101, 4, 'SALES_THU', 60);
insert into sales_log values(1101, 4, 'SALES_FRI', 120);
insert into sales_log values(1101, 5, 'SALES_MON', 300);
insert into sales_log values(1101, 5, 'SALES_TUE', 300);
insert into sales_log values(1101, 5, 'SALES_WED', 230);
insert into sales_log values(1101, 5, 'SALES_THU', 120);
insert into sales_log values(1101, 5, 'SALES_FRI', 150);
commit;
select * from sales_log;

create table sales(
    employee_id number(6),
    week_id number(2),
    sales_mon number(8,2),
    sales_tue number(8, 2),
    sales_wed number(8, 2),
    sales_thu number(8, 2),
    sales_fri number(8, 2)
);
insert into sales values(1101, 4, 100, 150, 80, 60, 120);
insert into sales values(1102, 5, 300, 300, 230, 120, 120);
commit;
select * from sales;

select sum(quantity)
from sales_log
where week_day='SALES_MON';

-- PIVOT
select *
from sales_log
pivot
(
    sum(quantity)
    for week_day IN('SALES_MON' as sales_mon,
                    'SALES_TUE' as sales_tue,
                    'SALES_WED' as sales_wed,
                    'SALES_THU' as sales_THU,
                    'SALES_FRI' as sales_fri)
)
order by employee_id, week_id;

create or replace view sales_log_view as 
    select employee_id, week_day, quantity
    from sales_log;
    
select *
from sales_log_view
pivot
(
    sum(quantity)
    for week_day in('SALES_MON' as sales_mon,
                    'SALES_TUE' as sales_tue,
                    'SALES_WED' as sales_wed,
                    'SALES_THU' as sales_THU,
                    'SALES_FRI' as sales_fri)
)
order by employee_id;

with temp as (
    select employee_id, week_day, quantity
        from sales_log
)
select *
from temp
pivot
(
    sum(quantity)
    for week_day in ('SALES_MON' as sales_mon,
                    'SALES_TUE' as sales_tue,
                    'SALES_WED' as sales_wed,
                    'SALES_THU' as sales_THU,
                    'SALES_FRI' as sales_fri)
)
order by employee_id;

-- UNPIVOT
select employee_id, week_id, week_day, quantity
from sales
unpivot
(
    quantity
    for week_Day
    in(sales_mon, sales_tue, sales_wed, sales_thu, sales_fri)
);    