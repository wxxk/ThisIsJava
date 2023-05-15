-- p236 테이블생성과 관리
-- CREATE TABLE
create table dept (
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13));
    
-- 서브쿼리를 사용한 테이블 생성
drop table emp2;
create table emp2 as select * from employees;

select count(*) from emp2;

create table emp3 as select * from employees where 1=2;

select count(*) from emp3;

-- 테이블 구조 변경
create table emp_dept50
as
    select employee_id, first_name, salary*12 as ann_sal, hire_date
    from employees
    where department_id=50;
-- 열 추가    
alter table emp_dept50
add (job varchar2(10));

select * from emp_dept50;
-- 열 수정
alter table emp_Dept50
modify (first_name varchar2(30));

alter table emp_dept50
modify (first_name varchar2(10));
-- 열 삭제
alter table emp_Dept50
add (job_id varchar(20));

alter table emp_dept50
drop column job_id;

desc emp_dept50;
-- 열 이름 변경
alter table emp_dept50
rename column job to job_id;

desc emp_dept50;
-- SET UNUSERD 옵션과 DROP UNUSED 옵션
alter table emp_Dept50 set unused(first_name);

desc emp_Dept50;

alter table emp_dept50 drop unused columns;
-- 객체 이름 변경
rename emp_dept50 to employees_dept50;

-- 테이블 삭제(DROP TABLE)
drop table employees_dept50;

-- 테이블 데이터 비우기(TRUNCATE)
truncate table emp2;

select * from emp2;
