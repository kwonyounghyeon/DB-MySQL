insert into ticketing(ti_amount,ti_me_id,ti_ss_num,ti_total_price)
	values(3,'abc',25,30000);
    
SELECT SE_PRICE FROM screen_schedule
	JOIN CINEMA ON SS_CI_NUM = CI_NUM
    JOIN SEAT ON SE_CI_NUM = CI_NUM
    WHERE SS_NUM = 25 AND SE_NAME = 'A1';