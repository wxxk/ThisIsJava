-- 1번
create table emp_temp as select * from employees;

-- 2번
delete from emp_temp where department_id=20;
savepoint SVPNT_DEL_20;

-- 3번
delete from emp_temp where department_id = 50;
savepoint SvPNT_DEL_50;

-- 4번
delete from emp_temp where department_id = 60;

rollback to savepoint SvPNT_DEL_50;
