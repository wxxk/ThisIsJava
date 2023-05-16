-- ������ ����
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
    
-- ������ Ȯ��
select sequence_name, min_value, max_value,
    increment_by, last_number
from user_sequences;

-- ������ ���
insert into depts(deptno, dname, loc)
values (depts_seq.nextval, 'MARKETING', 'SAN DIEGO');

select * from depts;

select depts_seq.currval
from dual;

-- ������ ����
alter sequence depts_seq
    maxvalue 99999;
    
-- ������ ����
drop sequence depts_seq;

select depts_seq.currval
from dual;  -- ������ ������ ���Ұ���

-- �ε��� ����
drop table emps;

create table emps as select * from employees;

select * from emps where first_name = 'David';

create index emps_first_name_idx
on emps(first_name);

-- �ε��� ����
drop index emps_first_name_idx;

-- �ε��� Ȯ��
select ic.index_name, ic.column_name,
    ix.uniqueness
from user_indexes ix, user_ind_columns ic
where ic.index_name = ix.index_name
and ic.table_name = 'EMPLOYEES';

-- �ε��� ����
-- ��Ʈ�� �ε���

-- ���� �ε���
select * from emps where email = 'DAUSTIN';

create unique index emps_email_idx on emps(email);

select * from emps where email='DAUSTIN';

-- �Լ���� �ε���
-- �Լ���� �ε��� ��� ��
select *
from emps
where coalesce(salary+salary*commission_pct, salary) > 10000;

create index emps_annsal_idx
on emps(coalesce(salary+salary*commission_pct, salary));

-- �Լ���� �ε��� ��� ��
select * from emps
where coalesce(salary+salary*commission_pct, salary) > 10000;

-- ���� �ε���
select * from emps
where first_name='Peter' and last_name = 'Hall';

create unique index emps_name_indx
on emps(first_name, last_name);

select * from emps
where first_name='Peter' and last_name='Hall';

-- ���Ǿ�
-- ������ ����
create synonym emp60
for emp_dept60;

drop synonym emp60;