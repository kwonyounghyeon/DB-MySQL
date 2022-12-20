-- 영화 아바타-물의 길 상영 시간을 조회하는 쿼리를 작성하세요.(정렬은 영화관 순으로)

select mo_name as '영화명',ss_date as '상영 날짜',ss_time as '상영 시간',ci_name as '상영관',ss_possible_seat as 예매가능좌석수 
	from screen_schedule 
    join movie on mo_num = ss_mo_num
    join cinema on ss_ci_num = ci_num
    where mo_name like'아바타-물의 길'and mo_state = '상영중'
    and ss_date >=now()
    order by ss_ci_num asc;
-- 강남CGV 1관에서 18일 9:50에 상영하는 아바타-물의길의 예매 가능 좌석들을 조회

select se_name as 좌석명,
case
	when ts_num is null
    then 'O'
    else 'X'
end as 가능
from screen_schedule
	join movie on mo_num = ss_mo_num 
	join cinema on ss_ci_num = ci_num
	join seat on  ci_num = se_ci_num
	left join ticketing_seat on ts_se_num = se_num
	where mo_name like '아바타-물의 길'
		and (ss_date ='2022-12-18' and ss_time = '09:50:00')
		and se_state ='사용가능';

-- 아바타 물의길을 상영하는 극장 정보를 조회
Set sql_mode = (SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY','')); 
select th_name from screen_schedule
	join movie on ss_mo_num = mo_num
    join cinema on ci_num = ss_ci_num
    join theater on th_num = ci_th_num
    where mo_name like '아바타-물의 길' and ss_date >=now()
    group by th_name;
    
-- CGV 강남에서 상영하는 영화를 조회
select th_name as 극장, mo_name as 영화 from screen_schedule
	join movie on ss_mo_num = mo_num
    join cinema on ci_num = ss_ci_num
    join theater on th_num = ci_th_num
    where th_name like 'CGV 강남' and ss_date>=now()
    group by ss_mo_num;


select*from movie;
select*from theater;
select*from cinema;
select*from seat;
select*from ticketing_seat;
