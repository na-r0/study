
# chap 7 두 집단의 차이검정

# 단일표본 평균검정
# 귀무가설: 호주 대학생 전체의 평균 키는 175다
# 대립가설: 호주 대학생 전체의 평균 키는 175가 아니다
library(MASS)
t.test(survey$Height,mu=175)

# 귀무가설: 호주 대학생 전체의 평균 키는 171다
# 대립가설: 호주 대학생 전체의 평균 키는 171가 아니다
t.test(survey$Height,mu=171,conf.level = 0.99)

# 귀무가설: 호주 대학생 전체의 평균 키는 173보다 크지 않다
# 대립가설: 호주 대학생 전체의 평균 키는 173보다 크다
t.test(survey$Height,mu=173,alternative = 'greater')

# 귀무가설: 호주 대학생 전체의 평균 키는 173보다 작지 않다
# 대립가설: 호주 대학생 전체의 평균 키는 173보다 작다
t.test(survey$Height,mu=174,alternative = 'less')

# 독립표본 평균검정
# cats 데이터셋
with(cats,tapply(Bwt,INDEX=list(Sex),FUN=mean))
with(cats,tapply(Hwt,INDEX=list(Sex),FUN=mean))

# 귀무가설: 고양이의 몸무게는 성별에 따른 차이가 없다
# 대립가설: 고양이의 몸무게는 성별에 따라 차이가 있다
t.test(formula=Bwt~Sex,data=cats)

# 귀무가설: 고양이의 심장무게는 성별에 따른 차이가 없다
# 대립가설: 고양이의 심장무게는 성별에 따라 차이가 있다
t.test(formula=Hwt~Sex,data=cats)


# 대응표본 평균검정
# sleep 데이터셋
spread(sleep,key=group,value=extra)

# 귀무가설: 약물이 효과가 없다
# 대립가설: 약물이 효과가 있다
t.test(extra~group,data=sleep,paired=TRUE)



# chap 8 카이제곱 검정
survivors <- matrix(c(1443, 151, 47, 1781, 312, 135), ncol=2)
dimnames(survivors) <- list("Status"=c("minor injury", "serious injury", "dead"),
                            "Seatbelt"=c("With Seatbelt", "Without Seatbelt"))
addmargins(survivors)
addmargins(prop.table(addmargins(survivors, 2),2),1)


# 독립성 검정
Titanic.margin <- margin.table(Titanic,margin=c(4,1))
Titanic.margin

addmargins(Titanic.margin)

addmargins(prop.table(addmargins(Titanic.margin,2),2),1)

chisq.test(Titanic.margin)

library(vcd)
assocstats(Titanic.margin)

mosaic(Titanic.margin , shade = TRUE, legend = TRUE)
mosaic(~Survived+Class, data=Titanic.margin , shade= TRUE, legend =TRUE)

chisq.test(survey$Fold,survey$Sex)


# 머리색이 갈색 , 검은색 , 금발이 각각 50%, 25%, 15% 라는 주장에 대한 적합성 검정
hairs <- margin.table(HairEyeColor,margin=1)
hairs

chisq.test(hairs,p=c(0.25,0.50,0.10,0.15))


# survey 데이터셋 : 비흡연자 70%, 나머지 유형 흡연자가 각각 10% 라는 주장에 대한 적합성 검정
smokers <- table(survey$Smoke)
smokers
chisq.test(smokers,p=c(0.1,0.7,0.1,0.1))







