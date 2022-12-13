UPDATE `small_jik`.`member` 
	SET `me_id` = 'abc', `me_pw` = 'abc', `me_name` = 'ABC마트', `me_authority` = 'MEMBER', `me_point` = '0' 
	WHERE (`me_id` = 'a_bc');
INSERT INTO `small_jik`.`member` (`me_id`, `me_pw`, `me_name`, `me_birth`, `me_authority`, `me_point`) 
	VALUES ('qwe', 'qwe', '홍길동', '2002-01-01', 'MEMBER', '0');
INSERT INTO `small_jik`.`member` (`me_id`, `me_pw`, `me_name`, `me_authority`) 
	VALUES ('admin', 'admin', '관리자', 'ADMIN');
INSERT INTO `small_jik`.`member` (`me_id`, `me_pw`, `me_name`, `me_birth`, `me_authority`, `me_point`) 
	VALUES ('hi', 'hi', '고길동', '2001-12-12', 'MEMBER', '0');

/* 카테고리 등록(메인)
-의류
	- 여성
	- 남성
    - 아동
    - 남여공용
-식품
	- 과일
    - 채소
    - 과자
    - 쌀/잡곡
-가전
	- TV
    - 냉장고
    - 에어컨
-스포츠
	- 수영
    - 골프
    - 자전거
-문구
	-사무용품
    -미술용품
*/
insert into main_category(mc_name)
	values ('의류'),('식품'),('가전'),('스포츠'),('문구');
select * from main_category;
/* insert into ...select문
insert into sub_category(sc_name,sc_mc_num)
 	select '여성',mc_num from main_category where mc_name = '의류';
insert into sub_category(sc_name,sc_mc_num)
 	select '과일',mc_num from main_category where mc_name = '식품';
 insert into sub_category(sc_name,sc_mc_num)
 	select 'TV',mc_num from main_category where mc_name = '가전';
 insert into sub_category(sc_name,sc_mc_num)
 	select '수영',mc_num from main_category where mc_name = '스포츠';
-insert into sub_category(sc_name,sc_mc_num)
 	select '사무용품',mc_num from main_category where mc_name = '문구';
select * from sub_category;
*/
insert into sub_category(sc_name,sc_mc_num)
	values('여성',1),('남성',1),('아동',1),('남여공용',1),
	('과일',2),('채소',2),('과자',2),('쌀/잡곡',2),
	('TV',3),('냉장고',3),('에어컨',3),
	('수영',4),('골프',4),('자전거',4),
	('사무용품',5),('미술용품',5);
select * from sub_category;
select * from member;
/*주소록
abc : 집 , 서울시 강남, 12345
	 회사 , 서울시 강북, 23456
hi  : 집 , 경기도 안산, 45678
	 회사 , 서울시 강북, 23456
qwe : 집 , 충북 청주, 32145
	 회사 , 서울시 강남, 12345
*/
insert into address_book(ab_name,ab_address,ab_post_num,ab_me_id)
	values('집','서울시 강남','12345','abc'),('회사','서울시 강북','23456','abc'),
    ('집','경기도 안산','45678','hi'),('회사','서울시 강북','23456','hi'),
    ('집','충북 청주','32145','qwe'),('회사','서울시 강남','12345','qwe');
select * from address_book;
/*제품
- 의류 - 여성, 반집업 맨투맨, 세컨그라운드 여성용 반집업 맨투맨, now(),10,17000
- 의류 - 여성, 세미 크롭 맨투맨, 바블링브룩 여성용 세미 크롭 맨투맨, now(),10,19900
- 의류 - 남성, 긴팔 카라티, 빅사이즈클럽 긴팔 카라티,now(),20,24900
- 의류 - 남성, 7부 브이넥 티셔츠,헤리슨 남성용 브이넥 7부 브이넥 티셔츠,now(),20,24900
- 의류 - 남녀공용, 기모 조거팬츠, 우드파카 기모 조거팬츠, now(),5,24800
- 의류 - 남녀공용, 슬롭 스키니, 블랙 기모 슬림 스키니, now(),100,51840
*/
insert into product(pr_title,pr_contents,pr_amount,pr_price,pr_sc_num)
	values('반집업 맨투맨','세컨그라운드 여성용 반집업 맨투맨',10,17000,1),
    ('세미 크롭 맨투맨','바블링브룩 여성용 세미 크롭 맨투맨',10,19900,1),
    ('긴팔 카라티','빅사이즈클럽 긴팔 카라티',20,24900,2),
    ('7부 브이넥 티셔츠','헤리슨 남성용 브이넥 7부 브이넥 티셔츠',20,24900,2),
    ('기모 조거팬츠','우드파카 기모 조거팬츠',5,24800,4),
    ('슬롭 스키니','블랙 기모 슬림 스키니',100,51840,4);
select * from product;
/* 옵션 개수 5개 고정
- 1의류 - 여성, 반집업 맨투맨, 세컨그라운드 여성용 반집업 맨투맨, now(),10,17000
	- 빨강,노랑,흰색
- 2의류 - 여성, 세미 크롭 맨투맨, 바블링브룩 여성용 세미 크롭 맨투맨, now(),10,19900
	- S,M,L
- 3의류 - 남성, 긴팔 카라티, 빅사이즈클럽 긴팔 카라티,now(),20,24900
	- 흰색 S, 흰색M,흰색L, 남색 S, 남색 M, 남색 L
- 4의류 - 남성, 7부 브이넥 티셔츠,헤리슨 남성용 브이넥 7부 브이넥 티셔츠,now(),20,24900
	- XS,S,M,L,XL
- 5의류 - 남녀공용, 기모 조거팬츠, 우드파카 기모 조거팬츠, now(),5,24800
	- 24인치,26인치,28인치,30인치,32인치
- 6의류 - 남녀공용, 슬롭 스키니, 블랙 기모 슬림 스키니, now(),100,51840
	- 60cm,64cm,68cm,72cm
*/
insert into product_option(po_title,po_amount,po_pr_num)
	values
    ('빨강',5,1),('노랑',5,1),('흰색',5,1),
    ('S',5,2),('M',5,2),('L',5,2),
    ('흰색S',5,3),('흰색M',5,3),('흰색L',5,3),('남색S',5,3),('남색M',5,3),('남색L',5,3),
    ('XS',5,4),('S',5,4),('M',5,4),('L',5,4),('XL',5,4),
    ('24인치',5,5),('26인치',5,5),('28인치',5,5),('32인치',5,5),
    ('60cm',5,6),('64cm',5,6),('68cm',5,6),('72cm',5,6);
select * from product_option;