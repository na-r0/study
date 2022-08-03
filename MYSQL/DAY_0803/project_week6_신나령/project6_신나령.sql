create database project6;

use project6;

# 1. 2010년~2020년까지 장애인 고용 이행률
select * from duty_employment_state;

create table new_duty_employment_state
	(years INT, # 연도
	rateOFimplementation float# 장애인 고용 이행률
	);

# 새로운 테이블에 필요한 데이터만 뽑아 insert 시켜줌, 시각화할 때 사용
insert new_duty_employment_state(years,rateOFimplementation)
select 년도, (이행사업체수/사업체수)*100
from duty_employment_state; 

# 2. 2021년 장애인 의무고용률과 기관별 비교
select * from duty_employment_company_state;

create table new_duty_employment_company_state
	(instition CHAR(15),
	rateOFimplementation float
	);

# 새로운 테이블에 필요한 데이터만 뽑아 insert 시켜줌, 시각화할 때 사용
insert new_duty_employment_company_state(instition,rateOFimplementation)
select 기관, 고용률
from duty_employment_company_state; 

# 3. 2020년 장애인고용 기업별 만족도
select * from satisfaction_survey;

# 4. 2020년 장애인고용에 대한 고용/미고용 기업 인식
select * from employment_perception;

# 5. 2020년 장애인 고용 증진을 위해 고용/미고용 기업 필요한 사항
select * from employment_essential_items;

# 번외) 장애인고용 연계고용사업장 도급품목
select * from information_workplace_charge_reduction;

create table new_information_workplace_charge_reduction
	(contractItem CHAR(30)
	);

# 새로운 테이블에 필요한 데이터만 뽑아 insert 시켜줌, 시각화할 때 사용
insert new_information_workplace_charge_reduction(contractItem)
select 도급품목
from information_workplace_charge_reduction; 

