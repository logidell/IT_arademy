/* memberId */
/*PRIMARY KEY : 주키(열쇠)*/
CREATE TABLE tblMember(
 member_id CHAR(8) PRIMARY KEY,
 member_name CHAR(10) NOT NULL,
 member_addr CHAR(20) NOT NULL 
);

INSERT tblmember VALUES ('tess','나훈아','경기 부천시');
INSERT tblmember VALUES ('iyou', '아이유', '인천 남구') ;
INSERT tblmember VALUES ('jyp', '박진영 ', '경기 고양시 ') ;
/* *:모든 컬럼 */
SELECT * FROM tblmember;

INSERT tblProduct
VALUES ('바나나',1500,'2022-08-01','델몬트', 17);
INSERT tblProduct 
VALUES ('카스', 2500, '2022-03-01', 'OB', 3);
INSERT tblProduct 
VALUES ('삼각김밥', 1500, '2023-09-01', 'CJ', 22);

SELECT * FROM tblproduct;

/*where  : 조건*/
SELECT member_id, member_addr, member_name
FROM tblmember
WHERE member_name = '아이유';

/* ORDER BY : 정렬*/
SELECT product_name, cost 
FROM tblProduct
ORDER BY cost DESC;

SELECT * 
FROM tblmember
ORDER BY member_id DESC;

/* update */
UPDATE tblmember
SET member_addr = '서울시 강남구'
WHERE member_name = '아이유';

/* delete */
DELETE FROM tblmember 
WHERE member_id = 'tess';

/* drop */
DROP TABLE tblmember;

/* view : 가상의테이블 */
CREATE VIEW vProduct
as
SELECT product_name, make_date, cost
FROM tblproduct;

SELECT * FROM vProduct;







