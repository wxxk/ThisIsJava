create table emps as select * from employees;
delete from emps where departemtn_id=10;

savepoint delete_10;

delete from emps where department_id=20;
savepoint delete_20;

delete from emps where department_id=30;

rollback to savepoint delete_20;

select * from employees for update;

lock table employees in exclusive mode;

lock table employees in share mode nowait;

SELECT S.SID, S.SERIAL#, S.USERNAME, S.STATUS	
FROM V$SESSION S, V$LOCK L, DBA_OBJECTS O	
WHERE S.SID=L.SID	AND	L.ID1=O.OBJECT_ID
    AND L.TYPE='TM'	AND	O.OBJECT_NAME='EMPLOYEES';

--create table emp as
--    select employee_id as empno, first_name as ename,
--        salary as sal, department_id as deptno
--    from employees;
