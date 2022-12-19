-- 아바타-물의 길에 출연한 감독 및 배우들을 조회하는 쿼리

select * from movie_person;
select * from trailer;
select * from movie_casting;

select mo_name as 영화명,mp_name as 출연진,mc_role as 역할 from movie_person
	join movie_casting on mc_mp_num = mp_num
    join movie on mc_mo_num =mo_num
    where mo_name like '아바타-물의 길';
    
-- 제임스 카메론의 참여 영화 리스트를 조회하는 쿼리
select mo_name as 영화명,mp_name as 출연진,mc_role as 역할 from movie_person
 	join movie_casting on mc_mp_num = mp_num
	join movie on mc_mo_num =mo_num
    where mp_name like '제임스 카메론';

-- 아바타 누적 관객 수를 조회하는 쿼리
select sum(ti_amount) as '아바타 누적 관객 수'  from ticketing
	join screen_schedule on ti_ss_num = ss_num
    join movie on ss_mo_num = mo_num
    where mo_name like '아바타-물의 길' and ss_date<=now();

-- 누적 관객 수가 1명 이상인 영화를 조회하는 쿼리
select mo_name as 영화명 ,sum(ti_amount) as 누적관객수 from ticketing
	join screen_schedule on ti_ss_num = ss_num
    join movie on ss_mo_num = mo_num
    where ss_date<=now()
    group by mo_num
    having 누적관객수>=1;

select * from cinema;
-- abc회원이 예매한 올빼미 상영 좌석을 조회(관 이름, 좌석번호 조회)
select se_name as 'abc회원이 예매한 영화 올빼미 좌석',ci_name as 관이름 from ticketing
	join screen_schedule on ss_num = ti_ss_num
    join movie on mo_num = ss_mo_num
    join ticketing_seat on ts_ti_num = ti_num
    join seat on se_num =ts_se_num
    join cinema on ss_ci_num = ci_num
    join theater on ci_th_num = th_num
    where mo_name like '올빼미' and ti_me_id like 'abc';
    
-- 올빼미 12월 20일 상영시간 13:50 예매 가능한 좌석을 조회
select * from cinema;
select * from screen_schedule
	join movie on ss_mo_num = mo_num
    left join ticketing on ti_ss_num = ss_num
    join ticketing_seat on ts_ti_num = ts_num
    join seat on se_num = ts_se_num
    where mo_name like '올빼미'and (ss_date = '2022-12-20' and ss_time = '13:50') ;
select * from seat;

select mo_name as 영화제목 ,se_name as 좌석명,
	case 
		when ts_num is null
        then 'O'
		else 'X'
	end as '사용가능'
from 
(select * from screen_schedule where ss_date = '2022-12-20' and ss_time = '13:50') as ss
	join(select * from movie where mo_name like '올빼미')as mo
		on ss_mo_num = mo_num
	join cinema 
		on ss_ci_num = ci_num
	join seat
		on se_ci_num = ci_num
	left join ticketing
		on ti_ss_num = ss_num
	left join ticketing_seat
		on ts_se_num = se_num;

-- 반정규화
/* join을 줄일 수 있는 방법 
- 서브 쿼리를 이용하여 줄임
- 외부 조인을 활용하여 줄임
-- screen_schedule에 영화 제목 속성을 추가하면 movie 테이블과 join을 하지 않아도 됨. 단, 데이터는 중복
-- abc회원이 예매한 올빼미 상영 좌석을 조회(관 이름, 좌석번호 조회)에서
-- ticketing_seat에 좌석 이름을 추가하면 좌석명을 알기 위해 seat 테이블과 join하지 않아도 됨.*/

-- 영화별 누적 관객 수를 조회
select mo_name as 영화제목, sum(ti_amount) as '누적 관객 수' from ticketing
	right join (select * from screen_schedule where ss_date <=now()) as ss
		on ti_ss_num = ss_num
    right join movie on ss_mo_num = mo_num
    group by mo_num;
    
select mo_name as 영화제목, ifnull(sum(ti_amount),0) as '누적 관객 수'  from movie -- 강사님
	left join (select * from screen_schedule where ss_date <=now()) as ss
		on ss_mo_num = mo_num
    left join ticketing on ti_ss_num = ss_num
    group by mo_num;
    
-- 영화 순위(누적별 관객 수)를 조회
select mo_name as 영화제목, ifnull(sum(ti_amount),0) as '누적 관객 수' from movie
	left join (select * from screen_schedule where ss_date<=now()) as ss
		on mo_num = ss_mo_num
    left join ticketing on ti_ss_num  = ss_num
    group by mo_num
    order by '누적 관객 수' desc;
    -- having `누적 관객 수` >=1; having절을 사용하여 공백이 있는 문자열을 표현 하기위해선 `` 사용

-- 날짜가 지났을 때 변경되어야 할 쿼리를 작성
-- tikceting,tikecting_seat,screen_schedule,movie,member
-- 회원이 본 영화 수를 체크 
select*from member
	join ticketing on ti_me_id = me_id
    join (select * from screen_schedule where ss_date<=now()) as ss
    on ti_ss_num = ss_num;
        
-- abc 회원이 본 영화 목록 개수
select count(distinct ss_mo_num) as '영화 목록 개수' from ticketing as ti
	join screen_schedule on ss_num = ti_ss_num
    where ss_date <=now();