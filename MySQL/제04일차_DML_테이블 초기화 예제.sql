drop table test;
create table test(
	num int auto_increment primary key,
    name varchar(10)
);
-- auto_increment로 1,2,3,4,5 순으로 출력
insert into test(name) values('1'),('2'),('3'),('4'),('5');
-- delete로 초기화 후 다시 출력 할 경우 테이블은 그대로
delete from test;
-- 재입력 후 출력 하면 auto_increment num이 6,7,8,9,10 출력
insert into test(name) values('1'),('2'),('3'),('4'),('5');
-- truncate로 초기화 후 출력 할 경우 테이블이 만들어졌던 상태로 복귀, 공간 삭제
truncate table test;
-- 재입력 후 출력하면 auto_increment num이 1,2,3,4,5 출력
insert into test(name) values('1'),('2'),('3'),('4'),('5');
select * from test;

/*
- delete로 초기화 : 데이터만 삭제, 쓰던 공간은 그대로. AI로 증가된 숫자 초기화 안됨.
- truncate로 초기화 : 최초 테이블이 만들어졌던 상태로 돌림. 공간도 같이 삭제
- 					AI(auto increment)로 증가된 숫자도 초기화
- drop으로 초기화 : 테이블을 삭제, 제약조건 포함하여 모두 삭제

*/