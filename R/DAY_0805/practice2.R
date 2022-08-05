# 연습문제 6.1
st <- data.frame(state.x77)
str(st)
st
# 소득 평균
mean(st$Income)
# 인구가 10,000보다 큰 주의 인구, 소득은?
st[st$Population>10000,1:2]
# 플로리다 주의 인구와 소득은?
st[rownames(st)=='Florida',1:2]
# 인구가 1,000보다 작고, 소득이 4,436보다 작은 주의 모든 정보
st[(st$Population<1000)&(st$Income<4436),]
# 문맹률의 평균을
# 소득이 5,000보다 작은 주에 대해서 구하라
mean(st[st$Income<5000,]$Illiteracy)
# 소득이 5,000보다 큰 주에 대해서 구하라
mean(st[st$Income>5000,]$Illiteracy)

# 연습문제 6.2
# 인구가 1,000보다 작고, 소득이 5,000보다 작은 주의 모든 정보
st[(st$Population<1000)&(st$Income<5000),]



# 연습문제 7.1
library(mice)
nh <- nhanes
str(nh)
# NA가 포함되지 않은 관측값들
nh[complete.cases(nh),]
# NA가 포함된 관측값들
nh[!complete.cases(nh),]
# NA가 포함된 관측값들의 개수
sum(!complete.cases(nh))
# 각각의 변수별로 NA의 개수는 각각 몇 개
sum(is.na(nh$age))
sum(is.na(nh$bmi))
sum(is.na(nh$hyp))
sum(is.na(nh$chl))
# 결측치의 분포 확인
library(VIM)
aggr(nh,numbers=T,prop=F)

# 연습문제 7.2
# Petal.Length 박스플롯
boxplot(data=iris,Petal.Length~Species,
        col='orange',
        border='red',
        pch=19)
# setosa 품종에서 Petal.Length 의 이상치
out.set <- boxplot.stats(iris$Petal.Length[iris$Species=='setosa'])$out
out.set
# versicolor 품종에서 Petal.Length 의 이상치를
out.ver <- boxplot.stats(iris$Petal.Length[iris$Species=='versicolor'])$out
out.ver
# df데이터셋에서 out.set, out.ver에 저장된 이상치를 가진
# 관측값에 대해 관측값을 NA로 변경한 후 NA 값을 가진 관측값을 제거
df <- iris
df[df$Petal.Length==out.set,] <- NA
df[df$Petal.Length==out.set,]
nrow(df)

df.no.outlier <- na.omit(df)
nrow(df.no.outlier)



# 연습문제 8.1
st <- data.frame(state.x77)
# Population을 기준으로 오름차순으로 정렬
st[order(st$Population),]
# Income을 기준으로 내림차순 정렬
st[order(st$Income,decreasing = T),]
# Illiteracy를 기준으로 오름차순으로 정렬하되
# 문맹률이 같은 주에 대해서는 Population의 내림차순으로 정렬
st[order(st$Illiteracy,-st$Population),]

# 연습문제 8.2
mt <- mtcars
# mtcars 데이터셋을 gear의 개수에 따라 그룹을 나누
mtsp <- split(mt,f=mt$gear)
# mtcars 데이터셋에서 gear의 개수가 3인 그룹과 4인 그룹을 합
df.34 <- rbind(mtsp$`3`,mtsp$`4`)
df.34

# 연습문제 8.3
# airquality에서 1,2,3,4번 column을 추출하여 df에 저장
df <- subset(airquality,select = (1:4))
df
# 위에서 추출한 변수에 대해 월별로 평균
# aggregate() 함수
# NA값에 대해서는 na.rm=T 로 매개변수값을 지정
aggregate(df,by=list(Month=airquality$Month),FUN=mean,na.rm=T)
# 위에서 추출한 변수에 대해 일별로 표준편차
df.day <- aggregate(df,by=list(Day=airquality$Day),FUN=sd,na.rm=T)
df.day



# chap 9 palmerpenguins dataset
pg <- data.frame(penguins)
str(pg)
# 각 범주의 비율
prop.table(table(pg$species))
prop.table(table(pg$island))
prop.table(table(pg$sex))
# gmodels 패키지의 CrossTable ()함수를 이용하여 교차표
library(gmodels)
CrossTable(table(pg$species),table(pg$island))


table(pg$species)


