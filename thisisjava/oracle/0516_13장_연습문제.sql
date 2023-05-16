create sequence bbs_seq
    start with 1
    increment by 1
    nocycle
    cache 20;
    
create index idx_emps_realsal
on emps(coalesce(salary+salary*commission_pct, salary));