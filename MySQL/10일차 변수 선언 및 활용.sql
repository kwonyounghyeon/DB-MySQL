/*  @ : 
	@@ : 전역 변수
*/
set @num =10; -- num에 10을 저장
select @num :=20; -- num에 20을 저장한 후, 출력
select @num;
select @@sql_mode; -- 시스템변수(글로벌 변수) sql_mode를 조회

show variables; -- 시스템 변수들 조회 (시스템에서 사용하고 있는 전역변수의 개수들)

-- 실수 1.23을 정수 1로 변환 하는 예제
select cast(1.23 as unsigned integer);
select convert(1.23 , unsigned integer);



