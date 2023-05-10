-- 1. 이메일에 lee를 포함하는 사원의 모든 정보를 출력하세요.
select * from employees where email like '%LEE%';

-- 2. 매니저 아이디가 103인 사원들의 이름과 급여, 직무 아이디를 출력하세요
select first_name, salary, job_id
from employees
where manager_id = 103;

-- 3. 80번 부서에 근무하면서 직무가 SA_MAN인 사원의 정보와 20번 부서에 근무하면서 매니저 아이디가 100인 사원의 정보를 출력하세요.
select * from employees
where (department_id = 80 and job_id = 'SA_MAN') or (department_id = 20 and manager_id = 100);

-- 4. 모든 사원의 전화번호를 ###-####-#### 형식으로 출력하세요
select regexp_replace(phone_number, '^[[:digit:]]{3}.[[:digit:]]{3}.[[:digit:]]{4}$', '###-###-####') from employees;

-- 5. 직무가 IT_PROG인 사원 중에서 급여가 5000 이상인 사원들의 이름(full name), 급여 지급액, 입사일(2005-02-15 형식), 근무한 일수를 출력
-- 이름순으로 정렬, 이름은 최대 20자리, 남는 자리는 *로 채우고
-- 급여 지급액은 소수점 2자리를 포함한 최대 8자리, $표시, 남은 자리는 0으로 채워 출력하세요
select rpad(first_name || ' ' || last_name, 20, '*') as FULL_NAME, 
    to_char(coalesce (salary + salary + commission_pct, salary), '$009,999.99') as SALARY,  
    to_char(hire_date, 'YYYY-MM-DD') as HIRE_DATE,
    round(sysdate - hire_date) as WORK_DAY
from employees
where job_id = 'IT_PROG' and salary >= 5000
order by FULL_NAME;

-- 6
select rpad(first_name || ' ' || last_name, 20, '*') as FULL_NAME,
    to_char(salary, '$009,999.99') as SALARY,
    to_char(hire_date, 'YYYY"년" MM"월" DD"일"') as HIRE_DATE,
--    trunc((sysdate - hire_date)/12) as MONTH,
    trunc(months_between(sysdate, hire_date)) as MONTH
from employees
where department_id = 30
order by SALARY desc;

-- 7
select rpad(first_name || ' ' || last_name, 17, '*') as 이름,
    to_char(coalesce (salary + salary * commission_pct, salary), '$99,999.99') as 급여
from employees
where department_id = 80 and salary > 10000;

-- 8
select first_name || ' ' || last_name as 이름,
    decode(trunc(trunc(months_between(sysdate, hire_date)/12)/5), 
        1, '5년차',
        2, '10년차',
        3, '15년차',
        '기타') as 근무년수
from employees
where department_id = 60;

-- 9
select hire_date + 1000
from employees
where first_name = 'Lex';

-- 10
select first_name, hire_date
from employees
where to_char(hire_date, 'MM') = 05;

-- 11
select first_name, salary, to_char(hire_date, 'YYYY"년 입사"') as YEAR,
    to_char(hire_date, 'DAY') as DAY, 
    case when to_number(to_char(hire_date, 'YYYY')) >= 2010 then to_char(salary * 1.5, '$999,999')
        when to_number(to_char(hire_date, 'YYYY')) >= 2005 then to_char(salary * 1.05, '$999,999')
        else to_char(salary, '$999,999')
    end as INCREASING_SALARY
from employees;

-- 12
select first_name, salary, to_char(hire_date, 'YYYY"년 입사"') as YEAR,
    case when to_number(to_char(hire_date, 'YYYY')) = 2010 then salary * 1.1
        when to_number(to_char(hire_date, 'YYYY')) = 2005 then salary * 1.05
        else salary
    end as INCREASING_SALARY2
from employees;

-- 13
select country_id,nvl(state_province, country_id) as state
from locations;