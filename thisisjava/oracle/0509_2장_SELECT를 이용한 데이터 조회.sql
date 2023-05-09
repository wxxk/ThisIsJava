select first_name, job_id, department_id
from employees
where job_id = 'IT_PROG';

-- 2004년 이후 입사한 사원의 이름과 급여, 입사일을 출력
select first_name, salary, hire_date
from employees
where hire_date >= '04/01/01';

-- 2004년 입사한 사원의 이름, 급여, 입사일을 출력하세요
select first_name, salary, hire_date
from employees
where hire_date between '04/01/01' and '04/12/31';

-- 20, 30, 40 번 부서에 속하는 사원의 이름, 직무아이디, 부서아이디를 출력
select first_name, job_id, department_id
from employees
where department_id in (20, 30, 40);

-- 3월 입사한 사원의이름과 입사일을 출력
select first_name, hire_date
from employees
where hire_date like '%/03/%';

-- Pseudo column
select ROWNUM, first_name, hire_date
from employees
order by hire_date DESC, first_name;

-- p40 선택된 행 제한
-- where 절을 사용하여 반환하는 행을 제한한다.
-- where 절은 from 절 다음에 온다.
-- where 절은 열 이름, 비교 연산자, 비교할 열 이름 또는 값 목록으로 구성
select first_name, job_id, department_id
from employees
where job_id = 'IT_PROG';

-- p41 문자와 날짜
-- 문자, 문자열, 날짜는 단일 인용부호로 둘러싸여 있다.
-- 문자 값든 대/소문자를 구분하고, 날짜 값은 날짜 형식을 구분한다.
-- RR/MM/DD
select first_name, last_name, hire_date
from employees
where last_name = 'King';

-- p42 비교 연산자
-- 급여가 15000 이상인 사원
select first_name, salary, hire_date
from employees
where salary >= 15000;
-- 입사일이 2004년 1월 30일인 사원
select first_name, salary, hire_date
from employees
where hire_date = '04/01/30';
-- first_name이 Steven인 사원
select first_name, salary, hire_date
from employees
where first_name = 'Steven';

-- p43 BETWEEN 연산자
-- 값의 범위에 해당하는 행을 출력하기 위해 사용
-- 하한값을 먼저 명시하낟.
-- 하한값과 상한값을 모두 포함한다.
select first_name, salary
from employees
where salary between 10000 and 12000;
-- 2003년 입사자의 이름, 급여, 입사일을 출력
select first_name, salary, hire_date
from employees
where hire_date between '03/01/01' and '03/12/31';
-- 이름이 A또는 B로 시작하는 사원의 이름, 급여, 입사일 출력
select first_name, last_name, salary, hire_date
from employees
where last_name between 'A' and 'Bzzzzzzzzzzz';

-- p44 IN 연산자
-- 목록에 있는 값들과 비교하기 위해서 IN 연산자를 사용한다
-- 관리자의 사원번호가 101, 102, 103인 모든 사원의 사원번호, 이름, 급여, 관리자의 사원번호 출력
select employee_id, first_name, salary, manager_id
from employees
where manager_id in (101, 102, 103);

select first_name, last_name, job_id, department_id
from employees
where job_id in ('IT_PROG', 'FI_MGR', 'AD_VP');

-- p45 LIKE 연산자
-- 검색 문자열에 대한 와일드카드 검색을 위해서 LIKE 연산자를 사용
-- 검색 조건은 문자나 날짜를 포함할 수 있다.
-- %는 0개 이상의 문자를 대체한다.
-- _는 하나의 문자를 대체한다
select first_name, last_name, job_id, department_id
from employees
where job_id LIKE 'IT%';
-- 2003년 1월 1일과 12월 31일 사이에 입사한 모든 사원의 이름과 입사일
select first_name, hire_date
from employees
where hire_date like '03%';
-- 이메일을 두번째 문자가 "A"인 모든 사원의 이름과 이메일 출력
select first_name, email
from employees
where email like '_A%';
-- job_id가 "SA_M"을 포함하는 사원의 이름과 JOB_ID를 출력
select first_name, job_id
from employees
where job_id like 'SA/_M%' escape '/';

-- p49 IS NULL 연산자
select first_name, job_id, commission_pct
from employees
where commission_pct is null;

select first_name, job_id, commission_pct
from employees
where commission_pct is not null;

-- p50 논리연산자
-- AND는 양쪽 조건이 참이면 TRUE
-- OR는 한쪽 조건이 참이면 TRUE
-- NOT은 뒤의 조건에 반대되는 결과를 반환
select first_name, job_id, salary
from employees
where job_id='IT_PROG' AND salary>=5000;

select first_name, job_id, salary
from employees
where job_id = 'IT_PROG' or salary >= 5000;

select first_name, department_id
from employees
where department_id not in (50, 60, 70, 80, 90, 100);

select first_name, department_id
from employees
where department_id not between 50 and 100;

-- p51 shsfl dustkswk dntjstnsdnl
-- AND, OR, NOT 연산자의 우선순위는 비교 연산제에 비교하여 낮다
-- AND연산자가 OR연산자보다 우선순위가 높다
select first_name, job_id, salary
from employees
where job_id = 'IT_PROG'
or job_id = 'FI_MGR'
and salary >= 6000;

select first_name, job_id, salary
from employees
where (job_id = 'IT_PROG' or job_id = 'FI_MGR')
and salary >= 6000;

-- p51 데이터 정렬
-- 질의에 의해 검색되는 행을 정렬할 수 있다
-- ORDER BY 절은 SELECT 문장의 가장 뒤에 온다.
-- ASC : 오름차순으로 정렬. 기본값
-- DESE : 내림차순으로 정렬
select first_name, hire_date
from employees
order by hire_date;

select first_name, hire_date
from employees
order by hire_date desc;

select first_name, salary*12 as annsal
from employees
order by annsal;

select first_name, salary*12 as annsal
from employees
order by 2;