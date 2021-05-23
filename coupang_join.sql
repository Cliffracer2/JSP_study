create SEQUENCE member_seq;
drop SEQUENCE member_seq;

create table coupang_member (
    member_number number(20),
    email         varchar2(50) PRIMARY KEY,
    password      varchar2(20) not null,
    name          varchar2(20) not null,
    phone         varchar2(13) not null,
    postcode      varchar2(10),
    address       varchar2(200),
    joindate      varchar2(50) not null,
    membergrade   varchar2(20) not null
);

select * from coupang_member;

commit;