/*	union,union all : 합집합
	 - 속성 이름들이 같아야 함
    union : 중복을 제거 (차집합)
    union all : 중복을 제거하지 않음 . union보다 빠름(왜? 중복을 제거하지 않기 때문)
    */

-- 중복된 데이터 제거 출력
select * from product where pr_amount > 10
	union
select * from product where pr_price > 10000;

-- 중복된 데이터도 출력
select * from product where pr_amount > 10
	union all
select * from product where pr_price > 10000;

select pr_num as 번호,pr_title as 내용 from product
	union
select pc_num as 번호, pc_name as 내용 from product_category;




