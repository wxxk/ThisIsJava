-- 함수
-- p63 LOWER, INITCAP, UPPER
-- LOWER : 소문자
-- INITCAP : 첫 문자만 대문자
-- UPPER : 대문자
select last_name, LOWER(last_name), initcap(last_name), upper(last_name)
from employees;

select last_name, LOWER(last_name), initcap(last_name), upper(last_name)
from employees
where last_name = 'austin';

select last_name, lower(last_name), initcap(last_name), upper(last_name)
from employees
where last_name = 'Austin';

select last_name, lower(last_name), initcap(last_name), upper(last_name)
from employees
where lower(last_name) = 'austin';

-- p64 LENGTH, INSTR
-- LENGTH : 문자열의 길이를 반환
-- INSTR : 주어진 문자의 위치를 반환
SELECT FIRST_NAME, LENGTH(first_name), INSTR(first_name, 'a')
from employees;

-- SUBSTR, CONCANT
-- SUBSTR : 두 번째 인수로 주어진 시작 위치에서 세 번째 인수로 지정한 개수만큼 부분 문자열 반환
-- CONCAT : 두 문자열 연결
select first_name, substr(first_name, 1, 3), concat(first_name, last_name)
from employees;

-- LPAD, RPAD
-- LPAD는 왼쪽에 남은 부분을 주어진 문자열로 채운다.
-- RPAD는 오른쪽에 남은 부분을 주어진 문자열로 채운다.
select 
    rpad(first_name, 10, '-') as name,
    lpad(salary, 10, '*') as sal
from employees;

-- LTRIM, RTRIM
-- LTRIM : 왼쪽부터 지정된 문자가 발견되면 제거
-- RTRIM : 오른쪽부터 지정된 문자가 발견되면 제거
select ltrim('JavaSpecialist', 'Java')
from dual;

select ltrim(' JavaSpecialist')
from dual;

select trim(' JavaSpecialist ')
from dual;

select rtrim(' JavaSpecialist ', '')
from dual;

-- REPLACE, TRANSLATE
-- REPLACE : 정의된 문자열에서 지정된 문자열을 새로운 문자열로 대체
-- TRANSLATE : 정의된 문자열을 1대1로 대응, 대응하는 문자가 없으면 해당 문자를 삭제
select replace('JavaSpecialist', 'Java', 'BigData') from dual;
select replace('Java Specialist', ' ', '') from dual;
select translate('javaspecialist', 'abcdefghijklmnopqrstuvwxyz', 'defghijklmnopqrstuvwxyzabc')
from dual;

select rpad(substr(first_name, 1, 3), length(first_name), '*')as name,
        lpad(salary, 10, '*')
from employees
where lower(job_id) = 'it_prog';

-- p70 REGEXP_LIKE 함수
create table test_regexp (col1 varchar2(10));

insert into test_regexp values('ABCDE01234');
insert into test_regexp values('01234ABCDE');
insert into test_regexp values('abcde01234');
insert into test_regexp values('01234abcde');
insert into test_regexp values('1-234-5678');
insert into test_regexp values('234-267890');

select *
from test_regexp
where regexp_like(col1, '[0-9][a-z]');

select *
from test_regexp
where regexp_like(col1, '[0-9]{3}-[0-9]{4}$');

select *
from test_regexp
where regexp_like(col1, '[[:digit:]]{3}-[[:digit:]]{4}$');

select *
from test_regexp
where regexp_like(col1, '[[:digit:]]{3}-[[:digit:]]{4}');

create table QA_MASTER (QA_NO VARCHAR2(10));

ALTER TABLE QA_MASTER ADD CONSTRAINT QA_NO_CHK CHECK
    (REGEXP_LIKE(QA_NO,
    '^([[:alpha:]]{2}-[[:digit:]]{2}-[[:digit:]]{4})$'));
    
insert into qa_master values('qa-01-0001');

insert into qa_master values('00-01-0001');

-- p72 REGEXP_INSTR 함수
insert into test_regexp values('@!=)(9&%#@');
insert into test_regexp values('자바3');

select col1,
    regexp_instr(col1, '[0-9]') as data1,
    regexp_instr(col1, '%') as data2
from test_regexp;

-- p73 REGEXP_SUBSTR 함수
select col1, regexp_substr(col1, '[C-Z]+')
from test_Regexp;

-- p74 REGEXP_REPLACE 함수
select col1, regexp_replace(col1, '[0-2]+', '*')
from test_regexp;

-- p75 REGEXP 함수 실전문제
select first_name, phone_number
from employees
where regexp_like(phone_number, '^[0-9]{3}.[0-9]{3}.[0-9]{4}$');

select first_name, phone_number
from employees
where regexp_like(phone_number, '^[[:digit:]]{3}.[[:digit:]]{3}.[[:digit:]]{4}$');

select first_name,
    regexp_replace(phone_number, '[[:digit:]]{4}$', '****') as phone,
    regexp_substr(phone_number, '[[:digit:]]{4}$') as phone2
from employees
where regexp_like (phone_number, '^[0-9]{3}.[0-9]{3}.[0-9]{4}$');

-- p77 ROUND, TRUNC
-- ROUND : 소수점 n 자리로 반올림
select round(45.923, 2), round(45.923, 0), round(45.923, -1)
from dual;
-- TRUNC : 소수점 n 자리로 절삭
select trunc(45.923, 2), trunc(45.923), trunc(45.923, -1)
from dual;

-- p78 날짜 함수
-- 날짜의 연산
select first_name, (sysdate - hire_date)/7 as "Weeks"
from employees
where department_id = 60;
-- 날짜 함수
-- MONTHS_BETWEEN : data1과 data2 사이의 월 수를 반환
select first_name, SYSDATE, hire_date,
        MONTHS_BETWEEN(SYSDATE, hire_date) AS workmonth
from employees
where first_name = 'Diana';
-- ADD_MONTHS : 월 수 n을 date에 더한다
select first_name, hire_date, ADD_MONTHS(hire_date, 100)
from employees
where first_name = 'Diana';
-- NEXT_DAY : date 다음의 명시된 요일을 날짜를 찾는다.
select sysdate, next_day(sysdate, '월')
from dual;
-- LAST_DAY : 현재 날짜를 기준으로 해당 월의 마지막 날짜를 출력한다.
SELECT SYSDATE, LAST_DAY(SYSDATE)
FROM DUAL;
-- ROUND, TRUNC
-- ROUND : fmt에 명시된 단위에 대해 반올림한 date를 반환
-- TRUNC : fmt에 명시된 단위에 대해 절삭한 date를 반환
select sysdate, round(sysdate), trunc(sysdate)
from dual;

select trunc(sysdate, 'Month')
from dual;

select trunc(sysdate, 'year')
from dual;

select round(to_date('17/03/16'), 'Month')
from dual;

select trunc(to_date('17/03/16'), 'Day')
from dual;

-- p84 변환 함수
-- 암시적 형 변환
select employee_id, first_name, hire_date
from employees
where hire_date = '03/06/17';

select employee_id, first_name, department_id
from employees
where department_id = '40';

-- p87 날짜를 문자로 변환
select first_name, to_char(hire_date, 'MM/YY') as HiredMonth
from employees
where first_name = 'Steven';

-- p90 TO_CHAR 함수 사용
select first_name, 
    to_char(hire_date, 'yyyy"년" MM"월" DD"일"') HIREDATE
from employees;

select first_name,
    to_char(hire_date, 'fmDdspth "of" Month YYYY fmHH:MI:SS AM',
    'NLS_DATE_LANGUAGE=english') as HIREDATE
from employees;

-- p91 숫자를 문자로 변환
-- TO_CHAR 함수 사용
select first_name, last_name, to_char(salary, '$999,999') SALARY
from employees
where first_name='David';

select to_char(2000000, '$999,999') SALARY
from dual;

select first_name, last_name,
        salary*0.123456 SALARY1,
        to_char(salary*0.123456, '$999,999.99') SALARY2
from employees
where first_name = 'David';

-- TO_NUMBER 함수
--select '$5,500.00 - from dual; 오류 발생
select to_number('$5,500.00', '$99,999.99') - 4000 from dual;

-- TO_DATE 함수
select first_name, hire_date
from employees
where hire_date = to_date('2003/06/17', 'YYYY/MM/DD');

select first_name, hire_date
from employees
where hire_date=to_date('2003년6월17일', 'YYYY"년"MM"월"DD"일"');