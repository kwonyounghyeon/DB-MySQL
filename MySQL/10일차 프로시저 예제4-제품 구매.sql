use shoppingmall2;

-- 제품번호, 수량, 배송지, 우편주소, 아이디가 주어지면 제품을 구매하는 프로시저를 작성하세요.

-- insert into buy(bu_num,bu_state,bu_amount,bu_address,bu_postcode,bu_me_id,bu_pr_num)
-- 	values(1,'결제 완료',1,'서울시 강남','12345','abc',1);
-- update product
-- 	set
-- 		pr_amount = pr_amount-1
-- 	where pr_num =1;

DROP PROCEDURE IF EXISTS PRODUCT_BUY;
DELIMITER //
CREATE PROCEDURE PRODUCT_BUY(
    IN _NUM INT,
    IN _AMOUNT INT,
    IN _ADDRESS VARCHAR(50),
    IN _POSTCODE VARCHAR(5),
    IN _id VARCHAR(15)
)
BEGIN
	DECLARE _PR_AMOUNT INT DEFAULT 0;
    SET _PR_AMOUNT = (SELECT PR_AMOUNT FROM PRODUCT WHERE PR_NUM = _NUM);
	IF _PR_AMOUNT >= _AMOUNT THEN
		INSERT INTO BUY(BU_NUM,BU_AMOUNT,BU_ADDRESS,BU_POSTCODE,BU_ME_ID,BU_PR_NUM)
			VALUES(CONCAT(_ID,RIGHT(NOW(),10)),_AMOUNT,_ADDRESS,_POSTCODE,_ID,_NUM);
	
		update product	set	pr_amount = pr_amount-_AMOUNT	where pr_num =_NUM;
    END IF;
END //
DELIMITER ;
CALL PRODUCT_BUY(1,4,'서울시 강남','12345','asd');
