-- test database 생성
-- create database test;
-- test database 가 존재하지 않으면 test database 생성
create database if not exists test;
-- test database 선택
use test;
-- test database 삭제
-- drop database test;
-- test database 가 존재하면 test database 삭제
-- drop database if exists test;
-- member table create
-- 속성으로 id(최대 문자열 13, 기본키), 비번(최대 문자열 20), 이름을 가짐
create table member(
	id varchar(13)primary key,
    pw varchar(20) not null,
    name varchar(30) not null
);
-- auto_increment : 기본키만 가능 , 테이블당 최대 1개만 설정 ->자동 증가
create table board(
	num int auto_increment primary key,
    title varchar(50) not null,
    contents longtext not null,
    writer varchar(13) not null,
    -- board table에 writer 속성을 member 테이블의 id와 연결(외래키 설정)
    foreign key(writer) references member(id)
);
-- board 테이블에 조회수 추가
alter table board add views int default 0;
-- board 테이블 조회수 삭제
alter table board drop views;
-- board 테이블에 잘못된 조회수 추가
alter table board add views varchar(10);
-- board 테이블에 잘못된 조회수를 올바르게 수정
alter table board modify views int default 0;
-- 조회수 이름을 views2로 수정
alter table board change views views2 int default 0;
-- views2를 views로 수정
alter table board change views2 views int default 0;
-- board 테이블에 있는 writer 제약조건(외래키)을 삭제
alter table board drop  constraint board_ibfk_1;
-- board 테이블에 writer와 member 테이블에 id를 외래키로 연결(제약조건 추가)
alter table board 
	add  constraint fk_board_writer
		foreign key(writer) references member(id);
-- 워크벤치에서 추가한 board2 테이블 삭제
drop table if exists board2; 

create database if not exists shoppingmall;
use shoppingmall;
create table member(
	id varchar(13)primary key,
    pw varchar(20) not null,
    name varchar(30) not null,
    birth_date varchar(12) not null,
    authority varchar(10) not null
);
create table product(
	product_number int not null,
    product_name varchar(30) not null,
    product_detail longtext not null,
    product_amount int not null,
    product_price int not null,
    product_category_code int not null
);
create table board(
	num int auto_increment primary key,
    title varchar(30) not null,
    contents longtext not null,
    writer varchar(10) not null,
    date date,
    views int not null
);
create table buy(
	payment_num int not null,
    state varchar(10) not null,
    amount int not null,
    buy_price varchar(10) not null,
    address varchar(20) not null,
    postcode int not null,
    id varchar(13) not null,
    product_number int not null,
    foreign key(id) references member(id),
    foreign key(product_number) references product(product_number)
);
create table inquiry(
inquiry_number varchar(10) not null,
inquiry_answer longtext not null,
inquiry_satate varchar(10) not null,
inquiry_contents longtext not null
);