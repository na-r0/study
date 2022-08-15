
# chap 13 선형회귀의 이해
library(HistData)
df <- GaltonFamilies
model <- lm(childHeight~midparentHeight,data=df)
model

plot(df$midparentHeight,df$childHeight,pch=19,
     col=adjustcolor('blue',alpha.f = 0.3))
abline(model,col='tomato',lty=1,lwd=3)

# 자녀의 성별에 따른 키의 분포
library(HistData)
color.m <- adjustcolor("steelblue", alpha.f = 0.3)
color.f <- adjustcolor("orange", alpha.f = 0.3)
with(df, plot(midparentHeight, childHeight, pch = 19, 
            col = ifelse(gender == "male", color.m, color.f))) 
model.m <- lm(childHeight ~ midparentHeight, 
                data = subset(df, gender == "male")) 
abline(model.m, col = "blue", lty = 1, lwd = 3) 
model.f <- lm(childHeight ~ midparentHeight, 
                data = subset(df, gender == "female")) 
abline(model.f, col = "tomato", lty = 1, lwd = 3)

# 선형회귀모델
set.seed(14)
x <- runif(n=7,min = 0,max=10)
y <- 3+2*x+rnorm(n=7,mean=0,sd=5)
round(x,2)
round(y,2)

model <- lm(y~x,data=df)
coef(model)

intercept <- coef(model)[1]
slope <- coef(model)[2]
y.hat <- intercept+slope*x
round(y.hat,2)
r <- y - y.hat
round(r,2)

# 모형 적합
plot(x,y,pch=19,col='steelblue',xlim=c(2,10),ylim=c(5,30))
abline(model,lwd=2,col='steelblue')
abline(a=intercept+5,b=slope,lty=2,lwd=2,col='orange')
abline(a=intercept-5,b=slope,lty=2,lwd=2,col='orange')
abline(a=intercept,b=slope+1,lty=3,lwd=2,col='violet')
abline(a=interce pt,b=slope-1,lty=3,lwd=2,col='violet')
legend(x=2,y=30,lwd=2,col='steelblue',
       legend = paste('y =',intercept,'+',slope,'* x'))



# chap 14 회귀분석의 유형
# 단순선형회귀: 교육기간과 평균소득 간
library(car)
str(Prestige)  

df <- Prestige
plot(income~education,data=df,pch=19,col='steelblue')

cor(df$education,df$income)

formula <- income ~ education
lm(formula = formula,data=df)

model <- lm(formula = formula,data=Prestige)
abline(model,lwd=2,col='rosybrown')

summary(model)

summary(resid(model)) # residuals
confint(model) # 신뢰구간의 coefficients
anova(model) #분산분석



# 다중회귀분석
# income ~ education + women + prestige
df <- subset(Prestige,select=c(2,1,3,4))
cor(df)

plot(df,pch=19,col='gold')

formula = income ~ education+women+prestige
lm(formula=formula,data=df)

model <- lm(income ~ ., data=df)
summary(model)

library(stargazer)
stargazer(model,type='text',no.space = T)



# 다항회귀분석
# 교육기간과 평균소득의 관계를 직선보다 더 잘 설명하는 곡선이 있을까
formula <- income ~ education+I(education^2)
lm(formula=formula,data=Prestige)

model <- lm(formula = formula,data=Prestige)
summary(model)

plot(income~education,data=Prestige,pch=19,col='gold2')
library(dplyr)
with(Prestige,lines(arrange(data.frame(education,fitted(model)),
                            education),lty=1,lwd=3,col='orange'))




# chap 15 회귀모델의 설명력
df <- subset(mtcars,select = 1:6)
cor(df)

library(car)
scatterplotMatrix(df,pch=19,col='steelblue',cex=1.2,
                  regLine = list(method=lm,lwd=2,col='tomato'),
                  smooth=list(smoother=loessLine,spread=F,
                              lwd.smooth=2,col.smooth='orange'))


# 결졍계수
model <- lm(mpg ~ cyl+disp+hp+drat+wt,data=df)
summary(model)

# hp, wt
model <- lm(mpg ~hp+wt,data=df)
summary(model)

# wt
model <- lm(mpg ~wt,data=df)
summary(model)

plot(model)


# 회귀모델 선택
# 마력과 무게가 포함된 모델과 배기량과 기어비가 포함된 모델의 적합도 비교
mtcars.lm1 <- lm(mpg ~ hp+wt,data=mtcars)
mtcars.lm2 <- lm(mpg ~ hp+wt+disp+drat,data=mtcars)
anova(mtcars.lm1,mtcars.lm2)

# AIC 지표
AIC(mtcars.lm1,mtcars.lm2)



# mtcars 데이터셋에서 '후진선택법'으로 회귀모델 구축
mtcars.lm <- lm(mpg ~ hp+wt+disp+drat,data=mtcars)
step(mtcars.lm,direction = 'backward')



# 더미변수
str(InsectSprays)
levels(InsectSprays$spray)

sprays.lm <- lm(count~spray,data=InsectSprays)
summary(sprays.lm)

contrasts(InsectSprays$spray)





# chap 16 선형모델의 일반화
# 포아송회귀분석
x <- 0:100
pdf <- dpois(x,lambda = 10)
plot(x,pdf,type='l',main='Poisson Dist')

# 항뇌전증제를 투약 후 8 주 동안 발생하는 발작횟수에 미치는 영향 분석
# 분석에 필요한 네 가지 변수만을 추출하여 요약통계량 확인
library(robust)
data("breslow.dat")
str(breslow.dat)

seizure <- breslow.dat[c('Base','Age','Trt','sumY')]
summary(seizure)

hist(seizure$sumY,breaks = 20,col='cornflowerblue')


# 포아송 회귀분석 수행 -> glm()
seizure.poisson <- glm(sumY ~ Base+Age+Trt,data=seizure,family=poisson)
summary(seizure.poisson)



# 이항로지스틱 회귀분석
e <- exp(1)
z <- seq(-6,6,length=200)
p <- 1/(1+e^(-z))
plot(z,p,type='l',main='PDF of Logistic Fun')


























