-- 장르 등록
insert into genre(ge_name)values
	('드라마'),('판타지'),('서부'),('공포'),('멜로/로맨스'),('어드벤처'),('스릴러'),('느와르'),
	('컬트'),('다큐맨터리'),('코미디'),('가족'),('미스터리'),('전쟁'),('애니메이션'),('범죄'),('뮤지컬'),
    ('SF'),('액션'),('무협'),('에로'),('서스펜스'),('서사'),('블랙코미디'),('실험');
-- 출연진 등록
insert into movie_person(mp_name,mp_birth,mp_country) values
	('제임스 카메론','1954-08-16','캐나다'),
    ('조 샐다나','1978-06-19','미국'),
    ('샘 워싱턴','1976-08-02','영국'),
    ('시고니 위버','1949-10-08','미국'),
    ('우나 채플린','1986-06-04',''),
    ('지오바니 리비시','1974-12-17','미국'),
    ('스티븐 랭','1952-07-11','미국'),
    ('케이트 윈슬렛','1975-10-05','영국');

select*from movie_person;
-- 영화를 등록(movie)
insert into movie (mo_name,mo_contents,mo_age,mo_showtime,mo_openning_date,mo_state)values
	  ('아바타-물의 길',
	 '<아바타: 물의 길>은 판도라 행성에서 
	\n제이크 설리와 네이티리가 이룬 가족이 겪게 되는 무자비한 위협과 
	\n살아남기 위해 떠나야 하는 긴 여정과 전투, 
	\n그리고 견뎌내야 할 상처에 대한 이야기를 그렸다. 월드 와이드 역대 흥행 순위 1위를 기록한 전편 <아바타>에 이어
	\n제임스 카메론 감독이 13년만에 선보이는 영화로, 
	\n샘 워싱턴, 조 샐다나, 시고니 위버, 스티븐 랭, 케이트 윈슬렛이 출연하고
	\n존 랜도가 프로듀싱을 맡았다.', '12세 이상', '192', '2022-12-14', '상영중');
-- 영화 장르 등록
insert into movie_genre(mg_ge_name,mg_mo_num)values
	('액션',1),('어드벤처',1),('SF',1),('스릴러',1);

select*from movie_casting;
-- 영화 참여
insert into movie_casting(mc_mp_num,mc_mo_num,mc_role)values
	(1,1,'감독'),(2,1,'배우'),(3,1,'배우'),(4,1,'배우'),
	(5,1,'배우'),(6,1,'배우'),(7,1,'배우'),(8,1,'배우');

-- 트레일러 등록
insert into trailer(tr_name,tr_mo_num,tr_file_name)values
	('[아바타-물의 길]환상적인 판도라의 세계 영상',1,'http://h.vod.cgv.co.kr:80/vodCGVa/86072/86072_210699_1200_128_960_540.mp4');

insert into steelcut(st_mo_num,st_file_name)values
	(1,'https://img.cgv.co.kr/Movie/Thumbnail/StillCut/000086/86072/86072210613_727.jpg');

-- 극장 등록
insert into region(re_name)values
	('서울'),('경기'),('인천'),('강원'),('대전/충청'),('대구'),('부산/울산'),('경상'),('광주/전라/제주');
 
 insert into 
 theater(th_name,th_lot_address,th_address,th_trans_info,th_parking_info,
 th_number,th_total_cinema,th_total_seat,th_re_name)
values('CGV 강남','서울특별시 강남구 역삼동 814-6 스타플렉스','서울특별시 강남구 강남대로 438 (역삼동)',
'# 지하철
/n2호선 | 강남역 11번 출구
/n9호선 | 신논현역 5번출구
/n
/n# 버스
/n- 분당지역
/n  좌석버스: 1005-1, 1005-2, 6800, 5500-2
/n   간선버스: 408, 462
/n   광역버스: 9404, 9408
/n- 강북지역
/n   간선버스: 140, 144, 145, 471
/n- 강서지역
/n   좌석버스: 1500
/n   간선버스: 360
/n- 강동지역
/n   간선버스: 402, 420, 470, 407
/n- 인근경기지역
/n  좌석버스: 3030, 2002, 2002-1
/n  광역버스: 9409, 9500, 9501, 9503, 9700, 9711',
'/n# 주차정보
 /n- 위치: 건물 지하2F ~ 지하4F
 /n
 /n # 주차요금
/n- CGV 영화 관람 시 주차 3시간 6,000원
/n- 주차시간 (3시간) 초과 시 10분 당 1,000원
/n※ 발렛서비스 운영시간 : 오전 8시 이후 ~ 오후 20시
/n
/n※ 발렛 무료 서비스는 영화 관람 고객 한 함.  (영화 미관람 시 건물 주차장에서 별도 정산)
/n※ 20시 이후 입차 차량은 발렛서비스 이용이 제한될 수 있으며, 별도 운영되는 주차팀의 사정에 따라 변경될 수 있습니다.
/n
# 이용안내
/n- 주차공간이 협소하여 평일 오후/주말은 주차가 어렵습니다.
/n- 편리한 대중교통 이용을 이용하여 주시기 바랍니다.','1544-1122',6,60,'서울');

-- 강남CGV 영화관 등록 1관~6관
insert into cinema(ci_name,ci_seat_count,ci_type,ci_th_num)
values('1관 6층',10,'2D',1),('2관 6층(LASER)',10,'2D',1),('3관 8층',10,'3D',1),
('4관[SCREENX] 8층',10,'SCREENX 2D',1),('5관 10층',10,'2D',1),('6관 10층(LASER)',10,'2D',1);

select*from cinema;
/*
1관 좌석 배치
A1	A2	A3	A4
B1	B2	B3	B4
C1	C2
2관 좌석 배치
A1	A2
B1	B2
C1	C2
D1	D2
E1	E2
3관 좌석 배치
A1	A2	A3	A4	A5
B1	B2	B3	B4	B5
4관 좌석 배치
A1	A2	A3
B1	B2	B3
C1	C2	C3	C4
5관 좌석 배치
A1	A2	A3	A4
B1	B2	B3	B4
C1	C2
6관 좌석 배치
A1	A2
B1	B2
C1	C2
D1	D2
E1	E2
*/
insert into seat(se_name,se_state,se_price,se_ci_num)values
('A1','사용가능',10000,1),('A2','사용가능',10000,1),('A3','사용가능',10000,1),('A4','사용가능',10000,1),
('B1','사용가능',10000,1),('B2','사용가능',10000,1),('B3','사용가능',10000,1),('B4','사용가능',10000,1),
('C1','사용가능',10000,1),('C2','사용가능',10000,1),
('A1','사용가능',10000,2),('A2','사용가능',10000,2),('B1','사용가능',10000,2),('B2','사용가능',10000,2),
('C1','사용가능',10000,2),('C2','사용가능',10000,2),('D1','사용가능',10000,2),('D2','사용가능',10000,2),
('E1','사용가능',10000,2),('E2','사용가능',10000,2),
('A1','사용가능',10000,3),('A2','사용가능',10000,3),('A3','사용가능',10000,3),('A4','사용가능',10000,3),
('A5','사용가능',10000,3),('B1','사용가능',10000,3),('B2','사용가능',10000,3),('B3','사용가능',10000,3),
('B4','사용가능',10000,3),('B5','사용가능',10000,3),
('A1','사용가능',10000,4),('A2','사용가능',10000,4),('A3','사용가능',10000,4),('B1','사용가능',10000,4),
('B2','사용가능',10000,4),('B3','사용가능',10000,4),('C1','사용가능',10000,4),('C2','사용가능',10000,4),
('C3','사용가능',10000,4),('C4','사용가능',10000,4),
('A1','사용가능',10000,5),('A2','사용가능',10000,5),('A3','사용가능',10000,5),('A4','사용가능',10000,5),
('B1','사용가능',10000,5),('B2','사용가능',10000,5),('B3','사용가능',10000,5),('B4','사용가능',10000,5),
('C1','사용가능',10000,5),('C2','사용가능',10000,5),
('A1','사용가능',10000,6),('A2','사용가능',10000,6),('A3','사용가능',10000,6),('A4','사용가능',10000,6),
('B1','사용가능',10000,6),('B2','사용가능',10000,6),('B3','사용가능',10000,6),('B4','사용가능',10000,6),
('C1','사용가능',10000,6),('C2','사용가능',10000,6);

-- 상영시간 등록
select*from screen_schedule;
insert into screen_schedule(ss_mo_num,ss_ci_num,ss_date,ss_time,ss_total_seat,ss_possible_seat)
values
(1,4,'2022-12-18','10:30:00',10,10),(1,4,'2022-12-18','14:10:00',10,10),
(1,4,'2022-12-18','17:50:00',10,10),(1,4,'2022-12-18','21:30:00',10,10),
(1,1,'2022-12-18','09:50:00',10,10),(1,1,'2022-12-18','13:30:00',10,10),
(1,1,'2022-12-18','17:10:00',10,10),(1,1,'2022-12-18','20:50:00',10,10),
(1,2,'2022-12-18','17:00:00',10,10),(1,2,'2022-12-18','22:40:00',10,10),
(1,3,'2022-12-18','09:10:00',10,10),(1,3,'2022-12-18','12:50:00',10,10),
(1,3,'2022-12-18','16:30:00',10,10),(1,3,'2022-12-18','20:10:00',10,10),
(1,3,'2022-12-18','23:50:00',10,10),
(1,5,'2022-12-18','08:30:00',10,10),(1,5,'2022-12-18','12:10:00',10,10),
(1,5,'2022-12-18','15:50:00',10,10),(1,5,'2022-12-18','19:30:00',10,10),
(1,5,'2022-12-18','23:10:00',10,10),
(1,6,'2022-12-18','11:10:00',10,10),(1,6,'2022-12-18','14:50:00',10,10),
(1,6,'2022-12-18','18:30:00',10,10),(1,6,'2022-12-18','22:10:00',10,10);

-- 회원 가입
insert into member(me_id,me_pw,me_movie_count) values('abc','abc',0);

-- abc 회원이 2022-12-18 09:50에 상영하는 아바타를 A1,A2 두자리를 예매했다. 이때 필요한 작업을 쿼리로 작성
-- 단, 작업의 편의를 위해, 18일 9:50에 상영하는 아바타라는 정보 대신 상영번호가 5번인걸 활용

-- 예매
insert into ticketing(ti_amount,ti_me_id,ti_ss_num,ti_total_price) 
values(2,'abc',5,10000*2);

-- 좌석 예매
insert into ticketing_seat(ts_ti_num,ts_se_num)
	select 1,se_num from seat where se_name = 'A1' and se_ci_num =1;
insert into ticketing_seat(ts_ti_num,ts_se_num)
    select 1,se_num from seat where se_name = 'A2' and se_ci_num =1;
-- values (1,1),(1,2);
-- 상영정보에 예매 가능 좌석 수정

update screen_schedule
	set
    ss_possible_seat = ss_possible_seat-2
    where ss_num = 5;

select * from ticketing;
select * from seat;
select * from ticketing_seat;
select * from screen_schedule;

