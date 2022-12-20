insert into movie(mo_name,mo_contents,mo_age,mo_showtime,mo_openning_date,mo_state)
	values('올빼미','맹인이지만 뛰어난 침술 실력을 지닌 ‘경수’는 
어의 ‘이형익’에게 그 재주를 인정받아 궁으로 들어간다.
그 무렵, 청에 인질로 끌려갔던 ‘소현세자’가 8년 만에 귀국하고,
‘인조’는 아들을 향한 반가움도 잠시 정체 모를 불안감에 휩싸인다.
그러던 어느 밤, 어둠 속에서는 희미하게 볼 수 있는 ‘경수’가
‘소현세자’의 죽음을 목격하게 되고
진실을 알리려는 찰나 더 큰 비밀과 음모가 드러나며
목숨마저 위태로운 상황에 빠진다.
아들의 죽음 후 ‘인조’의 불안감은 광기로 변하여 폭주하기 시작하고
세자의 죽음을 목격한 ‘경수’로 인해 관련된 인물들의 민낯이 서서히 드러나게 되는데...','15세 이상',118,'2022-11-23','상영중');

insert into movie_person(mp_name,mp_birth,mp_country) values
('안태진',NULL,'한국'),('류준열','1986-09-25','한국'),('유해진','1970-01-04','한국'),
('최무성','1968-01-12','한국'),('조성하','1966-08-08','한국'),('박명훈','1975-05-28','한국'),
('김성철','1991-12-31','한국'),('안은진','1991-05-06','한국'),('조윤서','1993-01-04','한국');

insert into movie_genre(mg_ge_name,mg_mo_num)
	values('스릴러',2);
    
insert into movie_casting(mc_mp_num,mc_mo_num,mc_role)
	values(9,2,'감독'),(10,2,'배우'),(11,2,'배우'),(12,2,'배우'),(13,2,'배우'),
		(14,2,'배우'),(15,2,'배우'),(16,2,'배우'),(17,2,'배우');
        
insert into trailer(tr_name,tr_file_name,tr_mo_num)
	values
    ('박스오피스 1위 리뷰 예고편','https://img.cgv.co.kr/Movie/Thumbnail/Trailer/86481/86481210223_1024.jpg',2);
        
insert into steelcut(st_file_name,st_mo_num)
	values
    ('https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000086/86481/86481210724_727.jpg',2);

insert into screen_schedule(ss_date,ss_time,ss_total_seat,ss_possible_seat,ss_mo_num,ss_ci_num)
	values
    ('2022-12-20','13:50:00',10,10,2,2),('2022-12-20','11:00:00',10,10,2,6),('2022-12-20','17:10:00',10,10,2,6);

-- abc 회원이 올빼미 12월 20일 13:50을 3장 예매 A1,B1,C1
-- 예매 등록
insert into ticketing(ti_amount,ti_me_id,ti_ss_num,ti_total_price)
	values(3,'abc',25,30000);
-- 예매 좌석을 등록
insert into ticketing_seat(ts_ti_num,ts_se_num)
	values(3,11),(3,13),(3,15);
-- insert into ticketing_seat(ts_ti_num,ts_se_num)
-- 	select 3,se_num from seat where se_name = 'A1' and se_ci_num =1;
-- insert into ticketing_seat(ts_ti_num,ts_se_num)
-- 	select 3,se_num from seat where se_name = 'B1' and se_ci_num =1;
-- insert into ticketing_seat(ts_ti_num,ts_se_num)
-- 	select 3,se_num from seat where se_name = 'C1' and se_ci_num =1;
-- 에매 가능 좌석을 수정
update screen_schedule
	set ss_possible_seat = ss_possible_seat-3
    where ss_num = 25;
    
update member
	set 
		me_movie_count = 
        (select count(distinct ss_mo_num) as '영화 목록 개수' from ticketing
	join screen_schedule on ss_num = ti_ss_num
    where ss_date <=now())
    where 
		me_id = 'abc';
        
-- abc 회원이 예매한 올빼미 12월 20일 13:50 예매를 취소할 때 실행해야 하는 쿼리를 작성
select * from screen_schedule
	where ss_mo_num = 2 and ss_date = '2022-12-20' and ss_time = '13:50';

select * from ticketing;
select * from ticketing_seat;
select * from ticketing 
	where ti_ss_num = 
    (select ss_num from screen_schedule 
		where ss_mo_num = 2 and ss_date = '2022-12-20' 
			and ss_time = '13:50');
    
delete from ticketing_seat
	where ts_ti_num = 
		(select ti_num from ticketing where ti_ss_num = 
			(select ss_num from screen_schedule 
				where ss_mo_num = 2 and ss_date = '2022-12-20'
					and ss_time = '13:50'
			)
            and ti_me_id = 'abc'
		);

delete from ticketing
	where ti_ss_num =
    (select ss_num from screen_schedule
		where ss_mo_num =2 and ss_date = '2022-12-20' and ss_time = '13:50')
	and ti_me_id = 'abc';

update screen_schedule
	set ss_possible_seat = ss_possible_seat+3
    where ss_num =25;
	
select * from screen_schedule;
