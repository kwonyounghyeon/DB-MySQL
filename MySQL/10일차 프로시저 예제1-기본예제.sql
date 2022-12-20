/*
drop procedure if exists procedure_name; -- 이미 프로시저가 정의 되어 있다면 삭제
delimiter // -- //대신 다른 문자로 대체 가능
create procedure procedure_name
([
	[in|out] parameter_name
	{parameter_type| array of parameter_type},...
])
[ declare variable_declaration;...[;]]
begin
	procedure_body_statement;...[;]
end //
delimiter;
*/

DROP PROCEDURE IF EXISTS TEST1;
DELIMITER //
CREATE PROCEDURE TEST1()
BEGIN
	SHOW DATABASES;
END //
DELIMITER ;
CALL TEST1();

DROP PROCEDURE IF EXISTS TEST2;
DELIMITER //
CREATE PROCEDURE TEST2(
	IN NUM INT,
    OUT OUT_NUM INT
)
BEGIN
	SELECT NUM;
    SET OUT_NUM = NUM;
END //
DELIMITER ;
SET @T_NUM = 0;
CALL TEST2(2,@T_NUM);
SELECT @T_NUM;


