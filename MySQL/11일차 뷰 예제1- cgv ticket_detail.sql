USE CGV;
-- 예매한 영화이름, 영화관, 좌석이름, 아이디, 상영일, 상영시간을 조회
create view ticket_detail1
as
SELECT mo_name,ss_date,ss_time,ci_name,se_name,ti_me_id FROM ticketing
	join ticketing_seat on ti_num = ts_ti_num
    join seat on se_num = ts_se_num
    join screen_schedule on ss_num = ti_ss_num
    join movie on mo_num = ss_mo_num
    join cinema on ci_num = ss_ci_num;
select * from ticket_detail1;

create view ticket_detail2
as
SELECT * FROM ticketing
	join ticketing_seat on ti_num = ts_ti_num
    join seat on se_num = ts_se_num
    join screen_schedule on ss_num = ti_ss_num
    join movie on mo_num = ss_mo_num
    join cinema on ci_num = ss_ci_num;
select * from ticket_detail2;

-- abc 회원이 영화 예매를 위해 사용한 금액은 ?

create view ticket_detail3
as
SELECT sum(ti_total_price) FROM ticketing
	join ticketing_seat on ti_num = ts_ti_num
    join seat on se_num = ts_se_num
    join screen_schedule on ss_num = ti_ss_num
    join movie on mo_num = ss_mo_num
    join cinema on ci_num = ss_ci_num
    where ti_me_id like 'abc';
select * from ticket_detail3;
