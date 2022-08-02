create database project6;

use project6;

select * from duty_employment_state;
select * from duty_employment_company_state;
select * from information_workplace_charge_reduction;


# 1. 2010년~2020년까지 장애인 고용 이행률
create table new_duty_employment_state
	(years INT, # 연도
	rateOFimplementation float # 장애인 고용 이행률
	);

# 새로운 테이블에 필요한 데이터만 뽑아 insert 시켜줌, 시각화할 때 사용
insert new_duty_employment_state(years,rateOFimplementation)
select 년도, (이행사업체수/사업체수)*100
from duty_employment_state; 

# 2. 2021년 장애인 의무고용률과 기관별 비교
create table new_duty_employment_company_state
	(instition CHAR(15),
	rateOFimplementation float
	);
	
-- insert into new_duty_employment_company_state(class)
-- 	values ('정부'),('정부'),('정부'),('정부'),('정부'),('정부'),('정부'),('정부'),('공공'),('공공'),('공공'),('공공'),('공공'),
-- 		('민간'),('민간'),('민간'),('민간'),('민간'),('민간');
-- 
-- alter table new_duty_employment_company_state 
--     add instition CHAR(15) not null,
--     add rateOFimplementation float not null;

# 새로운 테이블에 필요한 데이터만 뽑아 insert 시켜줌, 시각화할 때 사용
insert new_duty_employment_company_state(instition,rateOFimplementation)
select 기관, 고용률
from duty_employment_company_state; 

# 3. 장애인고용 기업별 만족도
# 연도별로 분리
create table satisfaction_survey1
select * from satisfaction_survey
where 시점=2018;

create table satisfaction_survey2
select * from satisfaction_survey
where 시점=2019;

create table satisfaction_survey3
select * from satisfaction_survey
where 시점=2020;

# 4. 장애인고용 부담금감면 연계고용사업장 정보 도급품목
create table new_information_workplace_charge_reduction
	(contractItem CHAR(30)
	);
	
insert new_information_workplace_charge_reduction(contractItem)
select 도급품목
from information_workplace_charge_reduction; 

