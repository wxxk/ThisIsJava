-- 시퀀스 생성
create sequence depts_seq
    start with 91
    increment by 1
    maxvalue 100
    nocycle
    nocache;
    
drop table depts cascade constraints;

create table depts (
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13),
    constraint depts_dname_up unique(dname),
    constraint depts_deptno_pk primary key(deptno));
    
-- 시퀀스 확인
select sequence_name, min_value, max_value,
    increment_by, last_number
from user_sequences;

-- 시퀀스 사용
insert into depts(deptno, dname, loc)
values (depts_seq.nextval, 'MARKETING', 'SAN DIEGO');

select * from depts;

select depts_seq.currval
from dual;

-- 시퀀스 수정
alter sequence depts_seq
    maxvalue 99999;
    
-- 시퀀스 삭제
drop sequence depts_seq;

select depts_seq.currval
from dual;  -- 삭제된 시퀀스 사용불가능

-- 인덱스 생성
drop table emps;

create table emps as select * from employees;

select * from emps where first_name = 'David';

create index emps_first_name_idx
on emps(first_name);

-- 인덱스 삭제
drop index emps_first_name_idx;

-- 인덱스 확인
select ic.index_name, ic.column_name,
    ix.uniqueness
from user_indexes ix, user_ind_columns ic
where ic.index_name = ix.index_name
and ic.table_name = 'EMPLOYEES';

-- 인덱스 종류
-- 비트맵 인덱스

-- 유일 인덱스
select * from emps where email = 'DAUSTIN';

create unique index emps_email_idx on emps(email);

select * from emps where email='DAUSTIN';

-- 함수기반 인덱스
-- 함수기반 인덱스 사용 전
select *
from emps
where coalesce(salary+salary*commission_pct, salary) > 10000;

create index emps_annsal_idx
on emps(coalesce(salary+salary*commission_pct, salary));

-- 함수기반 인덱스 사용 후
select * from emps
where coalesce(salary+salary*commission_pct, salary) > 10000;

-- 복합 인덱스
select * from emps
where first_name='Peter' and last_name = 'Hall';

create unique index emps_name_indx
on emps(first_name, last_name);

select * from emps
where first_name='Peter' and last_name='Hall';

-- 동의어
-- 생성과 삭제
create synonym emp60
for emp_dept60;

drop synonym emp60;