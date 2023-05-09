-- �Լ�
-- p63 LOWER, INITCAP, UPPER
-- LOWER : �ҹ���
-- INITCAP : ù ���ڸ� �빮��
-- UPPER : �빮��
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
-- LENGTH : ���ڿ��� ���̸� ��ȯ
-- INSTR : �־��� ������ ��ġ�� ��ȯ
SELECT FIRST_NAME, LENGTH(first_name), INSTR(first_name, 'a')
from employees;

-- SUBSTR, CONCANT
-- SUBSTR : �� ��° �μ��� �־��� ���� ��ġ���� �� ��° �μ��� ������ ������ŭ �κ� ���ڿ� ��ȯ
-- CONCAT : �� ���ڿ� ����
select first_name, substr(first_name, 1, 3), concat(first_name, last_name)
from employees;

-- LPAD, RPAD
-- LPAD�� ���ʿ� ���� �κ��� �־��� ���ڿ��� ä���.
-- RPAD�� �����ʿ� ���� �κ��� �־��� ���ڿ��� ä���.
select 
    rpad(first_name, 10, '-') as name,
    lpad(salary, 10, '*') as sal
from employees;

-- LTRIM, RTRIM
-- LTRIM : ���ʺ��� ������ ���ڰ� �߰ߵǸ� ����
-- RTRIM : �����ʺ��� ������ ���ڰ� �߰ߵǸ� ����
select ltrim('JavaSpecialist', 'Java')
from dual;

select ltrim(' JavaSpecialist')
from dual;

select trim(' JavaSpecialist ')
from dual;

select rtrim(' JavaSpecialist ', '')
from dual;

-- REPLACE, TRANSLATE
-- REPLACE : ���ǵ� ���ڿ����� ������ ���ڿ��� ���ο� ���ڿ��� ��ü
-- TRANSLATE : ���ǵ� ���ڿ��� 1��1�� ����, �����ϴ� ���ڰ� ������ �ش� ���ڸ� ����
select replace('JavaSpecialist', 'Java', 'BigData') from dual;
select replace('Java Specialist', ' ', '') from dual;
select translate('javaspecialist', 'abcdefghijklmnopqrstuvwxyz', 'defghijklmnopqrstuvwxyzabc')
from dual;

select rpad(substr(first_name, 1, 3), length(first_name), '*')as name,
        lpad(salary, 10, '*')
from employees
where lower(job_id) = 'it_prog';

-- p70 REGEXP_LIKE �Լ�
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

-- p72 REGEXP_INSTR �Լ�
insert into test_regexp values('@!=)(9&%#@');
insert into test_regexp values('�ڹ�3');

select col1,
    regexp_instr(col1, '[0-9]') as data1,
    regexp_instr(col1, '%') as data2
from test_regexp;

-- p73 REGEXP_SUBSTR �Լ�
select col1, regexp_substr(col1, '[C-Z]+')
from test_Regexp;

-- p74 REGEXP_REPLACE �Լ�
select col1, regexp_replace(col1, '[0-2]+', '*')
from test_regexp;

-- p75 REGEXP �Լ� ��������
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
-- ROUND : �Ҽ��� n �ڸ��� �ݿø�
select round(45.923, 2), round(45.923, 0), round(45.923, -1)
from dual;
-- TRUNC : �Ҽ��� n �ڸ��� ����
select trunc(45.923, 2), trunc(45.923), trunc(45.923, -1)
from dual;

-- p78 ��¥ �Լ�
-- ��¥�� ����
select first_name, (sysdate - hire_date)/7 as "Weeks"
from employees
where department_id = 60;
-- ��¥ �Լ�
-- MONTHS_BETWEEN : data1�� data2 ������ �� ���� ��ȯ
select first_name, SYSDATE, hire_date,
        MONTHS_BETWEEN(SYSDATE, hire_date) AS workmonth
from employees
where first_name = 'Diana';
-- ADD_MONTHS : �� �� n�� date�� ���Ѵ�
select first_name, hire_date, ADD_MONTHS(hire_date, 100)
from employees
where first_name = 'Diana';
-- NEXT_DAY : date ������ ��õ� ������ ��¥�� ã�´�.
select sysdate, next_day(sysdate, '��')
from dual;
-- LAST_DAY : ���� ��¥�� �������� �ش� ���� ������ ��¥�� ����Ѵ�.
SELECT SYSDATE, LAST_DAY(SYSDATE)
FROM DUAL;
-- ROUND, TRUNC
-- ROUND : fmt�� ��õ� ������ ���� �ݿø��� date�� ��ȯ
-- TRUNC : fmt�� ��õ� ������ ���� ������ date�� ��ȯ
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

-- p84 ��ȯ �Լ�
-- �Ͻ��� �� ��ȯ
select employee_id, first_name, hire_date
from employees
where hire_date = '03/06/17';

select employee_id, first_name, department_id
from employees
where department_id = '40';

-- p87 ��¥�� ���ڷ� ��ȯ
select first_name, to_char(hire_date, 'MM/YY') as HiredMonth
from employees
where first_name = 'Steven';

-- p90 TO_CHAR �Լ� ���
select first_name, 
    to_char(hire_date, 'yyyy"��" MM"��" DD"��"') HIREDATE
from employees;

select first_name,
    to_char(hire_date, 'fmDdspth "of" Month YYYY fmHH:MI:SS AM',
    'NLS_DATE_LANGUAGE=english') as HIREDATE
from employees;

-- p91 ���ڸ� ���ڷ� ��ȯ
-- TO_CHAR �Լ� ���
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

-- TO_NUMBER �Լ�
--select '$5,500.00 - from dual; ���� �߻�
select to_number('$5,500.00', '$99,999.99') - 4000 from dual;

-- TO_DATE �Լ�
select first_name, hire_date
from employees
where hire_date = to_date('2003/06/17', 'YYYY/MM/DD');

select first_name, hire_date
from employees
where hire_date=to_date('2003��6��17��', 'YYYY"��"MM"��"DD"��"');