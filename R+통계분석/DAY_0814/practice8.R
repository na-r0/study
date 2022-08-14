
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


