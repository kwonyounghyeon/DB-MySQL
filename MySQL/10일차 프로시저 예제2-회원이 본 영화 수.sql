USE CGV;
DROP PROCEDURE IF EXISTS MEMBER_MOVIE_POINT;
DELIMITER //
CREATE PROCEDURE MEMBER_MOVIE_POINT(
	IN _id VARCHAR(20)
    
)
BEGIN
	-- 지역 변수 선언은 위에 모아줘야 함 
	declare _movie_count int default 0;
	with ticketing_count(ss_mo_num,movie_ticketing_count)
		as
		(select ss_mo_num as 영화명 ,count(*) from ticketing
			join screen_schedule on ti_ss_num = ss_num
			where ti_me_id like _id
			group by ss_mo_num) -- 영화별 예매 횟수, 예매한 전체 영화 수가 아님
		select @num := count(*) from ticketing_count;
		set _movie_count = (select @num);
        UPDATE MEMBER SET ME_MOVIE_COUNT = _MOVIE_COUNT WHERE ME_ID = _ID;
END //
DELIMITER ;
call MEMBER_MOVIE_POINT('abc');
