-- 1¹ø
create table member (
    userid varchar(15),
    name varchar(20),
    phone varchar(15),
    email varchar(100)
);
alter table member
add constraint member_userid_pk primary key(userid);

-- 2¹ø
create table dept (
    deptno number(2),
    dname varchar2(14),
    loc varchar2(13),
    constraint pk_dept primary key(deptno)
);

create table emp (
    empno number(4,0),
    ename varchar2(10),
    job varchar2(9),
    mgr number(4,0),
    hiredate date,
    sal number(7,2),
    comm number(7,2),
    deptno number(2,0),
    constraint pk_emp primary key(empno),
    constraint fk_deptno foreign key(deptno)
        references dept(deptno)
);