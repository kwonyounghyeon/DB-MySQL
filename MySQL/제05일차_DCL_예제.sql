-- test 계정 추가. 비번 설정 없음
create user test;

-- test1 계정 추가 비번이 1234
create user test1 identified by '1234';

-- grant => 데이터 베이스 권한을 부여하여 제어함 /  *.* : 앞에* database 이름 / 권한 부여할 아이디 test1@'%';
-- test1 계정에 small_jik DB에 있는 모든 테이블의 select 권한을 부여
-- '%' : 외부에서 접근 허용, 'localhost' : 내부에서 접근 허용
grant select on small_jik.* to test1@'%';
-- test1 계정에 small_jik DB에 있는 모든 테이블의 모든 권한을 부여
grant all privileges on small_jik.* to test1@'%';

-- 권한 회수
revoke all on small_jik.* from test1;

flush privileges;

-- 계정 삭제
drop user test;