-- 1��
create table member (
    userid varchar2(15) not null,
    name varchar2(20) not null,
    password varchar2(20) not null,
    phone varchar2(15),
    email varchar2(100)
);

-- 2��
insert into 
    member (userid, name, password, phone, email)
    values ('user123', '�����', 'a1234567890', '011-234-5678', 'user@user.com');
    
-- 3��
select * from member
where userid = 'user123';

-- 4��
update member
set name ='ȫ�浿', password = 'a1234',
    phone = '011-234-5678', email = 'user@user.co.kr'
where userid = 'user123';

-- 5��
delete from member
where userid = 'user123' and password = 'a1234';

-- 6��
truncate table  member;

-- 7��
drop table member;