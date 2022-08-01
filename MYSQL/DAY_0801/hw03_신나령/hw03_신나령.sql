# SQL 과제 #3
# 1. 아래 2개의 테이블을 생성하고, 주어진 문제에 대한 sql문장을 작성하시오.

# 데이터베이스 생성
create database shoppingmall;

use shoppingmall;

# user_table 테이블 생성
create table user_table
	(userID CHAR(8), # 사용자 ID
	userName VARCHAR(10), # 이름
	birthYear INT, # 출생년도
	addr CHAR(2), # 지역(경기,서울, 경남, 2글자)
	mobile1 CHAR(3), # 휴대폰 국번
	mobile2 CHAR(8), # 휴대폰 나머지 전화번호 (하이픈 제외)
	height smallint, # 키
	mDate DATE, # 회원 가입일
	constraint pk_userID primary key (userID)
	);

# buy_table 테이블 생성
create table buy_table
	(num INT auto_increment, # 순번
	userID CHAR(8), # 아이디 (FK)
	prodName CHAR(6), # 물품명
	groupName CHAR(4), # 분류
	price INT, # 단가
	amount SMALLINT, # 수량
	constraint pk_num primary key (num),
	constraint fk_userID foreign key (userID)
	references user_table(userID)
	);

/* 주피터 실행 부분 따로 주석 처리
insert into user_table (userID, userName, birthYear, addr, mobile1, mobile2, height, mDate)
values
    ('KHD','강호동',1970,'경북','011','22222222',182,'2007-07-07'),
    ('KJD','김제동',1974,'경남',NULL,NULL,173,'2013-03-03'),
    ('KKJ','김국진',1965,'서울','019','33333333',171,'2009-09-09'),
    ('KYM','김용만',1967,'서울','010','44444444',177,'2015-05-05'),
    ('LHJ','이휘재',1972,'경기','011','88888888',180,'2006-04-04'),
    ('LKK','이경규',1960,'경남','018','99999999',170,'2004-12-12'),
    ('NHS','남희석',1971,'충남','016','66666666',180,'2017-04-04'),
    ('PSH','박수홍',1970,'서울','010','00000000',183,'2012-05-05'),
    ('SDY','신동엽',1971,'경기',NULL,NULL,176,'2008-10-10'),
    ('YJS','유재석',1972,'서울','010','11111111',178,'2008-08-08');
    
select * from user_table;


insert into buy_table (num, userID, prodName, groupName, price, amount)
values
	(null,'KHD','운동화',null,30,2),
	(null,'KHD','노트북','전자',1000,1),
	(null,'KYM','모니터','전자',200,1),
	(null,'PSH','모니터','전자',200,5),
	(null,'KHD','청바지','의류',50,3),
	(null,'PSH','메모리','전자',80,10),
	(null,'KJD','책','서적',15,5),
	(null,'LHJ','책','서적',15,2),
	(null,'LHJ','청바지','의류',50,1),
	(null,'PSH','운동화',null,30,2),
	(null,'LHJ','책','서적',15,1),
	(null,'PSH','운동화',null,30,2);
	


# 2. 두 테이블을 내부 조인(buy_table.useID와 user_table.userID)한 다음, 아래의 결과와 같이 출력이 되도록 SQL 쿼리를 작성하시오.
# 1) 내부 조인한 결과에 ‘연락처’ 컬럼 추가
select ut.userName, bt.prodName, ut.addr, concat(ut.mobile1,ut.mobile2) as '연락처'
from user_table as ut
	inner join buy_table as bt 
	on bt.userID=ut.userID;

# 2) userID가 KYM인 사람이 구매한 물건과 회원 정보 출력
select ut.userID, ut.userName, bt.prodName, ut.addr, concat(ut.mobile1,ut.mobile2)
from user_table as ut
	inner join buy_table as bt
	on bt.userID=ut.userID
where ut.userID='KYM';

# 3) 전체 회원이 구매한 목록을 회원 아이디 순으로 정렬
select ut.userID, ut.userName, bt.prodName, ut.addr, concat(ut.mobile1,ut.mobile2) as '연락처'
from user_table as ut
	inner join buy_table as bt 
	on bt.userID=ut.userID
order by ut.userID;

# 4) 쇼핑몰에서 한 번이라도 구매한 기록이 있는 회원 정보를 회원 아이디 순으로 출력 (distinct 사용)
select distinct ut.userID, ut.userName, ut.addr
from user_table as ut
	inner join buy_table as bt 
	on bt.userID=ut.userID;

# 5) 쇼핑몰 회원 중에서 주소가 경북과 경남인 회원 정보를 회원 아이디 순으로 출력
select ut.userID, ut.userName, ut.addr, concat(ut.mobile1,ut.mobile2) as '연락처'
from user_table as ut
	inner join buy_table as bt
	on bt.userID=ut.userID
where addr in ('경북','경남')
order by ut.userID;
*/


