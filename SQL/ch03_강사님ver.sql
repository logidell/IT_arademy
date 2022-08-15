/* 3장-1 : select ~ from ~ where */
/* PRIMARY KEY : unique, not null */

CREATE TABLE MEMBER(
 mem_id CHAR(8) PRIMARY KEY,
 mem_name VARCHAR(10) NOT NULL,
 mem_number INT NOT NULL,
 addr CHAR(2) NOT NULL,
 phone1 CHAR(3),
 phone2 CHAR(8),
 height SMALLINT,
 debut_date DATE	
);

INSERT INTO member VALUES('TWC', '트와이스', 9, '서울', '02', '11111111', 167, '2015.10.19');
INSERT INTO member VALUES('BLK', '블랙핑크', 4, '경남', '055', '22222222', 163, '2016.08.08');
INSERT INTO member VALUES('WMN', '여자친구', 6, '경기', '031', '33333333', 166, '2015.01.15');
INSERT INTO member VALUES('OMY', '오마이걸', 7, '서울', NULL, NULL, 160, '2015.04.21');
INSERT INTO member VALUES('GRL', '소녀시대', 8, '서울', '02', '44444444', 168, '2007.08.02');
INSERT INTO member VALUES('ITZ', '잇지', 5, '경남', NULL, NULL, 167, '2019.02.12');
INSERT INTO member VALUES('RED', '레드벨벳', 4, '경북', '054', '55555555', 161, '2014.08.01');
INSERT INTO member VALUES('APN', '에이핑크', 6, '경기', '031', '77777777', 164, '2011.02.10');
INSERT INTO member VALUES('SPC', '우주소녀', 13, '서울', '02', '88888888', 162, '2016.02.25');
INSERT INTO member VALUES('MMU', '마마무', 4, '전남', '061', '99999999', 165, '2014.06.19');

SELECT COUNT(*) FROM member;

/* FOREIGN KEY(외래키) : 다른 테이블 참조 */
CREATE TABLE buy(
 num INT AUTO_INCREMENT PRIMARY KEY,
 mem_id CHAR(8) NOT NULL,
 prod_name CHAR(6) NOT NULL,
 group_name CHAR(4),
 price INT NOT NULL,
 amount smallint NOT NULL,
 FOREIGN KEY(mem_id) REFERENCES member(mem_id)
)


INSERT INTO buy VALUES(NULL, 'BLK', '지갑', NULL, 30, 2);
INSERT INTO buy VALUES(NULL, 'BLK', '맥북프로', '디지털', 1000, 1);
INSERT INTO buy VALUES(NULL, 'APN', '아이폰', '디지털', 200, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '아이폰', '디지털', 200, 5);
INSERT INTO buy VALUES(NULL, 'BLK', '청바지', '패션', 50, 3);
INSERT INTO buy VALUES(NULL, 'MMU', '에어팟', '디지털', 80, 10);
INSERT INTO buy VALUES(NULL, 'GRL', '혼공SQL', '서적', 15, 5);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 2);
INSERT INTO buy VALUES(NULL, 'APN', '청바지', '패션', 50, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 1);
INSERT INTO buy VALUES(NULL, 'APN', '혼공SQL', '서적', 15, 1);
INSERT INTO buy VALUES(NULL, 'MMU', '지갑', NULL, 30, 4);


SELECT * FROM buy;

INSERT INTO buy VALUES(NULL, 'MMU1', '지갑', NULL, 30, 4);


CREATE TABLE tbl부서(
	부서id CHAR(5) PRIMARY KEY,
	부서명 CHAR(10) NOT NULL
);

INSERT tbl부서 VALUES ('A01', '총무부');
INSERT tbl부서 VALUES ('B01', '영업부');
INSERT tbl부서 VALUES ('C01', 'IT부');

SELECT * FROM tbl부서;

CREATE TABLE tbl사원(
 사원id CHAR(5) PRIMARY KEY,
 사원명 CHAR(5) NOT NULL,
 부서id CHAR(5) NOT NULL,
 FOREIGN KEY (부서id) REFERENCES tbl부서(부서id)
 );

DROP TABLE tbl사원;

INSERT tbl사원 VALUES ('z001', '아이유', 'D01');

SELECT * FROM tbl사원;


/* select */

SELECT m.mem_id, m.mem_name
FROM member m; /* alias:별명 */

SELECT m.mem_name "이름", m.debut_date AS '데뷔날짜'
FROM member m

SELECT COUNT(*) "총레코드수" FROM member; 

SELECT *
FROM member
WHERE mem_name = '블랙핑크';

SELECT *
FROM member
/*WHERE mem_number = '4';*/
WHERE mem_number = 4;

SELECT * FROM member;

SELECT mem_name, height 
FROM member 
WHERE height >= 164; /* 이상 : >= ,초과 : > */

/* 멤버가 5명 이상인 걸그룹의 mem_id, mem_name, addr를 가져오시오*/
SELECT mem_id, mem_name, addr
FROM member
WHERE mem_number >= 5;

/* 멤버의 평균키가 167 미만의 걸그룹의 mem_id와 height를 가져오시오*/
SELECT mem_id, height
FROM member
WHERE height < 167
ORDER BY height;

/* 조건 : 단일 , 복수(or, and) */
SELECT mem_name, height , mem_number
FROM member
WHERE height >= 165 AND mem_number > 6;	

SELECT mem_name, height , mem_number
FROM member
WHERE height >= 165 OR mem_number > 6;											

/* height : 163~165 */
SELECT mem_name, height , mem_number
FROM member
WHERE height >=163 AND height <= 165;

SELECT mem_name, height , mem_number
FROM member
WHERE height BETWEEN 163 AND 165;

/* 주소 : 경기, 전남, 경남 */
SELECT mem_id, mem_name, addr
FROM member
WHERE addr = '경기' OR addr = '전남' OR addr = '경남'
ORDER BY addr;

SELECT mem_id, mem_name, addr
FROM member
WHERE addr IN ('경기', '전남', '경남')
ORDER BY addr;

SELECT mem_id, mem_name, addr
FROM member
WHERE addr != '경기' /* ! : 부정의 의미(not)*/
ORDER BY addr;

SELECT mem_id, mem_name, addr
FROM member
WHERE addr NOT IN ('경기', '전남', '경남')
ORDER BY addr;

/* 검색 : like 패턴*/
SELECT *
FROM member
WHERE mem_name LIKE '우%'; /* '우'로 시작하는 이름 검색 */

SELECT *
FROM member
WHERE mem_name LIKE '%핑크'; /* '핑크'로 끝나는  이름 검색 */

SELECT *
FROM member
WHERE mem_name LIKE '__핑크'; /* _ 하는 한글짜*/

/* p121 */
/* 하위질의(subquery)*/
SELECT height
FROM member
WHERE mem_name = '에이핑크';

SELECT mem_name, height
FROM member
WHERE height > 164;

SELECT mem_name, height
FROM member
WHERE height > (SELECT height
					FROM member
					WHERE mem_name = '에이핑크');
					
/* 블랙핑크가 주문한 상품이름을 검색하시오.*/
SELECT mem_id
FROM member
WHERE mem_name = '블랙핑크';

SELECT mem_id, prod_name 
FROM buy
WHERE mem_id = (SELECT mem_id
					 FROM member
                WHERE mem_name = '블랙핑크');

/*키가 165이상 그룹들이 구매한 상품 목록을 검색*/
SELECT distinct(prod_name)  /* distinct 중복제거 함수 */
FROM buy
WHERE mem_id IN (SELECT mem_id
                 FROM member
					  WHERE height >= 165);



					















