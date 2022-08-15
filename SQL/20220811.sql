 /* memberId camel mark  */
 /*primary key : 주키 (열쇠)*/
 CREATE TABLE tblMember(
 	member_id CHAR(8) PRIMARY KEY,
 	/*primary key는 중복을 허용하지 않는다.*/
 	member_name CHAR(10) NOT NULL,
 	member_addr CHAR(20) NOT NULL
 	
);

insert tblmember values ('tess','나훈아','경기부천시');
INSERT tblmember VALUES ('iyou', '아이유', '인천 남구') ;
INSERT tblmember VALUES ('jyp', '박진영 ', '경기 고양시 ') ;

/* 모든 컬럼*/
SELECT*FROM tblmember;


INSERT tblproduct VALUES ('바나나',1500,'2022-08-01','델몬트',17);
INSERT tblProduct VALUES ('카스', 2500, '2022-03-01', 'OB', 3);
INSERT tblProduct VALUES ('삼각김밥', 1500, '2023-0-9-01', 'CJ', 22);

SELECT * FROM tblproduct;

/* 조건문:where */
SELECT member_id,member_addr,member_name FROM tblmember WHERE member_name='아이유';

/*order by:  정렬 : 기본값(Ascending 어센딩)=오름차순 / desc(descending 디센딩), 내림차순*/

SELECT product_name,cost FROM tblproduct ORDER BY cost DESC;

SELECT * FROM tblmember ORDER BY member_id;

/*update*/
UPDATE tblmember SET member_addr='서울시 강남구' WHERE member_name='아이유';
/*업데이트 시에는 실행시 확인 꼭 필요함*/

/*delete*/
DELETE FROM tblmember WHERE member_id='tess';
/*테이블 스키마(테이블 아키텍쳐)는 남지만  데이터만 날리는 것,
데이터를 날리면 백업하지 않는 이상 데이터복구는 할 수 없음, 신중할 것. */

/* 테이블 전체(데이터와 스키마까지)를 날리는 코드*/
DROP TABLE tblmember;

/* view(가상테이블) */

CREATE VIEW vProduct as SELECT product_name,make_date,cost FROM tblproduct;
SELECT * FROM vProduct;
/*보안적 이유로 테이블을 보여주기 힘들때 사용하는 코드
사실은 my sql의 워크벤치를 이용해서 보여주는것임. */

