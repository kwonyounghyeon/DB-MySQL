/*
DML
- insert : 데이터 추가
- update : 데이터 수정
- delete : 데이터 삭제
- select : 데이터 조회

select * from xxx;
select all * from xxx; all은 중복 상관없이 보여주겠다는 의미 / 
select x; ->select문의 최소단위 속성,식,함수가 올 수 있음(ex : select now())

insert
-문법
isert into 테이블명(속성1,속성2, ...,속성n)
	values(값1,값2,...,값n);
insert into 테이블명 vlaues(값1,값2,...,값n);
- 이때 값의 개수는 전체 테이블 속성 개수와 같고, 순서가 맞아야 한다.
isert into 테이블명(속성1,속성2, ...,속성n)
	select 값1,값2,...,값m, 속성1,속성2,속성n-m
		from 테이블명 [where 절]
 - 추가하려는 값이 검색을 통해 넣어야 하는 경우 사용
 Ex>
	-- 식품, 음료수, 콜라, 100개, 1000원
	insert into product(pr_title,pr_contents,pr_amount,pr_price,pr_pc_num)
		select '음료수','콜라',100,1000,pc_num from product_category
		where pc_name = '식품';
	select* from product;
	select '음료수' from product;
    
update
 - 문법
 update 테이블명 set 속성1 = 값1, 속성2 = 값2, ..., 속성n = 값n where절
 
 delete
 -문법
 delete from 테이블명 where절
 
 select
 -문법
 select [distinct] 속성1, 속성2, ..., 속성n from 테이블
	where절
	order by절
	limit절
    
-where절
 between A and B
 in()
 all()
 any()
 서브쿼리
 
-order by절
 asc : 오름차순 , desc : 내림차순
 
-limit절


*/
