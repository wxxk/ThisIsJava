-- 1번
create table member (
    userid varchar2(15) not null,
    name varchar2(20) not null,
    password varchar2(20) not null,
    phone varchar2(15),
    email varchar2(100)
);

-- 2번
insert into 
    member (userid, name, password, phone, email)
    values ('user123', '사용자', 'a1234567890', '011-234-5678', 'user@user.com');
    
-- 3번
select * from member
where userid = 'user123';

-- 4번
update member
set name ='홍길동', password = 'a1234',
    phone = '011-234-5678', email = 'user@user.co.kr'
where userid = 'user123';

-- 5번
delete from member
where userid = 'user123' and password = 'a1234';

-- 6번
truncate table  member;

-- 7번
drop table member;