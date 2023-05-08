select first_name, last_name, job_id, salary
from employees --주석
;
-- 주석 구문

-- p28 SQL 문장 작성
select first_name, last_name, salary
from employees;

-- p29 모든 열 선택
select * from departments;

select department_id, department_name, manager_id, location_id
from departments;

-- p30 특정 열 선택
select department_name, location_id
from departments;

select location_id, department_name
from departments;

-- p31 기본 표시 형식
-- 날짜와 문자 데이터는 왼쪽 정렬
-- 숫자 데이터는 오른쪽 정렬
-- 디폴트 열 헤딩은 대문자로 출력
select first_name, hire_date, salary
from employees;

-- p32 산술 표현식
-- 출력 방식을 수정하거나, 계산하고자 할 때 산술연산자 표현식 사용 가능
-- 표시되는 열이름 AS로 바꿀 수 있다.
select first_name, last_name, salary, salary + 300 as salary2, salary * 1.1
from employees;

-- p33 연산자 우선순위
-- 곱하기와 나누기는 더하기와 빼기보다 우선순위가 높다.
-- 같은 우선순위의 연산자는 좌측에서 우측으로 계산
-- 괄호는 강제로 계산의 우선순위를 바꾸거나 문장을 명료하게 하려고 사용
select first_name, last_name, salary, salary*1.1
from employees;

-- p34 NULL
-- Null은 이용할 수 없거나, 지정되지 않았거나, 알 수 없거나, 적용할 수 없는 값
-- Null은 숫자 0이나 공백과는 다르다
select first_name, department_id, commission_pct
from employees;

--p35 열 별칭 정의
-- 열 헤딩 이름을 변경한다.
-- 계산할 때 유용한다
-- 열 이름은 발 뒤에 둔다. 'AS'를 넣기도 한다.
-- 공백이나 특수문자 또는 대/소문자가 있으며 ""가 필요하다
select first_name AS 이름, salary 급여
from employees;

select first_name "Employee name",
        salary*12 "Annual Salary"
from employees;

-- p36 리터럴 문자 스트링과 연결 연산자
-- select 절에 포함된 리터럴은 문자 표현식 또는 숫자이다.
-- 날짜와 문자 리터럴 값은 ''를 사용하지 않는다.
-- 각각의 문자 스트링은 반환된 각 행에 관한 결과이다.
-- ||를 이용하면 값을 연결해 준다.
select first_name || ' ' || last_name || '''s salary is $' || salary
-- '''s salary is $' : 두개의 ''를 이용해서 하나의 '를 나타낸다
-- 문자열 안에 인용 부호를 넣으려면 두 개의 인용 부호를 사용하여 인용 부호를 이스케이프(escape) 해야 한다.
    AS "Employee Details"
from employees;

-- p37 중복 행과 DISTINCT
-- 질의의 디폴트 출력은 중복되는 행을 포함하는 모든 행이다.
-- select 절에서 distinct 키워드를 사용하여 중복되는 행을 제거한다
select department_id
from employees;

select distinct department_id
from employees;

-- p38 ROWID< ROWNUM 의사열
-- 의사열은 실제 테이블에 없는 열이지만 select 절에 열처럼 사용되는 가상의 열을 의미한다.
-- select로 조회는 가능하지만 insert, update, delete는 수행할 수 없다.
select ROWID, ROWNUM, employee_id, first_name
from employees;
