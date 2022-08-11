# chap 7

str(sleep)
sleep

library(tidyr)
wide.df <- spread(sleep,key=group,value=extra) # 포맷 바꾸기
summary(wide.df)

# extra 컬럼을 group으로 평균
tapply(sleep$extra, INDEX=list(sleep$group), FUN=mean)

t.test(extra~group,data=sleep,paired=T) # 롱포맷
t.test(wide.df$`1`,wide.df$`2`,paired = T) # 와이드포맷




# chap 8

# 카이제곱 분포
v <- rchisq(n=10000,df=1)
hist(v,col='orange')

x <- seq(0,15,length=200)
# 자유도에  따라
curve(dchisq(x,df=1),0,15,col='red',lwd=2,lty=1)
curve(dchisq(x,df=5),0,15,add=T,col='steelblue',lwd=2,lty=2)
curve(dchisq(x,df=10),0,15,add=T,col='brown',lwd=2,lty=3)


qchisq(p=0.95,df=1)
qchisq(p=0.05,df=1,lower.tail = F)

pchisq(q=2.5,df=1)
pchisq(q=3.841459,df=1)
pchisq(q=5,df=1,lower.tail = F)




mt <- matrix(c(1443,151,47,1781,312,135),nrow=3)
mt

df <- data.frame(mt)
colnames(df) <- c('with','without')
rownames(df) <- c('minor injury','serious injury','dead')
df

# 환자 상태별 기대빈도
oij <- c(df$with,df$without)
eij <- c(1367,196.9,77.1,1855.9,267.4,104.7)

chisqr <- sum((oij-eij)^2/eij)


Titanic

# class별 생존
tb<-margin.table(Titanic,margin=c(4,1))
chisq.test(tb)

# 성별 생존
tb<-margin.table(Titanic,margin=c(4,2))
chisq.test(tb)

# 어린이, 어른 생존
tb<-margin.table(Titanic,margin=c(4,3))
chisq.test(tb)






#chap 9
v <- rf(n=10000,df1=1,df2=30)
hist(v,col='steelblue')

x <- seq(0,15,length=200)
curve(df(x,df1=1,df2=30),0,15,col='tomato',lwd=2,lty=1)
curve(df(x,df1=5,df2=80),0,15,add=T,col='blue',lwd=2,lty=1)
curve(df(x,df1=10,df2=80),0,15,add=T,col='magenta',lwd=2,lty=2)

qf(p=0.95,df1=1,df2=30)
pf(q=4.170877,df1=1,df2=30,lower.tail = F)







# chap 10

df <- InsectSprays
str(df)
table(df$spray)

round(tapply(df$count,list(df$spray),mean),3)

boxplot(count~spray,data=df,col=2:7)

aov.result <- aov(count~spray,data=df)
summary(aov.result)

# 사후검정 - 항목간의 검정
TukeyHSD(aov.result)

library(gplots)
plotmeans(count~spray,data=df,col='tomato',barcol = 'skyblue',
          lwd=3,barwidth = 3) # 평균 그래프

model.tables(aov.result,type='mean')
model.tables(aov.result,type='effect') # 전체 평균보다 높낮

plot(TukeyHSD(aov.result),col='blue',las=1)

library(multcomp)


library(car)
qqPlot(df$count,pch=20,col='skyblue')
# 샤피로 윌크 검정을 통해 정규성 충족 여부를 통계적으로 검정
shapiro.test(df$count)

# 등분산테스트
leveneTest(count~spray,data=df)
bartlett.test(count~spray,data=df)

# 일원배치분산
oneway.test(count~spray,data=df)





df <- ToothGrowth

str(df)
unique(df$dose)

df$dose <- factor(df$dose,labels = c('low','mid','high'))
str(df)

with(df,tapply(len, list(SUPP=supp,DOSE=dose), mean))

boxplot(len~supp*dose,data=df,col=c('orange','yellow'))
boxplot(len~supp+dose+supp:dose,data=df,col=c('orange','yellow'))

# 이원배치분산 분석
aov.result <- aov(len~supp*dose,data=df)
summary(aov.result)

TukeyHSD(aov.result)
plot(TukeyHSD(aov.result),las=1)




# chap 12
cor(cats$Bwt,cats$Hwt,method = 'spearman') # 스피어만 상관계수
cor(cats$Bwt,cats$Hwt,method = 'kendall') # 켄달 상관계수





getwd()
bike <- read.csv('DAY_0810/bike/train.csv')
cor(bike$temp,bike$count)
cor(bike$temp,bike$count,method = 'spearman')
cor(bike$temp,bike$count,method = 'kendall')

p.test(temp~count,data=bike,paired=T)
shapiro.test(bike$temp[1:5000])








# chap 14

library(HistData)
df <- GaltonFamilies
str(df)

cor(df$midparentHeight,df$childHeight)
plot(childHeight~midparentHeight,data=df,col=adjustcolor('steelblue',alpha=0.3),pch=19)
plot(jitter(childHeight)~jitter(midparentHeight),data=df,col=adjustcolor('steelblue',alpha=0.5),pch=19)

# 선형모델 - 절편, 기울기 찾아줌
model <- lm(childHeight ~ midparentHeight,data=df)
abline(model,col='tomato',lwd=3)


x <- runif(n=100,min=0,max=100)
y <- 3*x+5+rnorm(n=100,0,20)
plot(x,y,pch=19,col='skyblue')

cor(x,y)
model <- lm(y~x) # y로 x를 예측
abline(model,col='tomato',lwd=3) # 직선
summary(model)


abline(a=1,b=5,col='red',lwd=1,lty=2) # a: 기울기, b: 절편




















