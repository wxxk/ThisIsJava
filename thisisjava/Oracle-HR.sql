select * from employees; --Ctrl Enter
insert into employees 
values (300, 'JinKyoung', 'Heo', 'HEOJK', '010-111-2222', sysdate, 'IT_PROG', 10000, null, 103, 60);
commit;

select * from employees;


create table users (
    userid varchar2(50) primary key,
    username varchar2(50) not null,
    userpassword varchar2(50) not null,
    userage number(3) not null,
    useremail varchar2(50) not null
);


create table boards (
    bno number  primary key,
    btitle  varchar2(100)   not null,
    bcontent    clob    not null,
    bwriter varchar(50)    not null,
    bdate   date    default sysdate,
    bfilename   VARCHAR2(50)    null,
    bfiledata    blob    null
);


create sequence seq_bno nocache;

create table accounts (
    ano     varchar(20)     primary key,
    owner   varchar(20)     not null,
    balance number          not null
);

insert into accounts(ano, owner, balance)
values ('111-111-1111', '하여름', 1000000);

insert into accounts(ano, owner, balance)
values ('222-222-2222', '한겨울', 0);

commit;

select * from users;
select * from accounts;

create or replace procedure user_create (
    a_userid in users.userid%type,
    a_username in users.username%type,
    a_userpassword in users.userpassword%type,
    a_userage in users.userage%type,
    a_useremail in users.useremail%type,
    a_rows out pls_integer
)
is
begin
    insert into users (userid, username, userpassword, userage, useremail)
    values (a_userid, a_username, a_userpassword, a_userage, a_useremail);
    a_rows := sql%rowcount;
    commit;
end;

create or replace function user_login (
    a_userid users.userid%type,
    a_userpassword users.userpassword%type
) return pls_integer
is -- is 안에는 변수 선언
    v_userpassword users.userpassword%type;
    v_result pls_integer;
begin
    select userpassword into v_userpassword -- select into는 pl/sql에서만 사용가능
    from users
    where userid = a_userid;
    
    IF v_userpassword = a_userpassword THEN
        return 0;
    ELSE
        return 1;
    END IF;
exception
    when no_data_found then
        return 2;
end;

select * from boards;
select * from users;
select * from accounts;



CREATE TABLE customer (
  ssn 		VARCHAR2(15) 	PRIMARY KEY,
  cust_name	VARCHAR2(40) 	NOT NULL,
  address 	VARCHAR2(100) 	NOT NULL 
);

CREATE TABLE stock (
  symbol 	VARCHAR2(8) 	PRIMARY KEY,
  price 	NUMBER(10, 3) 	NOT NULL 
);

CREATE TABLE shares (
  ssn 		VARCHAR2(15) 	NOT NULL,
  symbol 	VARCHAR2(8) 	NOT NULL,
  quantity 	NUMBER(4) 		NOT NULL 
);

INSERT INTO customer VALUES('111-111', 'Heo', 'Seoul');
INSERT INTO customer VALUES('111-112', 'Kim', 'Jeju');
INSERT INTO customer VALUES('111-113', 'Lee', 'Busan');
INSERT INTO customer VALUES('111-114', 'Hong', 'Seoul');
INSERT INTO customer VALUES('111-115', 'Park', 'Gwangju');
INSERT INTO customer VALUES('111-116', 'Sun', 'Incheon');
INSERT INTO customer VALUES('111-117', 'You', 'Seoul');
INSERT INTO customer VALUES('111-118', 'Seo', 'Seoul');

INSERT INTO stock VALUES ('SUN', 68.25);
INSERT INTO stock VALUES ('CyAs', 22.625);
INSERT INTO stock VALUES ('DUKE', 6.25);
INSERT INTO stock VALUES ('ABStk', 18.5);
INSERT INTO stock VALUES ('JSVCo', 9.125);
INSERT INTO stock VALUES ('TMAs', 82.375);
INSERT INTO stock VALUES ('BWInc', 11.375);
INSERT INTO stock VALUES ('GMEnt', 44.625);
INSERT INTO stock VALUES ('PMLtd', 203.375);
INSERT INTO stock VALUES ('JDK', 33.5);

COMMIT;

select * from stock;