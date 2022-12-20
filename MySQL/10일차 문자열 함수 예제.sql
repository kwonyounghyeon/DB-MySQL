-- 제품명에 TV가 들어가는 제품들을 조회
select * from product where pr_title like '%TV%';
select * from product where pr_title like concat('%','TV','%');

set @a = 'TV';
select @a;
select * from product where pr_title like '%@a%'; -- 출력값 x
select * from product where pr_title like concat('%',@a,'%'); -- 출력값 o

select format(1000000,0); -- 금액 표현을 위해 많이 사용
-- 파일명이 주어졌을 때 확장자를 추출하는 예제
select right('test.txt',3); -- 파일 확장자 추출할 경우 사용

-- adddate
select adddate(now(),interval 1 day); -- 1일
select adddate(now(),interval 1 week); -- 1주
select adddate(now(),interval 1 month); -- 1달
select adddate(now(),interval 1 year); -- 1년
-- subdate
select subdate(now(), interval 1 year);

