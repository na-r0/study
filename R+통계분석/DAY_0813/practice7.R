# chap 9

adhd <- data.frame(score=c(95,105,98,103,107,110,125,105,113,120),
                   therapy=c(rep("A", 5), rep("B", 5)))
adhd

# 집단 간 분산
g <- 2
ng <- c(5,5)
mg <- c(mean(adhd$score[1:5]),mean(adhd$score[6:10]))
m <- mean(adhd$score)
mstr <- sum(((mg-m)^2*ng)/(g-1))
mstr

# F-분포
x <- seq(0,4,length=100)
F.1 <- df(x,df1=1,df2=30)
F.5 <- df(x,df1=5,df2=25)
F.25 <- df(x,df1=25,df2=5)
plot(x,F.1,lty=1,lwd=3,col='black',type='l',ylim=c(0,1))
lines(x,F.5,lty=2,lwd=3,col='blue')
lines(x,F.25,lty=3,lwd=3,col='red')

# 특정 F값에 대응되는 유의확률
# q=9.59
pf(9.59,df1=1,df=8,lower.tail = F)

# 특정 확률에 대응되는 F값
# p=0.05
qf(0.05,df1=1,df=8,lower.tail = F)

adhd.aov <- aov(score~therapy,data=adhd)
summary(adhd.aov)

tapply(adhd$score, adhd$therapy, mean)


# chap 10

# 일원 분산분석
sprays.aov <- aov(count~spray,data=InsectSprays)
sprays.aov

summary(sprays.aov)

model.tables(sprays.aov,type='mean')

model.tables(sprays.aov,type='effects')


# 사후검정 - 다중비교
sprays.compare <- TukeyHSD(sprays.aov)
sprays.compare

# 다중비교 결과 확인
library(multcomp)
glht(model=sprays.aov,linfct=mcp(spray='Tukey'))

plot(cld(glht(model=sprays.aov,linfct=mcp(spray='Tukey')),level=0.5))

library(car)
qqPlot(InsectSprays$count,pch=20,col='deepskyblue',id=FALSE,
       main='Q-Q Plot',xlab='Theoretical Quantiles',ylab='Sample Quantiles')

# 샤피로-월크 검정을 통해 정규성 충족 여부 통계적으로 검정
shapiro.test(InsectSprays$count)

# 이상점의 존재여부 통계적으로 검정
outlierTest(sprays.aov)

# 집단 간 분산의 동일성 여부 검정
# 1. 레벤 검정
leveneTest(count~spray,data=InsectSprays)

# 2. 바틀렛 검정
bartlett.test(count~spray,data=InsectSprays)

# oneway.test()
oneway.test(count~spray,data=InsectSprays)



# 이원분산분석
str(ToothGrowth)
ToothGrowth$dose <- factor(ToothGrowth$dose,levels=c(0.5,1.0,2.0),
                           labels=c('low','mid','high')) # 범주형
ToothGrowth[seq(1,60,5),]

# 각 집단별 요약통계량 계산
with(ToothGrowth,tapply(len,list(supp,dose),length))
with(ToothGrowth,tapply(len,list(supp,dose),mean))
with(ToothGrowth,tapply(len,list(supp,dose),sd))

# aov()를 이용하여 이원분산분석 수행
ToothGrowth.aov <- aov(len~supp*dose,data=ToothGrowth)
ToothGrowth.aov <- aov(len~supp+dose+supp:dose,data=ToothGrowth)
summary(ToothGrowth.aov)

# 각 효과에 따른 요약통계량 계산
model.tables(ToothGrowth.aov,type='means')

boxplot(len~supp*dose,data=ToothGrowth,col=c('deeppink','yellowgreen'),las=1)

# means plot
library(gplots)
plotmeans(len~interaction(supp,dose,sep=' '),data=ToothGrowth,
          connect = list(c(1,3,5),c(2,4,6)),col=c('red','green3'),
          lwd=3)

# TukeyHDS()를 이용한 사후분석
TukeyHSD(ToothGrowth.aov)

TukeyHSD(ToothGrowth.aov,which = c('dose'),conf.level = 0.99)



# chap 12
# 고양이의 몸무게와 심장무게 간의 상관관계
with(cats,cor.test(Bwt,Hwt))
with(cats,cor.test(Bwt,Hwt,alternative='greater',conf.level=0.99))
with(cats,cor.test(~Bwt+Hwt))

# 포뮬러 형식 이용
cor.test(~Bwt+Hwt,data=cats)
# 암컷고양이에 대해서만
cor.test(~Bwt+Hwt,data=cats,subset = (Sex=='F'))

# 3개 이상 변수 간의 상관계수 유의섬 검정
library(psych)
corr.test(iris[,-5])

# 상관계수 95% 신뢰구간 출력
print(corr.test(iris[,-5]),short = F)

# 산점도 행렬 그래프
library(psych)
pairs.panels(state.x77,pch=21,bg='red',hist.col = 'gold')

library(corrgram)
corrgram(state.x77,order=T,lower.panel = panel.shade,upper.panel = panel.cor,
         text.panel = panel.txt)

# 편상관관계
# 실린더 개수와 무게의 영향을 통제한 연비와 마력 간의 편상관계수
mtcars2 <- mtcars[,c('mpg','cyl','hp','wt')]
cor(mtcars2[,c(1,3)])
mtcars2
library(ggm)
pcor(c('mpg','hp','cyl','wt'),cov(mtcars2))
pcor(c(1,3,2,4),cov(mtcars2))

# 편상관계수에 대한 유의성 검정
pcor.test(pcor(c('mpg','hp','cyl','wt'),cov(mtcars2)),q=2,n=nrow(mtcars2))

library(ppcor)
pcor(mtcars2)

pcor.test(mtcars2['mpg'],mtcars2['hp'],mtcars2[c('cyl','wt')])




























