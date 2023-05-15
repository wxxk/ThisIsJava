-- ��������
-- �������� Ȯ��
select * from user_constraints;

-- �� ���� ��������
create table emp4 (
    empno number(4) constraint emp4_empno_pk primary key,
    ename varchar2(10) not null,
    sal number(7,2) constraint emp4_sal_ck check(sal<=10000),
    deptno number(2) constraint mep4_deptno_dept_deptid_fk
                    references departments(department_id)
);
-- ���̺� ���� ��������
create table emp5 (
    empno number(4),
    ename varchar2(10) not null,
    sal number(7,2),
    deptno number(2),
    constraint emp5_empno_pk primary key (empno),
    constraint emp5_sal_ck check(sal<=10000),
    constraint emp5_deptno_dept_deptid_fk
        foreign key (deptno) references departments(department_id)
);

-- �������� ����
-- NOT NULL ��������
-- PRIMARY KEY ��������
create table depts (
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13),
    constraint depts_dname_uk unique(dname),
    constraint depts_deptno_pk primary key(deptno));
--- UNIQUE ��������
alter table emp4
add (nickname varchar2(20));

alter table emp4
add constraint emp4_nickname_uk unique(nickname);

insert into emp4
values (1000, 'KILDONG', 2000, 10, null);

insert into emp4
values (2000, 'KILSEO', 3000, 20, 'KSEO');

--update emp4 set nickname='KSEO' WHERE empno=1000;
-- 'KSEO ���� ���� ���� �����ϹǷ� �ߺ��� ���� ���� ���� �߰��� �� ����.'

-- FOREIGN KEY ��������
create table emps (
    empno number(4),
    ename varchar2(10) not null,
    job varchar2(9),
    mgr number(4),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2) not null,
    constraint emps_empno_pk primary key(empno),
    constraint emps_depts_deptno_fk foreign key(deptno)
        references depts(deptno) );
-- CHECK ��������
create table emp4 (
    empno number(4) constraint emp4_empno_pk primary key,
    ename varchar2(10) not null,
    sal number(7,2) constraint emp4_sal_ck check(sal<=100000),
    deptno number(2) constraint emp4_deptno_dept_deptid_fk
        references departments(department_id)
);

-- �������� ����
-- �������� �߰�
alter table emps
    add constraint emps_mgr_fk
        foreign key(mgr) references emps(empno);
-- �������� ��ȸ
select constraint_name, constraint_type, status
from user_constraints
where table_name = 'EMPS';
-- �������� ����
alter table emps drop constraint emps_mgr_fk;

alter table depts drop primary key cascade;

select constraint_name, constraint_type, status
from user_constraints
where table_name='EMPS';

alter table emp4 disable constraint emp4_sal_ck;
insert into emp4 (empno, ename, sal, deptno)
    values (9999, 'KING', 20000, 10);
select * from emp4;